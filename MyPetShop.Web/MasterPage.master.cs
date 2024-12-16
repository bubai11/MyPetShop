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

        }
        // MasterPage.master.cs 文件
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            // 获取搜索框中的内容
            string searchQuery = txtSearch.Text.Trim();

            if (!string.IsNullOrEmpty(searchQuery))
            {
                // 将搜索条件通过 QueryString 传递到搜索结果页面
                //Response.Redirect($"SearchResults.aspx?query={HttpUtility.UrlEncode(searchQuery)}");
            }
            else
            {
                // 如果输入为空，可以给出提示
                Response.Write("<script>alert('请输入搜索内容');</script>");
            }
        }
    }
}