using System;
using System.Data;
using System.Web.UI.WebControls;
using MyPetShop.BLL;

namespace MyPetShop.Web.Admin
{
    public partial class CategoryMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategories();
            }
        }

        private void BindCategories()
        {
            CategoryService service = new CategoryService();
            rptCategories.DataSource = service.GetAllCategories();
            rptCategories.DataBind();
        }
        protected void rptCategories_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                int categoryId = Convert.ToInt32(e.CommandArgument);
                if (e.CommandName == "Edit")
                {
                    Response.Redirect($"CategoryEdit.aspx?CategoryId={categoryId}");
                }
                else if (e.CommandName == "Delete")
                {
                    CategoryService service = new CategoryService();
                    service.DeleteCategory(categoryId);
                    BindCategories();
                }
            }
            catch (Exception ex)
            {
                // Log the exception details
                Console.WriteLine($"Error processing command: {ex.Message}");
                // Handle the error appropriately, e.g., show an error message to the user
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoryEdit.aspx");
        }
    }
}