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
    public class OrderDAL
    {
        private readonly string connectionString =ConfigurationManager.ConnectionStrings["MyPetShopConnectionString"].ConnectionString;
        //根据customerId获取订单
        public DataTable GetOrdersByCustomerId(int customerId)
        {
            // 创建用于存储订单数据的 DataTable
            DataTable ordersTable = new DataTable();

            // 确保正确处理数据库连接和异常
            try
            {
                // 使用 using 确保 SqlConnection 资源释放
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // 查询订单的 SQL 语句，使用 [] 包裹表名
                    string query = "SELECT OrderId, CustomerId, UserName, OrderDate, Addr1, City, Zip, Phone, Status FROM [Order] WHERE CustomerId = @CustomerId";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // 明确设置参数类型和大小，避免性能问题
                        command.Parameters.Add("@CustomerId", SqlDbType.Int).Value = customerId;

                        // 打开数据库连接
                        connection.Open();

                        // 使用 SqlDataAdapter 填充 DataTable
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            adapter.Fill(ordersTable);
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                // 记录 SQL 异常
                System.Diagnostics.Debug.WriteLine("SQL Error: " + ex.Message);
                throw new Exception("数据库操作失败，请稍后重试。", ex); // 或者返回友好的错误消息
            }
            catch (Exception ex)
            {
                // 捕获其他异常
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
                throw new Exception("发生未知错误，请稍后重试。", ex);
            }

            return ordersTable;
        }

        //保存订单
        public string SaveOrder(int CustomerId, string UserName, string Addr1, string Addr2, string City, string State, string Zip, string Phone)
        {
            string orderStatus = "未审核"; // 假设初始订单状态
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
