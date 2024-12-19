using MyPetShop.BLL;
using MyPetShop.DAL;
using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;

namespace MyPetShop.Web.Pages
{
    public partial class ShopCart : System.Web.UI.Page
    {
        //private const string CartSessionKey = "CartTotal";
        private CartItemService cartItemSrv = new CartItemService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int customerId = Convert.ToInt32(HttpContext.Current.Session["CustomerId"]);
                if (customerId == 0)
                {
                    lblCart.Text = "请先登录查看购物车！";
                    return;
                }
                BindCart(customerId);
            }
        }
        //获取当前用户的 ID
        //private int GetCustomerIdFromSession()
        //{
        //    return Convert.ToInt32(Session["CustomerId"]);
        //}

        private void BindCart(int customerId)
        {
            DataTable cartItems = cartItemSrv.GetCart(customerId);
            if (cartItems != null && cartItems.Rows.Count > 0)
            {
                GridView1.DataSource = cartItems;
                GridView1.DataBind();
                decimal total = cartItemSrv.CalculateTotal(customerId);
                //Session[CartSessionKey] = total;
                lblTotalPrice.Text = $"总价: {total:C2}";
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                Console.WriteLine("购物车为空或获取失败！");
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select") // 选择操作
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];

                int proId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values["ProId"]);
                int qty = Convert.ToInt32(((TextBox)row.FindControl("txtQty")).Text);

                lblCart.Text = $"已选择商品 ID: {proId}，数量: {qty}";
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // 获取 CartItemId
            int cartItemId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["CartItemId"]);

            // 调用删除商品方法
            CartItemService cartItemSrv = new CartItemService();
            bool isDeleted = cartItemSrv.DeleteProductFromCart(cartItemId);

            if (isDeleted)
            {
                lblCart.Text = "商品已成功删除！";
            }
            else
            {
                lblCart.Text = "删除商品失败！";
            }

            // 重新绑定购物车
            int customerId = Convert.ToInt32(HttpContext.Current.Session["CustomerId"]);
            BindCart(customerId);
        }


        protected void txtQty_TextChanged(object sender, EventArgs e)
        {
            TextBox txtQty = (TextBox)sender;
            GridViewRow row = (GridViewRow)txtQty.NamingContainer;

            // 确保行不是在编辑模式下添加的新行
            if (row.RowType == DataControlRowType.DataRow)
            {
                // 获取 DataItem
                var dataItem = row.DataItem;
                // 假设 DataItem 是 DataRowView 类型，使用索引访问器来获取列值
                int customerId = Convert.ToInt32(((DataRowView)dataItem)["CustomerId"]);
                int proId = Convert.ToInt32(((DataRowView)dataItem)["ProId"]);
                int qty = Convert.ToInt32(txtQty.Text);

                bool isUpdated = cartItemSrv.UpdateProductQuantity(customerId, proId, qty);
                if (isUpdated)
                {
                    Console.WriteLine("购物车商品数量更新成功！");
                }
                else
                {
                    Console.WriteLine("购物车商品数量更新失败！");
                }
                BindCart(customerId);
            }
        }

        //protected void btnUpdate_Click(object sender, EventArgs e)
        //{
        //    BindCart();
        //}


        // 清空购物车按钮点击事件
        protected void btnClear_Click(object sender, EventArgs e)
        {
            bool isCleared = cartItemSrv.ClearCart(Session["CustomerId"] as int? ?? 0);
            if (isCleared)
            {
                Console.WriteLine("购物车已清空！");
            }
            else
            {
                Console.WriteLine("购物车为空，未做任何操作！");
            }
            Response.Redirect(ResolveUrl("~/Default.aspx"));
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // Redirect to checkout page
            // This should be handled by the checkout process
            // For simplicity, we just redirect to a placeholder page
            Response.Redirect(ResolveUrl("~/Pages/SubmitCart.aspx"));
        }
        ////删除所选的商品
        //protected void btnDeleteSelected_Click(object sender, EventArgs e)
        //{
        //    int customerId = GetCustomerIdFromSession();
        //    foreach (GridViewRow row in GridView1.Rows)
        //    {
        //        CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
        //        if (chkSelect != null && chkSelect.Checked)
        //        {
        //            // 获取商品 ID
        //            int proId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
        //            cartItemSrv.DeleteProductFromCart(customerId, proId);
        //        }
        //    }
        //    // 重新绑定购物车
        //    BindCart(Session["CustomerId"] as int? ?? 0);
        //}
    }
}