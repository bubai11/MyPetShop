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
        private OrderListDAL orderDAL = new OrderListDAL();
        public DataTable GetOrdersByCustomerId(int customerId)
        {
            return orderDAL.GetOrdersByCustomerId(customerId);
        }

    }
}
