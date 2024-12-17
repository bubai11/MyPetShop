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

            //string name = txtName.Text.Trim();
            //string password = txtPassword.Text.Trim();

            //if (customerBLL.Login(name, password, out DataRow userData))
            //{
            //    // 登录成功，保存用户状态
            //    Session["UserName"] = userData["Name"];
            //    Session["Email"] = userData["Email"];

            //    Response.Redirect("Default.aspx");
            //}
            //else
            //{
            //    lblMessage.Text = "用户名或密码错误！";
            //}
        }

    }
}