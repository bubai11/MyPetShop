using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyPetShop.BLL;

namespace MyPetShop.Web.Pages
{
    public partial class SubmitCart : Page
    {
        private readonly OrderService orderService = new OrderService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HttpContext.Current.Session["Username"] == null)
                {
                    // 用户未登录，重定向到登录页面
                    Response.Redirect(ResolveUrl("~/Default.aspx"));
                }
            }
        }
        // 处理提交按钮点击事件
        protected void SubmitOrderButton_Click(object sender, EventArgs e)
        {
            // 验证是否所有控件都通过验证
            if (Page.IsValid)
            {
                try
                {
                    // 获取用户填写的地址信息
                    string addr1 = Addr1.Text.Trim();
                    string addr2 = Addr2.Text.Trim();
                    string city = City.Text.Trim();
                    string state = State.Text.Trim();
                    string zip = Zip.Text.Trim();
                    string phone = Phone.Text.Trim();

                    int customerId = Convert.ToInt32((HttpContext.Current.Session["CustomerId"]));
                    string userName = (string)HttpContext.Current.Session["UserName"];

                    bool isOrderPlaced = orderService.SubmitOrder(customerId, userName, addr1, addr2, city, state, zip, phone);

                    // 显示提交状态
                    if (isOrderPlaced)
                    {
                        OrderStatusLabel.Text = "订单提交成功！";
                        OrderStatusLabel.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        OrderStatusLabel.Text = "订单提交失败，请稍后再试！";
                        OrderStatusLabel.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    // 捕获并显示异常信息
                    OrderStatusLabel.Text = "出现错误: " + ex.Message;
                    OrderStatusLabel.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                // 如果表单验证失败，显示错误信息
                OrderStatusLabel.Text = "请检查必填项是否已填写完整！";
                OrderStatusLabel.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}

//using MyPetShop.BLL;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace MyPetShop.Web.Pages
//{
//    public partial class SubmitCart : System.Web.UI.Page
//    {
//        private readonly OrderService orderService = new OrderService();
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                if (HttpContext.Current.Session["Username"] == null)
//                {
//                    // 用户未登录，重定向到登录页面
//                    Response.Redirect("../Login.aspx");
//                }
//            }
//        }

//        protected void SubmitOrderButton_Click(object sender, EventArgs e)
//        {
//            if (Page.IsValid)
//            {
//                try
//                {
//                    // 获取表单数据
//                    string addr1 = Addr1.Text;
//                    string addr2 = Addr2.Text;
//                    string city = City.Text;
//                    string state = State.Text;
//                    string zip = Zip.Text;
//                    string phone = Phone.Text;
//                    int customerId=Convert.ToInt32(Session["CustomerId"]);
//                    string userName= (string)Session["UserName"];
//                    // 调用业务逻辑服务提交订单
//                    string orderStatus = orderService.SubmitOrder(customerId,userName,addr1,addr2, city, state, zip, phone);

//                    // 显示订单状态
//                    OrderStatusLabel.Text = "订单状态: " + orderStatus;
//                }
//                catch (Exception ex)
//                {
//                    // 处理异常，可以记录日志或显示错误信息
//                    OrderStatusLabel.Text = "提交订单时出错: " + ex.Message;
//                }
//            }
//        }
//    }
//}