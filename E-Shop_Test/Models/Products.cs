//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace E_Shop_Test.Models
{
    using System;
    using System.Windows.Controls;
    using System.Runtime.Serialization;
    using System.Text.Json.Serialization;
    using System.Threading.Tasks;
    using Avalonia.Media.Imaging;

    public partial class Products
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public int Article { get; set; }
        public double Cost { get; set; }
        public int Count { get; set; }
        public int Image { get; set; }
        [JsonIgnore]
        [IgnoreDataMember]
        public virtual Images Images { get; set; }
        private Bitmap _prodImage;
        public string Description { get; set; }
        public Bitmap ProdImage
        {
            get { return _prodImage; }
        }
        public Products()
        {

        }
        public void GetImage(int id)
        {
            using (System.IO.Stream ms = new System.IO.MemoryStream(Models.SeverInteraction.GetImage(id) as byte[]))
            {
                Bitmap image = new Bitmap(ms);
                _prodImage=image;
            }

        }

    }
}
