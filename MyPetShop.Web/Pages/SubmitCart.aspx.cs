using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyPetShop.BLL;
using MyPetShop.DAL;

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

                    CustomerService customerService = new CustomerService();
                    Customer currentUser = customerService.GetCustomerWithBalance(userName);
                    decimal walletBalance = currentUser.Money;
                    CartItemService cartItemSrv = new CartItemService();
                    decimal totalAmount = cartItemSrv.CalculateTotal(customerId);
                    // 检查钱包余额是否足够
                    if (walletBalance >= totalAmount)
                    {
                        // 从钱包中扣除总金额
                        bool isBalanceUpdated = customerService.DeductBalance(customerId, totalAmount);
                        if (isBalanceUpdated)
                        {
                            // 提交订单
                            bool isOrderPlaced = orderService.SubmitOrder(customerId, userName, addr1, addr2, city, state, zip, phone);
                            if (isOrderPlaced)
                            {
                                OrderStatusLabel.ForeColor = System.Drawing.Color.Green;
                                HttpContext.Current.Session["RefreshBalance"] = true;
                                string redirectUrl = $"~/Pages/SubmitCart.aspx";
                                Response.Redirect(redirectUrl);
                                OrderStatusLabel.Text = "订单提交成功，金额已从钱包扣除！";
                                //cartItemSrv.ClearCart(customerId);

                            }
                            //else
                            //{
                            //    // 如果订单提交失败，回滚余额扣除
                            //    customerService.AddBalance(customerId, totalAmount);
                            //    OrderStatusLabel.Text = "订单提交失败，请稍后再试！";
                            //    OrderStatusLabel.ForeColor = System.Drawing.Color.Red;
                            //}
                        }
                        else
                        {
                            OrderStatusLabel.Text = "余额扣除失败！";
                            OrderStatusLabel.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        OrderStatusLabel.Text = "余额不足，无法结算！";
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