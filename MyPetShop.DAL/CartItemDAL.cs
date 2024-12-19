using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace MyPetShop.DAL
{
    public class CartItemDAL
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["MyPetShopConnectionString"].ConnectionString;

        public bool InsertCartItem(int customerId, int proId, string proName, decimal listPrice, int qty)
        {
            string sql = @"
                IF EXISTS (SELECT 1 FROM CartItem WHERE CustomerId = @CustomerId AND ProId = @ProductId)
                BEGIN
                    UPDATE CartItem
                    SET Qty = Qty + @Quantity
                    WHERE CustomerId = @CustomerId AND ProId = @ProductId
                END
                ELSE
                BEGIN
                    INSERT INTO CartItem (CustomerId, ProId, ProName, ListPrice, Qty)
                    VALUES (@CustomerId, @ProductId, @ProductName, @ListPrice, @Quantity)
                END";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string usingsql = "INSERT INTO CartItem (CustomerId, ProId, ProName, ListPrice, Qty) VALUES (@CustomerId, @ProId, @ProName, @ListPrice, @Qty)";
                SqlCommand cmd = new SqlCommand(usingsql, conn);
                cmd.Parameters.AddWithValue("@CustomerId", customerId);
                cmd.Parameters.AddWithValue("@ProId", proId);
                cmd.Parameters.AddWithValue("@ProName", proName);
                cmd.Parameters.AddWithValue("@ListPrice", listPrice);
                cmd.Parameters.AddWithValue("@Qty", qty);

                conn.Open();
                int result = cmd.ExecuteNonQuery();
                return result > 0;
            }
        }

        // 删除购物车商品
        public bool DeleteCartItem(int cartItemId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "DELETE FROM CartItem WHERE CartItemId = @CartItemId";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@CartItemId", cartItemId);

                conn.Open();
                int result = cmd.ExecuteNonQuery();
                return result > 0;
            }
        }

        // 更新购物车中商品的数量
        public bool UpdateCartItemQuantity(int cartItemId, int qty)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "UPDATE CartItem SET Qty = @Qty WHERE CartItemId = @CartItemId";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@CartItemId", cartItemId);
                cmd.Parameters.AddWithValue("@Qty", qty);

                conn.Open();
                int result = cmd.ExecuteNonQuery();
                return result > 0;
            }
        }

        // 清空购物车
        public bool ClearCartItems(int customerId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "DELETE FROM CartItem WHERE CustomerId = @CustomerId";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@CustomerId", customerId);

                conn.Open();
                int result = cmd.ExecuteNonQuery();
                return result > 0;
            }
        }

        // 获取购物车中所有商品
        public DataTable GetCartItems(int customerId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string sql = "SELECT CartItemId, ProId, ProName, ListPrice, Qty FROM CartItem WHERE CustomerId = @CustomerId";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@CustomerId", customerId);

                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                    DataTable resultTable = new DataTable();
                    adapter.Fill(resultTable);

                    return resultTable;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("获取购物车商品时出错：" + ex.Message);
                return null;
            }
        }

        // 计算购物车总价
        public decimal CalculateCartTotal(int customerId)
        {
            decimal total = 0;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "SELECT SUM(ListPrice * Qty) FROM CartItem WHERE CustomerId = @CustomerId";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@CustomerId", customerId);

                conn.Open();
                total = (decimal)cmd.ExecuteScalar();
            }
            return total;
        }
    }
}
