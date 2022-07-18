using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Web;
using System.Windows.Media.Imaging;

namespace E_Shop_Test_Servers
{
    internal class Server
    {
        public HttpListener httpListener;
        string BaseDirectory = Directory.GetCurrentDirectory();
        public Server()
        {
            httpListener = new HttpListener();
            httpListener.Prefixes.Add("http://127.0.0.1:6025/");
            httpListener.Prefixes.Add("http://127.0.0.1:6026/");
        }
        async public void ServerStartListenRequests()
        {
            httpListener.Start();
            while (true)
            {
                try
                {
                    var RequestContent = httpListener.GetContext();
                    var Request = RequestContent.Request;
                    await Task.Run(() => {
                        switch (Request.Url.AbsolutePath)
                        {
                            case "/get_user":
                                if (Request.HttpMethod == "GET")
                                {
                                    string login = getParamsValue("login", RequestContent);
                                    string password = getParamsValue("password", RequestContent);
                                    if (DBConnection.GetContext().Users.Where(x => x.Login == login && x.Password == password).Count() == 1)
                                    {
                                        sendAnswer(DBConnection.GetContext().Users.Where(x => x.Login == login).First().Role.ToString(), 200, RequestContent);

                                    }
                                    else
                                    {
                                        sendAnswer("NotExists", 404, RequestContent);
                                    }

                                }
                                break;
                            case "/get_prods":
                                if (Request.HttpMethod == "GET")
                                {
                                    try
                                    {
                                        var prods = DBConnection.GetContext().Products.ToList();

                                        var json = JsonSerializer.Serialize<List<Products>>(prods);
                                        sendAnswer(json, 200, RequestContent);
                                    }
                                    catch
                                    {
                                        sendAnswer(null, 404, RequestContent);
                                    }

                                }
                                break;
                            case "/get_prod":
                                if (Request.HttpMethod == "GET")
                                {
                                    try
                                    {
                                        int id = Convert.ToInt32(RequestContent.Request.Url.Query.Remove(0, 1).Split('=')[1]);
                                        var prods = DBConnection.GetContext().Products.Where(x=>x.ID==id).FirstOrDefault();

                                        var json = JsonSerializer.Serialize<Products>(prods);
                                        sendAnswer(json, 200, RequestContent);
                                    }
                                    catch
                                    {
                                        sendAnswer(null, 404, RequestContent);
                                    }

                                }
                                break;
                            case "/get_image":
                                if (Request.HttpMethod == "GET")
                                {
                                    try
                                    {
                                        int id = Convert.ToInt32(RequestContent.Request.Url.Query.Remove(0, 1).Split('=')[1]);
                                        var json = JsonSerializer.Serialize<byte[]>(imageConverter(new BitmapImage(new Uri(System.IO.Path.GetFullPath(BaseDirectory+@"\images\" + DBConnection.GetContext().Images.Where(x => x.ID == id).FirstOrDefault().Path)))));
                                        sendAnswer(json, 200, RequestContent);
                                    }
                                    catch
                                    {
                                        var json = JsonSerializer.Serialize<byte[]>(imageConverter(new BitmapImage(new Uri(System.IO.Path.GetFullPath(BaseDirectory+@"\images\no_image.png")))));
                                        sendAnswer(json, 200, RequestContent);
                                    }
                                }
                                break;
                            case "/redact_product":
                                if (Request.HttpMethod=="PUT")
                                {
                                 var context=DBConnection.GetContext();
                                    var data = JsonSerializer.Deserialize<Products>(RequestContent.Request.InputStream) as Products;

                                    Products newProduct = data;
                                    context.Products.Where(x => x.ID == newProduct.ID).FirstOrDefault().Name = newProduct.Name;
                                    context.Products.Where(x => x.ID == newProduct.ID).FirstOrDefault().Count=newProduct.Count;
                                    context.Products.Where(x => x.ID == newProduct.ID).FirstOrDefault().Article = newProduct.Article;
                                    context.Products.Where(x => x.ID == newProduct.ID).FirstOrDefault().Description = newProduct.Description;
                                    context.Products.Where(x => x.ID == newProduct.ID).FirstOrDefault().Image= context.Images.Max(x => x.ID); 
                                    context.SaveChanges();
                                }
                                break;
                            case "/save_image":
                                {
                                 if(Request.HttpMethod=="POST")
                                    {
                                        var data = JsonSerializer.Deserialize<byte[]>(RequestContent.Request.InputStream) as byte[];
                                        string filename = $"{DateTime.Now}image.png".Replace(':', '_');
                                        using (var ms = new MemoryStream(data))
                                        {
                                            BitmapImage image = new BitmapImage();
                                            image.BeginInit();
                                            image.CacheOption = BitmapCacheOption.OnLoad;
                                            image.StreamSource = ms;
                                            image.EndInit();
                                            BitmapEncoder encoder = new PngBitmapEncoder();
                                            encoder.Frames.Add(BitmapFrame.Create(image));

                                            using (var fileStream = new System.IO.FileStream(BaseDirectory+@"\images\" + filename, System.IO.FileMode.Create))
                                            {

                                                encoder.Save(fileStream);
                                            }
                                        }
                                        int ID = DBConnection.GetContext().Images.Max(x => x.ID);
                                        ID += 1;
                                        DBConnection.GetContext().Images.Add(new Images() { ID = ID, Path = filename });
                                        DBConnection.GetContext().SaveChanges();
                                    }

                                }
                                break;
                            case "/delete_product":
                                {
                                    if(Request.HttpMethod=="DELETE")
                                    {
                                        int id = Convert.ToInt32(RequestContent.Request.Url.Query.Remove(0, 1).Split('=')[1]);
                                        var context = DBConnection.GetContext();
                                        context.Products.Remove(DBConnection.GetContext().Products.Where(x => x.ID == id).First());
                                        context.SaveChanges();
                                    }
                                }
                                break;

                        }
                    });

                }


                catch (HttpListenerException)
                {

                }
            }


        }
        object listToDict(List<string> strings)
        {
            Dictionary<string, string> keyValuePairs = new Dictionary<string, string>();
            strings.ForEach(x => keyValuePairs.Add(x.Split('=')[0], x.Split('=')[1]));
            return keyValuePairs;
        }
        string getParamsValue(string key, HttpListenerContext RequestContent)
        {
            Dictionary<string, string> Params = new Dictionary<string, string>();
            Params = listToDict(RequestContent.Request.Url.Query.Remove(0, 1).Split('&').ToList()) as Dictionary<string, string>;
            if (Params != null)
                return Params[key];
            else
                return null;
        }
        void sendAnswer(string value, int code, HttpListenerContext RequestContent)
        {
            try
            {
                RequestContent.Response.StatusCode = code;
                var bytes = Encoding.UTF8.GetBytes(value);
                RequestContent.Response.Close(bytes, false);
            }
            catch
            {
                RequestContent.Response.StatusCode = 404;
                RequestContent.Response.Close();
            }

        }
        public byte[] imageConverter(BitmapImage bitmapImage)
        {
            byte[] data;
            JpegBitmapEncoder encoder = new JpegBitmapEncoder();
            encoder.Frames.Add(BitmapFrame.Create(bitmapImage));
            using (MemoryStream ms = new MemoryStream())
            {
                encoder.Save(ms);
                data = ms.ToArray();
            }
            return data;

        }
    }
}
