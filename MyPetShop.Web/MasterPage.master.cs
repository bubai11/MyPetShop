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
                // 可在此初始化页面相关的逻辑，例如加载全局数据或控件设置
                InitializePage();
            }
        }

        private void InitializePage()
        {
            // 示例：设置页面标题或全局状态初始化
            Page.Title = "MyPetShop - 欢迎光临宠物商店";
        }
    }
}