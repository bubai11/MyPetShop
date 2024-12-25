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
            if (!IsPostBack)
            {
                if (Label1 == null)
                {
                    throw new NullReferenceException("控件 lblStatus 未正确加载，请检查 UserStatus.ascx 文件中的定义！");
                }
                UpdateStatus();
            }
        }


        //更新状态
        private void UpdateStatus()
        {
            // 获取 Session 信息
            var username = HttpContext.Current.Session["UserName"] as string;
            var isAdmin = HttpContext.Current.Session["IsAdmin"] != null && (bool)HttpContext.Current.Session["IsAdmin"];

            if (string.IsNullOrEmpty(username)) // 未登录状态
            {
                lblStatus.Text = "您还未登录，";
                lnkAction1.Text = "登录";
                lnkAction1.NavigateUrl = "~/Login.aspx";
                lnkAction2.Text = "注册";
                lnkAction2.NavigateUrl = "~/Register.aspx";
                lnkAction3.Visible = false; // 隐藏第三个链接
            }
            else if (isAdmin) // 管理员登录状态
            {
                lblStatus.Text = $"您好，【{username}】";
                lnkAction1.Text = "系统管理";
                lnkAction1.NavigateUrl = "~/Admin/CategoryMaster.aspx";
                lnkAction2.Text = "退出登录";
                lnkAction2.NavigateUrl = "~/Logout.aspx";
                lnkAction3.Visible = false; // 隐藏第三个链接
            }
            else // 普通用户登录状态
            {
                lblStatus.Text = $"您好，【{username}】";
                lnkAction1.Text = "修改密码";
                lnkAction1.NavigateUrl = "../ChangePwd.aspx";
                lnkAction2.Text = "购物记录";
                lnkAction2.NavigateUrl = "../Pages/OrderList.aspx";
                lnkAction3.Text = "退出登录";
                lnkAction3.NavigateUrl = "~/Logout.aspx";
                lnkAction3.Visible = true; // 显示第三个链接
            }
        }
    }
}