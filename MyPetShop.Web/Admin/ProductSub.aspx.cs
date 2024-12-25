using System;
using System.Data;
using MyPetShop.BLL;

namespace MyPetShop.Web.Admin
{
    public partial class ProductSub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ProductId"] != null)
                {
                    int productId = Convert.ToInt32(Request.QueryString["ProductId"]);
                    ProductService service = new ProductService();
                    DataTable product = service.GetProductById(productId);
                    if (product.Rows.Count > 0)
                    {
                        txtName.Text = product.Rows[0]["Name"].ToString();
                        txtListPrice.Text = product.Rows[0]["ListPrice"].ToString();
                        txtQty.Text = product.Rows[0]["Qty"].ToString();
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable productUpdates = new DataTable();
                productUpdates.Columns.Add("Name", typeof(string));
                productUpdates.Columns.Add("ListPrice", typeof(decimal));
                productUpdates.Columns.Add("Qty", typeof(int));

                DataRow dataRow = productUpdates.NewRow();
                dataRow["Name"] = txtName.Text.Trim();
                dataRow["ListPrice"] = Convert.ToDecimal(txtListPrice.Text.Trim());
                dataRow["Qty"] = Convert.ToInt32(txtQty.Text.Trim());

                ProductService service = new ProductService();
                service.UpdateProduct(dataRow);

                lblMessage.Text = "商品信息更新成功！";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "更新失败：" + ex.Message;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductMaster.aspx");
        }
    }
}