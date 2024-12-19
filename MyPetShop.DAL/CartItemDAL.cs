using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MyPetShop.DAL
{
    public class CartItemDAL
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["MyPetShopConnectionString"].ConnectionString;
        // 添加商品到购物车
        public void AddToCart(int customerId, int productId, string productName, decimal listPrice, int quantity)
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
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@CustomerId", customerId);
                        cmd.Parameters.AddWithValue("@ProductId", productId);
                        cmd.Parameters.AddWithValue("@ProductName", productName);
                        cmd.Parameters.AddWithValue("@ListPrice", listPrice);
                        cmd.Parameters.AddWithValue("@Quantity", quantity);

                        cmd.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    // 处理异常
                    throw new ApplicationException("添加到购物车失败: " + ex.Message);
                }
            }
        }

        // 获取购物车商品列表
        public DataTable GetCartItems(int customerId)
        {
            DataTable dataTable = new DataTable();
            string sql = @"
                SELECT 
                    CartItemId, 
                    ProId, 
                    ProName, 
                    ListPrice, 
                    Qty, 
                    (ListPrice * Qty) AS TotalPrice
                FROM CartItem
                WHERE CustomerId = @CustomerId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@CustomerId", customerId);

                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            adapter.Fill(dataTable);
                        }
                    }
                }
                catch (Exception ex)
                {
                    // 处理异常
                    throw new ApplicationException("获取购物车数据失败: " + ex.Message);
                }
            }

            return dataTable;
        }
    }
}
