using MyPetShop.BLL;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace MyPetShop.Web.Pages
{
    public partial class ShopCart : System.Web.UI.Page
    {
        private const string CartSessionKey = "CartTotal";
        private CartItemService cartItemSrv = new CartItemService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }

        private void BindCart()
        {
            DataTable cartItems = cartItemSrv.GetCart(Session["CustomerId"] as int? ?? 0);
            GridView1.DataSource = cartItems;
            GridView1.DataBind();

            // Calculate and store the total in session
            decimal total = cartItemSrv.CalculateTotal(Session["CustomerId"] as int? ?? 0);
            Session[CartSessionKey] = total;
            lblMessage.Text = $"购物车总额: {total:C2}";
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                // Get the product ID from the command argument
                int cartItemId = Convert.ToInt32(e.CommandArgument);

                // Call the method to update the quantity
                // This should be done through a text box and update button for each item
                // For simplicity, we assume the quantity is updated through another method (not shown)
            }
            else if (e.CommandName == "Delete")
            {
                int cartItemId = Convert.ToInt32(e.CommandArgument);
                cartItemSrv.DeleteProductFromCart(cartItemId);
                BindCart();
            }
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
                int cartItemId = Convert.ToInt32(((DataRowView)dataItem)["CartItemId"]);
                int qty = Convert.ToInt32(txtQty.Text);

                cartItemSrv.UpdateProductQuantity(cartItemId, qty);
                BindCart();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            BindCart();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            cartItemSrv.ClearCart(Session["CustomerId"] as int? ?? 0);
            Response.Redirect("Default.aspx");
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // Redirect to checkout page
            // This should be handled by the checkout process
            // For simplicity, we just redirect to a placeholder page
            Response.Redirect("SubmitCart.aspx");
        }
    }
}