using MyPetShop.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyPetShop.BLL
{
    public class OrderService
    {
        private OrderDAL orderDAL = new OrderDAL();
        public DataTable GetOrdersByCustomerId(int customerId)
        {
            return orderDAL.GetOrdersByCustomerId(customerId);
        }

        public string SubmitOrder(int customerId, string userName, string addr1, string addr2, string city, string state, string zip, string phone)
        {
            string orderStatus = orderDAL.SaveOrder(customerId, userName, addr1, addr2, city, state, zip, phone);

            return orderStatus;
        }

    }
}
