﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyPetShop.BLL;
using MyPetShop.DAL;

namespace MyPetShop.Web.Controls
{
    public partial class AutoShow : System.Web.UI.UserControl
    {
        private int currentIndex = 0;
        private List<DataRow> productsList;
        private readonly ProductService productService = new ProductService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        // 获取所有商品数据并加载到 GridView
        private void LoadProducts()
        {
            try
            {
                DataTable products = productService.GetAllProducts();  // 获取商品数据
                if (products != null && products.Rows.Count > 0)
                {
                    productsList = products.AsEnumerable().ToList();  // 将 DataTable 转换为 List<DataRow>
                    BindProduct();  // 绑定商品数据
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("没有获取到商品数据。");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("加载商品数据时发生错误：" + ex.Message);
            }
        }

        // 绑定商品到 GridView
        private void BindProduct()
        {
            if (productsList != null && productsList.Count > 0)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ProductId");
                dt.Columns.Add("Name");
                dt.Columns.Add("ListPrice");
                dt.Columns.Add("UnitCost");
                dt.Columns.Add("Descn");
                dt.Columns.Add("Image");
                dt.Columns.Add("Qty");

                // 获取当前显示的商品
                DataRow currentProduct = productsList[currentIndex];
                dt.Rows.Add(currentProduct.ItemArray);

                gvProducts.DataSource = dt; // 绑定当前商品数据到 GridView
                gvProducts.DataBind();
            }
        }

        // Timer 触发事件，每 3 秒切换商品
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            try
            {
                // 确保 productsList 已加载并不为空
                if (productsList == null || productsList.Count == 0)
                {
                    System.Diagnostics.Debug.WriteLine("商品列表为空，无法切换商品。");
                    return;  // 如果没有商品数据，跳出事件处理
                }

                currentIndex++;  // 切换到下一个商品

                if (currentIndex >= productsList.Count)
                {
                    currentIndex = 0;  // 如果已经显示到最后一个商品，则从头开始
                }

                BindProduct();  // 重新绑定商品数据
            }
            catch (Exception ex)
            {
                // 捕获异常并输出调试信息
                System.Diagnostics.Debug.WriteLine("服务器错误：" + ex.Message);
                lblMessage.Text = "发生错误，请稍后再试。";  // 提示用户
            }
        }
        // 加入购物车事件
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
                int productId = Convert.ToInt32(btn.CommandArgument); // 获取当前商品的 ProductId

                // 查询商品信息
                ProductDAL productDAL = new ProductDAL();
                DataTable productData = productDAL.GetProductById(productId); // 通过 ProductId 获取商品信息

                if (productData.Rows.Count > 0)
                {
                    DataRow product = productData.Rows[0];  // 获取商品的第一行数据（假设商品唯一）
                    int qty = 1;  // 默认数量为 1，您可以根据需求修改

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