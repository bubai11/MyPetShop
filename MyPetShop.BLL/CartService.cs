using MyPetShop.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyPetShop.BLL
{
    public class CartService
    {
        private CartDAL cartDAL = new CartDAL();

        public string SubmitOrder(int customerId, string userName, string addr1,string addr2, string city, string state, string zip, string phone)
        {
            string orderStatus = cartDAL.SaveOrder(customerId, userName, addr1,addr2, city, state, zip, phone);

            return orderStatus;
        }
    }
}
