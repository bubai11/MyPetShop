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

                // 如果订单状态为 "Pending"，表示订单创建成功
                return orderStatus == "Pending";
            }
            catch (Exception ex)
            {
                // 处理异常
                throw new Exception("订单提交失败: " + ex.Message, ex);
            }
        }
    }

}
