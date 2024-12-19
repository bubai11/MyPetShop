using MyPetShop.DAL;
using MyPetShop.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace MyPetShop.Web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        private readonly CustomerService customerBLL = new CustomerService();

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //// 检查协议是否勾选
            //if (!chkAgreement.Checked)
            //{
            //    lblMessage.Text = "请同意安全协议与隐私协议！";
            //    return;
            //}

            string name = txtName.Text.Trim();
            string password = txtPassword.Text.Trim();

            // 检查输入是否为空
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "用户名和密码不能为空！";
                return;
            }

            try
            {
                // 调用业务逻辑层的登录方法
                var user = customerBLL.Login(name, password);
                System.Diagnostics.Debug.WriteLine(user);

                if (user != null)
                {
                    // 登录成功，保存用户信息到 Session
                    HttpContext.Current.Session["UserName"] = user.Name;
                    HttpContext.Current.Session["CustomerId"] = user.CustomerId;
                    HttpContext.Current.Session["IsAdmin"] = user.Name.Equals("admin");
                    System.Diagnostics.Debug.WriteLine("登陆成功"+HttpContext.Current.Session["CustomerId"]);


                    // 重定向到首页或其他页面
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    // 登录失败，显示错误信息
                    lblMessage.Text = "用户名或密码错误！";
                }
            }
            catch (Exception ex)
            {
                // 捕获异常并显示错误信息
                lblMessage.Text = "登录失败，请稍后再试！";
                // 日志记录异常（可选）
                Console.WriteLine(ex.Message);
            }
        }
    }
}