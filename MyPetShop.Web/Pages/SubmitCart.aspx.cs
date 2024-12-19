using MyPetShop.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web.Pages
{
    public partial class SubmitCart : System.Web.UI.Page
    {
        private readonly CartService cartSrv = new CartService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((string)Session["UserName"]==null)
                {
                    // 用户未登录，重定向到登录页面
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void SubmitOrderButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // 获取表单数据
                    string addr1 = Addr1.Text;
                    string addr2 = Addr2.Text;
                    string city = City.Text;
                    string state = State.Text;
                    string zip = Zip.Text;
                    string phone = Phone.Text;
                    int customerId=Convert.ToInt32(Session["CustomerId"]);
                    string userName= (string)Session["UserName"];
                    // 调用业务逻辑服务提交订单
                    string orderStatus = cartSrv.SubmitOrder(customerId,userName,addr1,addr2, city, state, zip, phone);

                    // 显示订单状态
                    OrderStatusLabel.Text = "订单状态: " + orderStatus;
                }
                catch (Exception ex)
                {
                    // 处理异常，可以记录日志或显示错误信息
                    OrderStatusLabel.Text = "提交订单时出错: " + ex.Message;
                }
            }
        }
    }
}