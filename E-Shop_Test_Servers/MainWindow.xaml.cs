using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using System.Windows;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Text.Json;
using System.IO;
using System.Windows.Controls;

namespace E_Shop_Test_Servers
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Thread thread;
        bool httpStatus;
        Server server;
        public MainWindow()
        {

            InitializeComponent();

        }

        private void RunButton_Click(object sender, RoutedEventArgs e)
        {
            server = new Server();
            thread = new Thread(server.ServerStartListenRequests);
            thread.Start();
            LogsTextBlock.Text += DateTime.Now.ToString() + ":Server started on ";
            server.httpListener.Prefixes.ToList().ForEach(x => LogsTextBlock.Text += " " + x);
            LogsTextBlock.Text += "\n";
            StatusLabel.Content = "Статус:Запущено";
            IPLabel.Content = server.httpListener.Prefixes.ToList()[0].Split('/')[0];
            server.httpListener.Prefixes.ToList().ForEach(x => PortLabel.Content +=" "+x.Split('/')[1]+" ");
            StatusLabel.Foreground =new  System.Windows.Media.SolidColorBrush(System.Windows.Media.Color.FromRgb(107, 247, 0));


        }

        private void ShutDownButton_Click(object sender, RoutedEventArgs e)
        {
            thread.Abort();
            LogsTextBlock.Text += DateTime.Now.ToString() + ":Server shuted down on";
            server.httpListener.Prefixes.ToList().ForEach(x => LogsTextBlock.Text += " " + x);
            LogsTextBlock.Text += "\n";
            StatusLabel.Content = "Статус:Отключено";
            StatusLabel.Foreground = Brushes.Red;
        }

    }
}
