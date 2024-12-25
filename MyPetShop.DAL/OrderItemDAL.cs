using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyPetShop.DAL
{
    public class OrderItemDAL
    {
        private readonly string connectionString =
            ConfigurationManager.ConnectionStrings["MyPetShopConnectionString"].ConnectionString;

        // 获取订单主表信息
        public DataRow GetOrderById(int orderId)
        {
            string query = "SELECT * FROM [Order] WHERE OrderId = @OrderId";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@OrderId", orderId);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt.Rows.Count > 0 ? dt.Rows[0] : null;
            }
        }

        //// 获取订单商品详情
        //public DataTable GetOrderItemsByOrderId(int orderId)
        //{
        //    string query = "SELECT * FROM [OrderItem] WHERE OrderId = @OrderId";
        //    using (SqlConnection conn = new SqlConnection(connectionString))
        //    {
        //        SqlCommand cmd = new SqlCommand(query, conn);
        //        cmd.Parameters.AddWithValue("@OrderId", orderId);
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);
        //        return dt;
        //    }
        //}

        // 获取指定订单的所有商品信息
        public List<OrderItem> GetOrderItemsByOrderId(int orderId)
        {
            string query = "SELECT * FROM [OrderItem] WHERE OrderId = @OrderId";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@OrderId", orderId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                List<OrderItem> items = new List<OrderItem>();
                while (reader.Read())
                {
                    items.Add(new OrderItem
                    {
                        ProName = reader["ProName"].ToString(),
                        ListPrice = Convert.ToDecimal(reader["ListPrice"]),
                        Qty = Convert.ToInt32(reader["Qty"]),
                        TotalPrice = Convert.ToDecimal(reader["TotalPrice"])
                    });
                }

                return items;
            }
        }
    }
}
