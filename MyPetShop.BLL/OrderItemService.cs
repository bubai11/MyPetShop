using MyPetShop.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyPetShop.BLL
{
    public class OrderItemService
    {
        private readonly OrderItemDAL orderItemDAL = new OrderItemDAL();
        // 获取订单主表信息
        public DataRow GetOrderById(int orderId)
        {
            return orderItemDAL.GetOrderById(orderId);
        }

        // 获取指定订单的商品详细信息
        public List<OrderItem> GetOrderItemsByOrderId(int orderId)
        {
            return orderItemDAL.GetOrderItemsByOrderId(orderId);
        }
    }
}
