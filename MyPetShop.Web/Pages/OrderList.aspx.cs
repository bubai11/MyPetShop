using MyPetShop.BLL;
using MyPetShop.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web.Pages
{
    public partial class OrderList : System.Web.UI.Page
    {
        private readonly OrderService orderSrv = new OrderService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                    int CustomerId = Convert.ToInt32((HttpContext.Current.Session["CustomerId"])); // 假设用户ID存储在会话中
                    System.Diagnostics.Debug.WriteLine("OrderList"+CustomerId);

                    // 从业务逻辑层获取当前用户的订单列表
                    DataTable orders = orderSrv.GetOrdersByCustomerId(CustomerId);

                    // 将订单数据绑定到GridView控件
                    OrderGridView.DataSource = orders;
                    OrderGridView.DataBind();
                }
            }
    }
}