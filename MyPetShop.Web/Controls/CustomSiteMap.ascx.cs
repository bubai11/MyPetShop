using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web.Controls
{
	public partial class CustomSiteMap : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            string relativePath = Request.AppRelativeCurrentExecutionFilePath;
            System.Diagnostics.Debug.WriteLine("relativePath" + relativePath);
            var currentNode = SiteMap.Provider.FindSiteMapNode(relativePath);
            if (currentNode == null)
            {
                SiteMapPath1.Visible = false;
                System.Diagnostics.Debug.WriteLine("当前节点未找到，隐藏 SiteMapPath1");
            }
            else
            {
                System.Diagnostics.Debug.WriteLine($"当前节点: {currentNode.Title}");
            }

        }
    }
}