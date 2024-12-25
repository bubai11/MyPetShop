using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web.Controls
{
    public partial class ManagementLinks : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 设置 HyperLink 的 NavigateUrl 属性  
            hlCategory.NavigateUrl = ResolveUrl("~/Admin/CategoryMaster.aspx");
            hlProduct.NavigateUrl = ResolveUrl("~/Admin/ProductMaster.aspx");
            hlOrder.NavigateUrl = ResolveUrl("~/Admin/OrderMaster.aspx");

        }
    }
}