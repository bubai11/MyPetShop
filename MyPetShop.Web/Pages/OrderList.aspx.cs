using MyPetShop.BLL;
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
                if (Context.User.Identity.IsAuthenticated)
                {
                    // 获取当前登录用户的ID（这里需要根据您的应用程序实现）
                    int loggedInUserId = Convert.ToInt32(Session["UserId"]); // 假设用户ID存储在会话中

                    // 从业务逻辑层获取当前用户的订单列表
                    DataTable orders = orderSrv.GetOrdersByCustomerId(loggedInUserId);

                    // 将订单数据绑定到GridView控件
                    OrderGridView.DataSource = orders;
                    OrderGridView.DataBind();
                }
                else
                {
                    // 用户未登录，重定向到登录页面
                    Response.Redirect("Login.aspx");
                }
            }
        
    }
    }
}