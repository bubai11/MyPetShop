using MyPetShop.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web
{

    public partial class ChangePwd : System.Web.UI.Page
        {
            private CustomerService customerSrv = new CustomerService();

            protected void Page_Load(object sender, EventArgs e)
            {
                if (Session["CustomerId"] == null) // 用户未登录
                {
                    Response.Redirect("~/Login.aspx");
                }
            }

            protected void BtnChangePwd_Click(object sender, EventArgs e)
            {
                if (Page.IsValid)
                {
                    if (customerSrv.CheckUserExistence(Session["Username"].ToString(), txtOldPwd.Text))
                    {
                        customerSrv.ChangePassword(Session["Username"].ToString(),txtPwd.Text);
                        lblMsg.Text = "密码修改成功!";
                    }
                    else // 输入的原密码不正确
                    {
                        lblMsg.Text = "原密码不正确!";
                    }
                }
            }
        }
    }
