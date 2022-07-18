using System;
using System.Collections.Generic;
using System.Windows.Controls;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading.Tasks;


namespace E_Shop_Test.Models
{
    internal class SeverInteraction
    {
        public static object GetUsers(Dictionary<string,string> data,string request)
        {
            try
            {
                string fullRequest = $"http://127.0.0.1:6025/{request}?";
                foreach (KeyValuePair<string, string> kvp in data)
                    fullRequest += $"{kvp.Key}={kvp.Value}&";
                var result = new HttpClient().GetAsync(fullRequest.Remove(fullRequest.Length - 1)).Result;
                string retStr = new StreamReader(result.Content.ReadAsStream()).ReadToEnd();
                return retStr;
            }
            catch(System.AggregateException)
            {
                return null;
            }
        }
        public static List<Products> GetProds()
        {
            var data=JsonSerializer.Deserialize<List<Products>>(new HttpClient().GetAsync("http://127.0.0.1:6025/get_prods").Result.Content.ReadAsStream());
            data.ForEach(x => x.GetImage(x.Image));
            return data;
        }
        public static object GetImage(int id)
        {
            var x= JsonSerializer.Deserialize<byte[]>(new HttpClient().GetAsync($"http://127.0.0.1:6025/get_image?id={id}").Result.Content.ReadAsStream());
            return x; 
        }
        public static Products GetProd(int id)
        {
            var data= JsonSerializer.Deserialize<Products>(new HttpClient().GetAsync($"http://127.0.0.1:6025/get_prod?id={id}").Result.Content.ReadAsStream());
            data.GetImage(data.Image);
            return data;
        }
        public static void ChangeProduct(Products product,byte[] bytes)
        {
            new HttpClient().PostAsJsonAsync("http://127.0.0.1:6025/save_image", bytes);
            var json = JsonSerializer.Serialize<Products>(product);
            var content = new StringContent(json.ToString(), Encoding.UTF8, "application/json");

            new HttpClient().PutAsync("http://127.0.0.1:6025/redact_product",content);

        }
        public static void ChangeProduct(Products product)
        {
            var json = JsonSerializer.Serialize<Products>(product);
            var content = new StringContent(json.ToString(), Encoding.UTF8, "application/json");

            new HttpClient().PutAsync("http://127.0.0.1:6025/redact_product", content);

        }
        public static void DeleteProduct(int id)
        {
            new HttpClient().DeleteAsync($"http://127.0.0.1:6025/delete_product?id={id}");
        }
    }
}
