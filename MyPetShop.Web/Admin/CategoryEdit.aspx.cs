using System;
using System.Data;
using MyPetShop.BLL;

namespace MyPetShop.Web.Admin
{
    public partial class CategoryEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["CategoryId"] != null)
                {
                    int categoryId = Convert.ToInt32(Request.QueryString["CategoryId"]);
                    CategoryService service = new CategoryService();
                    DataRow category = service.GetCategoryById(categoryId);
                    if (category != null)
                    {
                        txtName.Text = category["Name"].ToString();
                        txtDescn.Text = category["Descn"].ToString();
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("CategoryId", typeof(int));
            dataTable.Columns.Add("Name", typeof(string));
            dataTable.Columns.Add("Descn", typeof(string));
            DataRow dataRow = dataTable.NewRow();
            dataRow["Name"] = txtName.Text.Trim();
            dataRow["Descn"] = txtDescn.Text.Trim();

            if (Request.QueryString["CategoryId"] != null)
            {
                int categoryId = Convert.ToInt32(Request.QueryString["CategoryId"]);
                dataRow["CategoryId"] = categoryId;
                CategoryService service = new CategoryService();
                service.UpdateCategory(dataRow);
                lblMessage.Text = "分类信息更新成功！";
            }
            else
            {
                CategoryService service = new CategoryService();
                service.AddCategory(dataRow);
                lblMessage.Text = "分类信息添加成功！";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoryMaster.aspx");
        }
    }
}