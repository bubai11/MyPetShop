using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web.Controls
{
    public partial class UserStatus : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 检查用户是否登录
            if (Session["Username"] != null)
            {
                // 用户已登录
                pnlLoggedIn.Visible = true;
                pnlLoggedOut.Visible = false;

                // 显示用户名
                lblUsername.Text = Session["Username"].ToString();

                // 根据角色显示不同的链接
                string role = Session["Role"]?.ToString();
                if (role == "admin")
                {
                    lnkAdminPanel.Visible = true;
                    lnkShoppingHistory.Visible = false;
                }
                else
                {
                    lnkAdminPanel.Visible = false;
                    lnkShoppingHistory.Visible = true;
                }
            }
            else
            {
                // 用户未登录
                pnlLoggedIn.Visible = false;
                pnlLoggedOut.Visible = true;
            }
        }
        //protected void btnLogout_Click(object sender, EventArgs e)
        //{
        //    // 注销用户
        //    Session.Clear();
        //    Response.Redirect("~/Default.aspx");
        //}
    }
}