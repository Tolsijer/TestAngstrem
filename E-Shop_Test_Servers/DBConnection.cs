using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace E_Shop_Test_Servers
{
    internal class DBConnection
    {
        private static EShopDBEntities1 _context;
        public static EShopDBEntities1 GetContext()
        {
            if(_context == null )
                _context = new EShopDBEntities1();
            return _context;
        }
        public bool userIsExists(string login,string password)
        {
            if (DBConnection.GetContext().Users.Where(x => x.Login == login && x.Password == password).Count() > 0)
                return true;
            else
                return false;
        }
    }
}
