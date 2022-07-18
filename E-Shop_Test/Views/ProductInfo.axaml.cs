using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;

namespace E_Shop_Test.Views
{
    public partial class ProductInfo : Window
{
        private int _id;
        public int Id { get { return _id; } set { _id = value; } }

    public ProductInfo()
    {
            InitializeComponent();

    }
    public void somemethod(bool isAdmin)
        {
            var ds = new ViewModels.ProductInfoViewModel(_id);
            DataContext = ds;
            ds.Parent = this;
        }
}
}
