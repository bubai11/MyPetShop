using MyPetShop.BLL;
using MyPetShop.DAL;
using System;
using System.Collections.Generic;
using System.Data;
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
                LoadCategoryNavigation();  // 加载商品分类导航
                LoadProductList();         // 加载商品详细信息列表
            }
        }

        // 加载商品分类导航
        private void LoadCategoryNavigation()
        {
            // 直接调用 PetTree 用户控件的 LoadCategories 方法
            CategoryNavigation1.LoadCategories();
        }
        //// 加载商品分类导航
        //private void LoadCategoryNavigation()
        //{
        //    var categories = categoryService.GetAllCategories();  // 获取所有商品分类
        //    CategoryNavigation1.DataSource = categories;  // 假设 CategoryNavigation 是用户控件
        //    CategoryNavigation1.DataBind();
        //}

        // 加载商品列表
        private void LoadProductList()
        {
            int categoryId = 0;
            string productName = Request.QueryString["ProductName"];

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
            int customerId = Convert.ToInt32((HttpContext.Current.Session["CustomerId"]));
            int qty = 1; // 默认数量为 1
            cartItemService.AddProductToCart(customerId, productId, qty);

            // 提示用户商品已加入购物车
            Response.Redirect(ResolveUrl("~/Pages/SubmitCart.aspx"));  // 重定向到购物车页面
        }
    }
}
