using MyPetShop.BLL;
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
        private readonly ProductService productService = new ProductService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                searchResultContainer.Style["display"] = "none";
                gvSearchResults.Visible = false;
            }

        }

        // 获取搜索框中的内容
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            // 获取搜索框中的内容
            string searchQuery = txtSearch.Text.Trim();

            if (!string.IsNullOrEmpty(searchQuery))
            {
                // 将搜索关键字通过查询字符串传递到搜索结果页面
                Response.Redirect($"./Pages/Search.aspx?query={HttpUtility.UrlEncode(searchQuery)}");
            }
            else
            {
                // 如果输入为空，提示用户
                Response.Write("<script>alert('请输入搜索内容');</script>");
            }
        }
    }
}