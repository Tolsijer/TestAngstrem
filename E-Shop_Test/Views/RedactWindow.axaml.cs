using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;

namespace E_Shop_Test.Views
{
    public partial class RedactWindow : Window
    {
        private int _id;
        public int Id { get { return _id; } set { _id = value; } }

        public RedactWindow()
        {
            InitializeComponent();

        }
        public void SetDataContext(ViewModels.ProductInfoViewModel ds)
        {
            DataContext = ds;
        }
    }
}