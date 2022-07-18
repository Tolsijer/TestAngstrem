using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;


namespace E_Shop_Test.Views
{
    public partial class Products : Window
{
        private bool isAdmin;
        public bool IsAdmin
        {
            get { return isAdmin; }
            set { isAdmin = value; }
        }
        public Products()
        {
         
            InitializeComponent();
            var ds= new ViewModels.ProductsViewModel();
            ds.SetAdminStatus(IsAdmin);
            DataContext = ds;
        
        }
        public void SetAdminStatus(bool isAdmin)
        {
            IsAdmin = isAdmin;
        }

    }
}
