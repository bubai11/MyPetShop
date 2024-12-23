using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 判断页面是否首次加载
            if (!IsPostBack)
            {
                InitializePage();
            }
        }
        private void InitializePage()
        {
            Page.Title = "MyPetShop - 欢迎光临宠物商店";
        }
    }
}