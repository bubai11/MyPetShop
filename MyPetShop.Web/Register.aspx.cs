using MyPetShop.BLL;
using MyPetShop.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web
{
    public partial class Register : System.Web.UI.Page
    {
        private readonly CustomerService customerBLL = new CustomerService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPwd.Text.Trim();

            try
            {
                bool result = customerBLL.Register(name, email, password);

                if (result)
                {
                    // 注册成功，跳转到登录页面
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblMsg.Text = "注册失败，请重试！";
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "发生错误：" + ex.Message;
            }
        }

    }
}