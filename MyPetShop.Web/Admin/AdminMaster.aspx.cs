//using System;
//using System.Web;
//using System.Web.UI;

//namespace MyPetShop.Web.Admin
//{
//    public partial class AdminMaster : System.Web.UI.Page
//    {
//        // 在 Page_Load 中进行身份验证
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            // 判断用户是否已登录且角色为管理员
//            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
//            {
//                // 如果不是管理员，重定向到登录页面
//                Response.Redirect("~/Login.aspx");
//            }
//        }

//        // 在 OnPreRender 中绑定 HyperLink 的 NavigateUrl
//        protected override void OnPreRender(EventArgs e)
//        {
//            base.OnPreRender(e);

//            // 只有在管理员身份检查通过后，才设置导航链接
//            hlCategory.NavigateUrl = "~/Admin/CategoryMaster.aspx";
//            hlProduct.NavigateUrl = "~/Admin/ProductMaster.aspx";
//            hlOrder.NavigateUrl = "~/Admin/OrderMaster.aspx";
//        }
//    }
//}
using System;
using System.Web;
using System.Web.UI;

namespace MyPetShop.Web.Admin
{
    public partial class AdminMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 判断用户是否已登录且角色为管理员
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                // 如果不是管理员，重定向到登录页面
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}
