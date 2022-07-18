using ReactiveUI;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Reactive;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Data;

namespace E_Shop_Test.ViewModels
{
    public class ProductsViewModel : ViewModelBase
    {
        public event PropertyChangedEventHandler PropertyChanged;
        public int val { get; set; }
        private static bool _isAdmin;
        public bool IsAdmin
        {
            get
            {
                return _isAdmin;
            }
            set
            {
                _isAdmin = value;
            }
        }
        private int _pageStart=1;
        private int _pageEnd=10;
        private Models.Products _selectedProd;
        private string _searchProd="sometext";
        private IEnumerable<Models.Products> _products= Models.SeverInteraction.GetProds();
        public IEnumerable<Models.Products> Prods 
        { 
            get { return _products.Where(x=> x.ID >= _pageStart && x.ID <= _pageEnd&&x.Name.Contains(SearchProduct)); }

        }
        public Models.Products SelectedProduct 
        { 
            get => _selectedProd; 
            set => this.RaiseAndSetIfChanged(ref _selectedProd, value); 
        }
        public string SearchProduct 
        { 
            get => _searchProd; 
            set => this.RaiseAndSetIfChanged(ref _searchProd, value); 
        }
        public List<string> ProdTypes;
        public ReactiveCommand<int, Unit> ProductSelectedCommand { get; }
        public ReactiveCommand<Unit, Unit> PageUpCommand { get; }
        public ReactiveCommand<Unit, Unit> PageDownCommand { get; }
        public ReactiveCommand<int,Unit> DeleteProductCommand { get; }
        protected virtual void OnPropertyChanged([CallerMemberName] string? propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        public ProductsViewModel()
        {
            val = 1;
            ProductSelectedCommand = ReactiveCommand.Create<int>(ProductItemCommandHandler);
            PageDownCommand = ReactiveCommand.Create(PageDown);
            PageUpCommand = ReactiveCommand.Create(PageUp);
            DeleteProductCommand = ReactiveCommand.Create<int>(DeleteProductCommandHandler);
        }
        static void ProductItemCommandHandler(int id)
        {
            if (id != 0)
            {
                Views.ProductInfo productInfo = new Views.ProductInfo() { Id = id };
                productInfo.Id = id;
                productInfo.somemethod(_isAdmin);
                productInfo.Show();
            }
            else
            {
                MessageBox.Show("Не выбран продукт");
            }
        }
        void PageUp()
        {
            if ( _pageEnd>Prods.Count())
            {

            }
            {
                _pageStart += 10;
                _pageEnd += 10;
            }
        }
        void PageDown()
        {
            if (_pageStart== 0)
            {

            }
            else
            {
                _pageStart -= 10;
                _pageEnd -= 10;
            }
        }
        void DeleteProductCommandHandler(int id)
        {
            if(id!=0)
            {
                Models.SeverInteraction.DeleteProduct(id);
            }
            else
            {
                MessageBox.Show("Не выбран продукт");
            }
            
        }
        public void SetAdminStatus(bool isAdmin)
        {
            this.IsAdmin = isAdmin;
        }
    }

}
