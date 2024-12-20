using MyPetShop.BLL;
using MyPetShop.DAL;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web.Pages
{
    public partial class search : System.Web.UI.Page
    {
        private readonly ProductService productService = new ProductService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 获取查询字符串中的搜索关键字
                string searchQuery = Request.QueryString["query"];
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
                    // 绑定搜索结果到 GridView
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

        // 添加到购物车
        protected void AddToCart_Click(object sender, EventArgs e)
        {
            try
            {
                // 检查用户是否登录
                if (Session["CustomerId"] == null)
                {
                    lblMessage.Text = "请先登录再添加到购物车！";
                    return;
                }

                // 获取当前用户的 CustomerId
                int customerId = Convert.ToInt32(Session["CustomerId"]);
                Button btn = (Button)sender;
                int productId = Convert.ToInt32(btn.CommandArgument);

                // 查询商品信息
                ProductDAL productDAL = new ProductDAL();
                DataTable productData = productDAL.GetProductById(productId);

                if (productData.Rows.Count > 0)
                {
                    DataRow product = productData.Rows[0];
                    int qty = 1; // 默认数量为 1

                    // 添加到购物车表
                    CartItemDAL cartItemDAL = new CartItemDAL();
                    bool success = cartItemDAL.InsertCartItem(customerId, productId, qty);

                    if (success)
                    {
                        lblMessage.Text = "商品已成功添加到购物车！";
                    }
                    else
                    {
                        lblMessage.Text = "添加到购物车失败，请稍后再试！";
                    }
                }
                else
                {
                    lblMessage.Text = "未找到商品信息！";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "添加到购物车时出现错误，请稍后再试！";
                Console.WriteLine("添加购物车异常：" + ex.Message);
            }
        }
    }
}
