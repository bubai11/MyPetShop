using System;
using System.Data;
using MyPetShop.BLL;

namespace MyPetShop.Web.Admin
{
    public partial class AddPro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate category dropdown list
                CategoryService categoryService = new CategoryService();
                DataTable categories = categoryService.GetAllCategories();
                ddlCategoryId.DataSource = categories;
                ddlCategoryId.DataTextField = "Name";
                ddlCategoryId.DataValueField = "CategoryId";
                ddlCategoryId.DataBind();

                // Populate supplier dropdown list
                SupplierService supplierService = new SupplierService();

                DataTable suppliers = supplierService.GetAllSuppliers();
                ddlSuppId.DataSource = suppliers;
                ddlSuppId.DataTextField = "Name";
                ddlSuppId.DataValueField = "SuppId";
                ddlSuppId.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    DataTable product = new DataTable();
                    product.Columns.Add("CategoryId", typeof(int));
                    product.Columns.Add("ListPrice", typeof(decimal));
                    product.Columns.Add("UnitCost", typeof(decimal));
                    product.Columns.Add("SuppId", typeof(int));
                    product.Columns.Add("Name", typeof(string));
                    product.Columns.Add("Descn", typeof(string));
                    product.Columns.Add("Image", typeof(string));
                    product.Columns.Add("Qty", typeof(int));

                    DataRow dataRow = product.NewRow();
                    dataRow["CategoryId"] = ddlCategoryId.SelectedValue;
                    dataRow["ListPrice"] = Convert.ToDecimal(txtListPrice.Text.Trim());
                    dataRow["UnitCost"] = Convert.ToDecimal(txtUnitCost.Text.Trim());
                    dataRow["SuppId"] = ddlSuppId.SelectedValue;
                    dataRow["Name"] = txtName.Text.Trim();
                    dataRow["Descn"] = txtDescn.Text.Trim();
                    dataRow["Image"] = txtImage.Text.Trim();
                    dataRow["Qty"] = Convert.ToInt32(txtQty.Text.Trim());

                    ProductService service = new ProductService();
                    service.AddProduct(dataRow);

                    lblMessage.Text = "商品信息添加成功！";
                    Response.Redirect("ProductMaster.aspx");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "添加失败：" + ex.Message;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductMaster.aspx");
        }
    }
}