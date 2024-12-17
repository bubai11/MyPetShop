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
                try
                {
                    // 调用业务逻辑层的搜索方法
                    var searchResults = productService.SearchProducts(searchQuery);

                    if (searchResults != null && searchResults.Rows.Count > 0)
                    {
                        // 将搜索结果绑定到 GridView 控件
                        gvSearchResults.DataSource = searchResults;
                        gvSearchResults.DataBind();
                        // 显示 GridView 和搜索结果容器
                        gvSearchResults.Visible = true;
                        searchResultContainer.Style["display"] = "block";
                        lblMessage.Text = ""; // 清除提示信息
                    }
                    else
                    {
                        // 没有结果时提示用户
                        gvSearchResults.DataSource = null;
                        gvSearchResults.DataBind();
                        lblMessage.Text = "未找到相关商品！";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "搜索失败，请稍后再试！";
                    Console.WriteLine("搜索异常：" + ex.Message);
                }
            }
            else
            {
                // 如果输入为空，提示用户
                Response.Write("<script>alert('请输入搜索内容');</script>");
            }
        }
        //protected void BtnSearch_Click(object sender, EventArgs e)
        //{
        //    // 获取搜索框中的内容
        //    string searchQuery = txtSearch.Text.Trim();

        //    if (!string.IsNullOrEmpty(searchQuery))
        //    {
        //        // 将搜索条件通过 QueryString 传递到搜索结果页面
        //        //Response.Redirect($"SearchResults.aspx?query={HttpUtility.UrlEncode(searchQuery)}");
        //    }
        //    else
        //    {
        //        // 如果输入为空，可以给出提示
        //        Response.Write("<script>alert('请输入搜索内容');</script>");
        //    }
        //}
    }
}