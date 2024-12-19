using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MyPetShop.DAL
{
    public class CartItemDAL
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["MyPetShopConnectionString"].ConnectionString;

        // 添加或更新购物车商品
        public bool InsertCartItem(int customerId, int proId, string proName, decimal listPrice, int qty)
        {
            string sql = @"
                IF EXISTS (SELECT 1 FROM CartItem WHERE CustomerId = @CustomerId AND ProId = @ProId)
                BEGIN
                    UPDATE CartItem
                    SET Qty = Qty + @Qty
                    WHERE CustomerId = @CustomerId AND ProId = @ProId
                END
                ELSE
                BEGIN
                    INSERT INTO CartItem (CustomerId, ProId, ProName, ListPrice, Qty)
                    VALUES (@CustomerId, @ProId, @ProName, @ListPrice, @Qty)
                END";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = customerId;
                    cmd.Parameters.Add("@ProId", SqlDbType.Int).Value = proId;
                    cmd.Parameters.Add("@ProName", SqlDbType.NVarChar, 80).Value = proName;
                    cmd.Parameters.Add("@ListPrice", SqlDbType.Decimal).Value = listPrice;
                    cmd.Parameters.Add("@Qty", SqlDbType.Int).Value = qty;

                    conn.Open();
                    int result = cmd.ExecuteNonQuery();
                    return result > 0;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("插入或更新购物车时发生错误：" + ex.Message);
                return false;
            }
        }

        // 删除购物车商品]
        //public bool DeleteProductFromCart(int customerId, int productId)
        //{
        //    string query = "DELETE FROM Cart WHERE CustomerId = @CustomerId AND ProductId = @ProductId";
        //    using (SqlConnection conn = new SqlConnection(connectionString))
        //    {
        //        SqlCommand cmd = new SqlCommand(query, conn);
        //        cmd.Parameters.AddWithValue("@CustomerId", customerId);
        //        cmd.Parameters.AddWithValue("@ProductId", productId);

        //        conn.Open();
        //        int result =cmd.ExecuteNonQuery();
        //        return result > 0;
        //    }
        //}
        public bool DeleteCartItem(int cartItemId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string sql = "DELETE FROM CartItem WHERE CartItemId = @CartItemId";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.Add("@CartItemId", SqlDbType.Int).Value = cartItemId;

                    conn.Open();
                    int result = cmd.ExecuteNonQuery();
                    return result > 0;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("删除购物车商品时发生错误：" + ex.Message);
                return false;
            }
        }

        // 更新购物车中商品的数量
        public bool UpdateCartItemQuantity(int customerId, int proId, int qty)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = @"
            UPDATE CartItem
            SET Qty = @Qty
            WHERE CustomerId = @CustomerId AND ProId = @ProId";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@CustomerId", customerId);
                cmd.Parameters.AddWithValue("@ProId", proId);
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
                return result > 0; // 如果影响的行数大于0，表示删除成功
            }
        }

        // 获取购物车中所有商品
        public DataTable GetCartItems(int customerId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string sql = @"
                SELECT 
                    CartItemId, 
                    ProId, 
                    ProName, 
                    ListPrice, 
                    Qty 
                FROM CartItem 
                WHERE CustomerId = @CustomerId";

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
                return null; // 返回 null 表示出现异常
            }
        }

        // 计算购物车总价
        public decimal CalculateCartTotal(int customerId)
        {
            decimal total = 0;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string sql = @"
                SELECT SUM(ListPrice * Qty) AS TotalPrice 
                FROM CartItem 
                WHERE CustomerId = @CustomerId";

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@CustomerId", customerId);

                    conn.Open();

                    object result = cmd.ExecuteScalar(); // 获取单个值
                    if (result != DBNull.Value && result != null)
                    {
                        total = Convert.ToDecimal(result);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("计算购物车总价时出错：" + ex.Message);
            }

            return total;
        }

    }

}
