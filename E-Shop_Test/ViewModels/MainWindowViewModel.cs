using ReactiveUI;
using System.Collections.Generic;
using System.ComponentModel;
using System.Reactive;
using System.Runtime.CompilerServices;
using System.Windows;
using System.Windows.Input;

namespace E_Shop_Test.ViewModels
{
    public class MainWindowViewModel : ViewModelBase
    {
        public event PropertyChangedEventHandler PropertyChanged;
        private string _password;
        public string Password { get => _password; set => this.RaiseAndSetIfChanged(ref _password, value); }
        private string _login;
        public string Login { get { return _login; } set { _login = value;OnPropertyChanged(Login); } }
        protected virtual void OnPropertyChanged([CallerMemberName] string? propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        public MainWindowViewModel()
        {
            AutorizationCommand = ReactiveCommand.Create(RunCommand);

        }
        public ReactiveCommand<Unit, Unit> AutorizationCommand { get; }
        
        void RunCommand()
        {
            Dictionary<string, string> data = new Dictionary<string, string>();
            

            data.Add("login", _login);
            data.Add("password", _password);
            var result = Models.SeverInteraction.GetUsers(data, "get_user").ToString();
            if ( result== "2")
            {
                Views.Products products = new Views.Products();
                products.SetAdminStatus(true);
                products.Show();
            }
            else if (result=="1")
            {
                Views.Products products = new Views.Products();
                products.SetAdminStatus(false);
                products.Show();
            }
            else
            {
                MessageBox.Show("Неверные данные");
            }
        }
    }

    }
