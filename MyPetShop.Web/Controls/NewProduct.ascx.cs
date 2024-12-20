using MyPetShop.BLL;
using MyPetShop.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web.Controls
{
    public partial class NewProduct : System.Web.UI.UserControl
    {
        private readonly ProductService productService = new ProductService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNewProducts();
            }
        }
        public void LoadNewProducts()
        {
            try
            {
                // 从 ProductService 获取最新商品
                var products = productService.GetLatestProducts(7);  // 获取前7个最新商品

                if (products != null && products.Count > 0)
                {
                    NewProductGridView.DataSource = products;
                    NewProductGridView.DataBind();
                }
                else
                {
                    // 如果没有商品，绑定一个空列表或显示一个消息
                    NewProductGridView.DataSource = new List<Product>();  // 绑定一个空列表，避免空引用异常
                    NewProductGridView.DataBind();
                }
            }
            catch (Exception ex)
            {
                // 记录或处理异常
                Console.WriteLine("加载新商品时出错: " + ex.Message);
            }
        }

        //private void LoadNewProducts()
        //{
        //    // 从 ProductService 获取最新商品
        //    var products = productService.GetLatestProducts(7);  // 获取前5个最新商品
        //    NewProductGridView.DataSource = products;
        //    NewProductGridView.DataBind();
        //}
    }
}