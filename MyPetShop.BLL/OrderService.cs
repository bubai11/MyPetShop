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

        // 提交订单
        public bool SubmitOrder(int customerId, string userName, string addr1, string addr2, string city, string state, string zip, string phone)
        {
            try
            {
                // 调用 OrderDAL 保存订单
                string orderStatus = orderDAL.SaveOrder(customerId, userName, addr1, addr2, city, state, zip, phone);

                return orderStatus == "未审核";
            }
            catch (Exception ex)
            {
                // 处理异常
                throw new Exception("订单提交失败: " + ex.Message, ex);
            }
        }
        // 获取订单列表
        public DataTable GetOrders()
        {
            return orderDAL.GetOrders();
        }

        // 审核订单
        public void ReviewOrder(int orderId)
        {
            orderDAL.UpdateOrderStatus(orderId, "已审核");
        }
        // 获取订单的基本信息
        public Order GetOrderById(int orderId)
        {
            return orderDAL.GetOrderById(orderId);
        }
    }
}
