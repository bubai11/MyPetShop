using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyPetShop.BLL;

namespace MyPetShop.Web.Admin
{
    public partial class OrderMaster : System.Web.UI.Page
    {
        private readonly OrderService orderService = new OrderService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrders();
            }

        }
        // 绑定订单数据到GridView
        private void BindOrders()
        {
            gvOrders.DataSource = orderService.GetOrders();
            gvOrders.DataBind();
            // 确保每行绑定了 DataKey
            if (gvOrders.DataSource is DataTable dataTable)
            {
                gvOrders.DataKeyNames = new[] { "OrderId" };
            }
        }

        // 订单详情点击事件
        protected void gvOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int orderId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Review")
            {
                // 更新订单状态为已审核
                orderService.ReviewOrder(orderId);
                BindOrders(); // 更新数据
            }
            else if (e.CommandName == "Details")
            {
                // 跳转到订单详情页面
                Response.Redirect($"OrderSub.aspx?OrderId={orderId}");
            }
        }

        // 批量审核
        protected void btnBulkReview_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvOrders.Rows)
            {
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                if (chkSelect != null && chkSelect.Checked)
                {
                    int orderId = Convert.ToInt32(gvOrders.DataKeys[row.RowIndex].Value);
                    orderService.ReviewOrder(orderId);
                }
            }
            BindOrders(); // 更新数据
        }

        // 分页
        protected void gvOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvOrders.PageIndex = e.NewPageIndex;
            BindOrders();
        }
    }
}