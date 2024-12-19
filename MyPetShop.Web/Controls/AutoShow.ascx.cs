using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyPetShop.BLL;
using MyPetShop.DAL;

namespace MyPetShop.Web.UserControls
{
    public partial class AutoShow : System.Web.UI.UserControl
    {
        private readonly ProductService productService = new ProductService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadHotProducts();
            }

        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            LoadHotProducts(); // 定时刷新热销商品
        }
        private void LoadHotProducts()
        {
            // 调用服务层方法获取热销商品
            DataTable hotProducts = productService.GetHotProducts();
            gvHotProducts.DataSource = hotProducts;
            gvHotProducts.DataBind();
        }
        //private static int currentIndex = 0;
        //private static Product currentProduct;

        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        // 加载热销商品
        //        LoadHotProducts();
        //    }
        //}

        //// 定时器事件处理，每3秒更新商品信息
        //protected void Timer1_Tick(object sender, EventArgs e)
        //{
        //    // 更新当前显示的商品
        //    currentIndex = (currentIndex + 1) % hotProducts.Count;
        //    currentProduct = hotProducts[currentIndex];

        //    // 绑定新的商品数据到 GridView
        //    gvHotProducts.DataSource = new[] { currentProduct };
        //    gvHotProducts.DataBind();
        //}

        //private List<Product> hotProducts;

        //private void LoadHotProducts()
        //{
        //    // 假设热销商品是数量最多的商品，你可以根据自己的规则修改此部分
        //    using (var db = new MyPetShopDataContext())
        //    {
        //        hotProducts = db.Product
        //            .Where(p => p.Qty > 0)  // 只显示有库存的商品
        //            .OrderByDescending(p => p.Qty)  // 假设按库存数量降序排序（或者其他逻辑）
        //            .Take(10)  // 获取前10个热销商品
        //            .ToList();
        //    }

        //    // 绑定第一个商品到 GridView
        //    if (hotProducts.Count > 0)
        //    {
        //        currentProduct = hotProducts[currentIndex];
        //        gvHotProducts.DataSource = new[] { currentProduct };
        //        gvHotProducts.DataBind();
        //    }
        //}
    }
}
