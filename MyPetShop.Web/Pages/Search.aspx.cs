using MyPetShop.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web.Pages
{
    public partial class SearchResults : System.Web.UI.Page
    {
        private readonly ProductService productService = new ProductService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 获取查询字符串中的搜索关键字
                string searchQuery = Request.QueryString["search"];
                if (!string.IsNullOrEmpty(searchQuery))
                {
                    LoadSearchResults(searchQuery);
                }
                else
                {
                    lblMessage.Text = "请输入有效的搜索关键词！";
                }
            }
        }

        private void LoadSearchResults(string searchQuery)
        {
            try
            {
                // 调用业务逻辑层的搜索方法
                var searchResults = productService.SearchProducts(searchQuery);

                if (searchResults != null && searchResults.Rows.Count > 0)
                {
                    // 将搜索结果绑定到 GridView 控件
                    gvSearchResults.DataSource = searchResults;
                    gvSearchResults.DataBind();
                    lblMessage.Text = ""; // 清除提示信息
                }
                else
                {
                    // 如果没有结果，提示用户
                    gvSearchResults.DataSource = null;
                    gvSearchResults.DataBind();
                    lblMessage.Text = "未找到相关商品！";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "加载搜索结果失败，请稍后再试！";
                Console.WriteLine("搜索异常：" + ex.Message);
            }
        }
    }
}