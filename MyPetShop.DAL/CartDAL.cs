using System;
using System.Configuration;
using System.Data.SqlClient;

namespace MyPetShop.DAL
{
    public class CartDAL
    {
        private readonly string connectionString =
            ConfigurationManager.ConnectionStrings["MyPetShopConnectionString"].ConnectionString;

        public string SaveOrder(int CustomerId, string UserName, string Addr1, string Addr2, string City, string State, string Zip, string Phone)
        {
            string orderStatus = "Pending"; // 假设初始订单状态为"Pending"
            DateTime orderDate = DateTime.Now; // 获取当前时间作为订单日期

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    // 插入订单到数据库（这里需要具体的SQL语句或存储过程）
                    string sql = "INSERT INTO [Order] (CustomerId, UserName, Addr1, Addr2, City, State, Zip, Phone, Status, OrderDate) VALUES (@CustomerId, @UserName, @Addr1, @Addr2, @City, @State, @Zip, @Phone, @Status, @OrderDate)";

                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@CustomerId", CustomerId);
                        cmd.Parameters.AddWithValue("@UserName", UserName);
                        cmd.Parameters.AddWithValue("@Addr1", Addr1);
                        cmd.Parameters.AddWithValue("@Addr2", Addr2);
                        cmd.Parameters.AddWithValue("@City", City);
                        cmd.Parameters.AddWithValue("@State", State);
                        cmd.Parameters.AddWithValue("@Zip", Zip);
                        cmd.Parameters.AddWithValue("@Phone", Phone);
                        cmd.Parameters.AddWithValue("@Status", orderStatus);
                        cmd.Parameters.AddWithValue("@OrderDate", orderDate); // 添加订单日期参数

                        cmd.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    // 处理数据库异常，可以记录日志或抛出
                    throw new Exception("保存订单时出错: " + ex.Message, ex); // 保留了内部异常信息，便于调试
                }
            }

            return orderStatus;
        }
    }
}