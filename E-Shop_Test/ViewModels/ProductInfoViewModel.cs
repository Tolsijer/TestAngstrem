using System;
using System.Collections.Generic;
using System.ComponentModel;
using Avalonia.Media.Imaging;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Reactive;
using ReactiveUI;
using System.Windows.Media;
using System.Windows.Forms;
using System.Windows.Media.Imaging;
using System.IO;

namespace E_Shop_Test.ViewModels
{
    public class ProductInfoViewModel:Models.Products
{
        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged([CallerMemberName] string? propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        private bool _isAdmin;
        public bool IsAdmin
        {
            get { return _isAdmin; }
            set { _isAdmin = value; }
        }
        private bool _isPicChanged=false;
        public bool IsPicChanged
        { 
            get 
            { 
                return _isPicChanged; 
            }
            set 
            {
                _isPicChanged = value; 
            }
        }
        private Views.ProductInfo _parent;
        public Views.ProductInfo Parent
        {
            get 
            { 
                return _parent; 
            }
            set 
            { 
                _parent = value; 
            }
        }
        private int _id;
        public int Id
        {
            get
            {
                return _id;
            }
            set
            {
                _id = value;
            }
        }
        private Models.Products _product;
        public Models.Products Products
        {
            get
            {
                return _product;
            }
            set
            {
                _product = Models.SeverInteraction.GetProd(ID);
            }
        }
        private BitmapImage _redactImage;
        public BitmapImage RedactImage
        {
            get 
            {
                return _redactImage; 
            }
            set 
            { 
                _redactImage=value; 
            }
        }
        private Bitmap _bitmap;
        public Bitmap ProductImage
        {
            get
            {
                return _bitmap;
            }
        }
        public ReactiveCommand<string, Unit> RedactCommand { get; }
        public ReactiveCommand<Unit,Unit> SendRedactData { get; }
        public ReactiveCommand<Unit,Unit> ChangeProdPicture { get; }
        public ProductInfoViewModel(int id)
        {
            _product = Models.SeverInteraction.GetProd(id);
            GetImage(_product.Image);
            RedactCommand = ReactiveCommand.Create<string>(RedactCommandHandler);
            SendRedactData = ReactiveCommand.Create(SendRedactedData);
            ChangeProdPicture = ReactiveCommand.Create(ChangePicture);
        }
        public void GetImage(int id)
        {
            using (System.IO.Stream ms = new System.IO.MemoryStream(Models.SeverInteraction.GetImage(id) as byte[]))
            {
                Bitmap image = new Bitmap(ms);
                _bitmap = image;
            }

        }
        private void RedactCommandHandler(string s)
        {
            Views.RedactWindow redactWindow = new Views.RedactWindow();
            redactWindow.SetDataContext(this);
            redactWindow.Show();
        }
        private void SendRedactedData()
        {
            if(_isPicChanged)
            {
                byte[] data;
                JpegBitmapEncoder encoder = new JpegBitmapEncoder();
                encoder.Frames.Add(BitmapFrame.Create(_redactImage));
                using (MemoryStream ms = new MemoryStream())
                {
                    encoder.Save(ms);
                    data = ms.ToArray();
                    Models.SeverInteraction.ChangeProduct(_product, data);

                }
                Parent.Close();
            }
            else
            {
                Models.SeverInteraction.ChangeProduct(_product);
                Parent.Close();
            }

        }
        private void ChangePicture()
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "Image Files|*.png;*.jpg;*.jpeg";
            if (ofd.ShowDialog() == DialogResult.OK)
            {
                _redactImage = new BitmapImage(new Uri(ofd.FileName));
                _isPicChanged = true;
                
            }
            else
            {
                return;
            }
        }
        public void SetAdmin(bool isAdmin)
        {
            IsAdmin = isAdmin;
        }
    }
}
