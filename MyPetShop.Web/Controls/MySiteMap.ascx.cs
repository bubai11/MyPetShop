using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web.Controls
{
	public partial class MySiteMap : System.Web.UI.UserControl
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            // 获取相对于站点根目录的路径，不包括“~”符号
            string relativePath = Request.Url.AbsolutePath;
            System.Diagnostics.Debug.WriteLine("relativePath1: " + relativePath);
            if (relativePath.Equals("/Default"))
            {
                //relativePath = "/default.aspx";  // 设置为 Default 页面路径
            }
            System.Diagnostics.Debug.WriteLine("relativePath2: " + relativePath);

            var currentNode = SiteMap.Provider.FindSiteMapNode(relativePath);
            if (currentNode == null)
            {
                SiteMapPath1.Visible = false;
                System.Diagnostics.Debug.WriteLine("当前节点未找到，隐藏 SiteMapPath1");
            }
            else
            {
                SiteMapPath1.Visible = true;
                System.Diagnostics.Debug.WriteLine($"当前节点: {currentNode.Title}");
                //SiteMapPath1.Provider.CurrentNode=currentNode;
                SiteMapPath1.DataBind();  // 重新绑定数据以显示更新的路径
                System.Diagnostics.Debug.WriteLine(SiteMapPath1.Provider.CurrentNode);

            }
        }

    }
}