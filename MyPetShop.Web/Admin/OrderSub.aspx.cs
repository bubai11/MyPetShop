using MyPetShop.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web.Admin
{
    public partial class OrderSub : System.Web.UI.Page
    {
        private readonly OrderService orderService = new OrderService();
        private readonly OrderItemService orderItemService = new OrderItemService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int orderId;
                if (int.TryParse(Request.QueryString["OrderId"], out orderId))
                {
                    BindOrderDetails(orderId);
                }
                else
                {
                    // 订单ID无效时，重定向或显示错误信息
                    Response.Redirect("OrderMaster.aspx");
                }
            }
        }

        // 绑定订单主表信息和购买详细表
        private void BindOrderDetails(int orderId)
        {
            // 获取订单主表信息
            var order = orderService.GetOrderById(orderId);
            if (order != null)
            {
                lblOrderId.InnerText = order.OrderId.ToString();
                lblUserName.InnerText = order.UserName;
                lblOrderDate.InnerText = order.OrderDate.ToString("yyyy-MM-dd");
                lblAddr.InnerText = $"{order.Addr1}, {order.Addr2}";
                lblCity.InnerText = order.City;
                lblState.InnerText = order.State;
                lblZip.InnerText = order.Zip;
                lblPhone.InnerText = order.Phone;
                lblStatus.InnerText = order.Status;
            }

            // 获取订单商品详细信息
            var orderItems = orderItemService.GetOrderItemsByOrderId(orderId);
            if (orderItems != null)
            {
                // 处理商品信息，序号列自动增加
                DataTable dt = new DataTable();
                dt.Columns.Add("SerialNo", typeof(int));  // 序号
                dt.Columns.Add("ProductName", typeof(string));  // 商品名称
                dt.Columns.Add("ListPrice", typeof(decimal));  // 商品单价
                dt.Columns.Add("Qty", typeof(int));  // 购买数量
                dt.Columns.Add("TotalPrice", typeof(decimal));  // 总价

                int serialNo = 1;
                foreach (var item in orderItems)
                {
                    DataRow row = dt.NewRow();
                    row["SerialNo"] = serialNo++;
                    row["ProductName"] = item.ProName;
                    row["ListPrice"] = item.ListPrice;
                    row["Qty"] = item.Qty;
                    row["TotalPrice"] = item.TotalPrice;
                    dt.Rows.Add(row);
                }

                gvOrderItems.DataSource = dt;
                gvOrderItems.DataBind();
            }
        }
    }
}