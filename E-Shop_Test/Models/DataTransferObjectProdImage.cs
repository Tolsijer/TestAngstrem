using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace E_Shop_Test.Models
{
    internal class DataTransferObjectProdImage
{
    private Products _products;
    public Products Products
        {
            get { return _products; }
            set { _products = value; }
        }
    private byte[] _image;
    public byte[] Image
        {
            get { return _image; }
            set { _image = value; }
        }
    public DataTransferObjectProdImage(Products products, byte[] bytes)
    {
            Image = bytes;
            Products = products;
    }
}
}
