using MyPetShop.BLL;
using MyPetShop.DAL;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;

namespace MyPetShop.Web.Pages
{
    public partial class ProShow : System.Web.UI.Page
    {

        private CategoryService categoryService = new CategoryService();
        private CartItemService cartItemService = new CartItemService();
        private ProductService productService = new ProductService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //LoadCategoryNavigation();  // 加载商品分类导航
                LoadProductList();         // 加载商品详细信息列表
            }
        }
        protected void CategoryNavigation1_SelectedNodeChanged(object sender, EventArgs e)
        {
            // 获取所选分类的节点数据
            string categoryId = CategoryNavigation1.SelectedValue;

            // 查询该分类下的商品
            var products = productService.GetProductsByCategory(int.Parse(categoryId)); // 假设此方法返回该分类下的商品列表

            // 绑定查询到的商品数据
            ProductGridView.DataSource = products;
            ProductGridView.DataBind();

            // 如果没有商品，显示提示信息
            if (products.Count == 0)
            {
                lblNoProduct.Visible = true;
            }
            else
            {
                lblNoProduct.Visible = false;
            }
        }




        //// 加载商品分类导航
        //private void LoadCategoryNavigation()
        //{
        //    CategoryNavigation1.LoadCategories();
        //}

        // 加载商品列表
        private void LoadProductList()
        {
            int categoryId = 0;
            string productName = Request.QueryString["ProductName"];
            if (string.IsNullOrEmpty(productName) && string.IsNullOrEmpty(Request.QueryString["CategoryId"]))
            {
                // 如果没有查询参数，则显示提示信息
                lblNoProduct.Visible = true;
                ProductGridView.Visible = false;
                return;  // 如果没有商品参数，退出加载商品的过程
            }

            // 设置分类 ID
            if (!string.IsNullOrEmpty(Request.QueryString["CategoryId"]))
            {
                categoryId = int.Parse(Request.QueryString["CategoryId"]);
            }

            List<Product> products;
            if (!string.IsNullOrEmpty(productName))
            {
                products = productService.GetProductsByName(productName);  // 按商品名称查询
            }
            else
            {
                products = productService.GetProductsByCategory(categoryId);  // 按分类查询
            }

            // 如果有商品，则隐藏提示信息并显示商品列表
            lblNoProduct.Visible = false;
            ProductGridView.Visible = true;

            ProductGridView.DataSource = products;
            ProductGridView.DataBind();
        }

        // 分页处理
        protected void ProductGridView_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            ProductGridView.PageIndex = e.NewPageIndex;
            LoadProductList();  // 重新加载商品列表并应用新分页
        }

        // 添加商品到购物车
        protected void AddToCart_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int productId = int.Parse(button.CommandArgument.ToString());

            // 调用购物车服务将商品添加到购物车
            int customerId = Convert.ToInt32(Session["CustomerId"]);
            int qty = 1; // 默认数量为 1
            cartItemService.AddProductToCart(customerId, productId, qty);
            lblNoProduct.Visible = true;
            lblNoProduct.Text = "商品已加入购物车";
            // 提示用户商品已加入购物车
            //Response.Redirect(ResolveUrl("~/Pages/S.aspx"));  // 重定向到购物车页面
        }
    }
}
