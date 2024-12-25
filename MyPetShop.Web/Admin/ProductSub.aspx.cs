using System;
using System.Data;
using System.IO;
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

                    if (product.Rows.Count > 0)
                    {
                        txtName.Text = product.Rows[0]["Name"].ToString();
                        txtListPrice.Text = product.Rows[0]["ListPrice"].ToString();
                        txtUnitCost.Text = product.Rows[0]["UnitCost"].ToString();
                        ddlCategoryId.SelectedValue = product.Rows[0]["CategoryId"].ToString();
                        ddlSuppId.SelectedValue = product.Rows[0]["SuppId"].ToString();
                        txtDescn.Text = product.Rows[0]["Descn"].ToString();
                        txtQty.Text = product.Rows[0]["Qty"].ToString();
                        string imagePath = product.Rows[0]["Image"].ToString();
                        if (!string.IsNullOrEmpty(imagePath))
                        {
                            imgCurrentImage.ImageUrl = imagePath;
                            imgCurrentImage.Visible = true;
                        }
                    }
                }
            }
            else
            {
                // This is a postback, check if an image was uploaded
                if (fuImage.HasFile)
                {
                    // Display the uploaded image
                    string fileName = Path.GetFileName(fuImage.PostedFile.FileName);
                    string filePath = Server.MapPath("~/Images/" + fileName);
                    fuImage.SaveAs(filePath);
                    imgCurrentImage.ImageUrl = "~/Images/" + fileName;
                    imgCurrentImage.Visible = true;
                }
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            // This method is not necessary if you handle the upload in Page_Load
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    DataTable productUpdates = new DataTable();
                    productUpdates.Columns.Add("CategoryId", typeof(int));
                    productUpdates.Columns.Add("ListPrice", typeof(decimal));
                    productUpdates.Columns.Add("UnitCost", typeof(decimal));
                    productUpdates.Columns.Add("SuppId", typeof(int));
                    productUpdates.Columns.Add("Name", typeof(string));
                    productUpdates.Columns.Add("Descn", typeof(string));
                    productUpdates.Columns.Add("Image", typeof(string));
                    productUpdates.Columns.Add("Qty", typeof(int));
                    productUpdates.Columns.Add("ProductId", typeof(int));

                    DataRow dataRow = productUpdates.NewRow();
                    dataRow["CategoryId"] = int.Parse(ddlCategoryId.SelectedValue);
                    dataRow["ListPrice"] = decimal.Parse(txtListPrice.Text.Trim());
                    dataRow["UnitCost"] = decimal.Parse(txtUnitCost.Text.Trim());
                    dataRow["SuppId"] = int.Parse(ddlSuppId.SelectedValue);
                    dataRow["Name"] = txtName.Text.Trim();
                    dataRow["Descn"] = txtDescn.Text.Trim();
                    dataRow["Qty"] = int.Parse(txtQty.Text.Trim());
                    dataRow["ProductId"] = int.Parse(Request.QueryString["ProductId"]);

                    string imagePath = string.Empty;
                    if (fuImage.HasFile)
                    {
                        string fileName = Path.GetFileName(fuImage.PostedFile.FileName);
                        string filePath = Server.MapPath("~/Images/" + fileName);
                        fuImage.SaveAs(filePath);
                        imagePath = "~/Images/" + fileName;
                    }
                    else if (imgCurrentImage.ImageUrl != "~/Images/")
                    {
                        imagePath = imgCurrentImage.ImageUrl.Substring(2); // Get the path without the '~'
                    }

                    dataRow["Image"] = imagePath;

                    ProductService service = new ProductService();
                    service.UpdateProduct(dataRow);

                    lblMessage.Text = "商品信息更新成功！";
                    Response.Redirect("ProductMaster.aspx");
                }
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