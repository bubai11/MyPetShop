using System;
using System.Data;
using System.Text;
using System.Web.UI.WebControls;
using MyPetShop.BLL;

namespace MyPetShop.Web.Admin
{
    public partial class ProductMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts();
            }
        }

        private void BindProducts()
        {
            ProductService service = new ProductService();
            gvProducts.DataSource = service.GetAllProducts();
            gvProducts.DataBind();
        }

        protected void gvProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProducts.PageIndex = e.NewPageIndex;
            BindProducts();
        }
        protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // 检查 CommandName 是否为 "Edit" 或其他自定义命令
            if (e.CommandName == "Edit")
            {
                // 从 CommandArgument 获取 ProductId
                int productId = Convert.ToInt32(e.CommandArgument);
                // 重定向到编辑页面，传递 ProductId
                Response.Redirect($"ProductSub.aspx?ProductId={productId}");
            }
            else if (e.CommandName == "Delete")
            {
                // 从 CommandArgument 获取 ProductId
                int productId = Convert.ToInt32(e.CommandArgument);
                // 调用删除方法
                ProductService service = new ProductService();
                service.DeleteProduct(productId);
                // 重新绑定数据
                BindProducts();
            }
        }

        protected void btnDeleteSelected_Click(object sender, EventArgs e)
        {
            StringBuilder selectedIds = new StringBuilder();
            foreach (GridViewRow row in gvProducts.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                if (chkSelect != null && chkSelect.Checked)
                {
                    int productId = Convert.ToInt32(gvProducts.DataKeys[row.RowIndex].Value);
                    if (selectedIds.Length > 0)
                    {
                        selectedIds.Append(",");
                    }
                    selectedIds.Append(productId.ToString());
                }
            }

            if (selectedIds.Length > 0)
            {
                string ids = selectedIds.ToString();
                string[] productIds = ids.Split(',');

                ProductService service = new ProductService();
                foreach (string productIdStr in productIds)
                {
                    int productId = Convert.ToInt32(productIdStr.Trim());
                    service.DeleteProduct(productId); // 删除商品及其相关的购物车项
                }

                BindProducts();
                lblMessage.Text = "选中商品删除成功！";
            }
            else
            {
                lblMessage.Text = "请选择要删除的商品。";
            }
        }
        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddPro.aspx");
        }
    }
}