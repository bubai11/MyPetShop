using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 清空 Session
            HttpContext.Current.Session.RemoveAll();
            Session.Clear();
            Session.Abandon();
            // 重定向到首页
            Response.Redirect("/");
        }
    }
}