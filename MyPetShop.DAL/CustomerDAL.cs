using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace MyPetShop.DAL
{
    public class CustomerDAL
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["MyPetShopConnectionString"].ConnectionString;
        //private readonly string connectionString = "Server=localhost;Database=MyPetShop;User Id=sa;Password=123;";

        // 登录验证方法
        public Customer GetCustomerByCredentials(string username, string password)
        {
            try
            {
                Customer customer = null;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // 查询用户的详细信息
                    string sql = "SELECT CustomerId, Name, Email FROM Customer WHERE Name = @Name AND Password = @Password";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    //cmd.Parameters.AddWithValue("@Name", username);
                    //cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = username;
                    cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = password;


                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    System.Diagnostics.Debug.WriteLine("查询结果：" + reader.HasRows);
                    if (reader.Read())
                    {
                        // 如果查询到用户信息，则构造 Customer 对象
                        customer = new Customer
                        {
                            CustomerId = (int)reader["CustomerId"],
                            Name = reader["Name"].ToString(),
                            Email = reader["Email"].ToString()
                        };
                    }

                    reader.Close();
                }

                return customer; // 返回查询结果
            }
            catch (SqlException sqlEx)
            {
                Console.WriteLine("SQL 异常：" + sqlEx.Message);
                Console.WriteLine("错误代码：" + sqlEx.Number);
                throw new Exception("数据库操作失败，请稍后重试。", sqlEx);
            }
            catch (Exception ex)
            {
                Console.WriteLine("其他异常：" + ex.Message);
                throw;
            }
        }
        //注册验证方法
        // 注册新用户
        public bool RegisterCustomer(string name, string email, string password)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string sql = "INSERT INTO Customer (Name, Email, Password) VALUES (@Name, @Email, @Password)";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0; // 如果插入的行数大于 0，说明注册成功
                }
            }
            catch (SqlException sqlEx)
            {
                // 处理 SQL Server 异常
                Console.WriteLine("SQL 异常：" + sqlEx.Message);
                return false;
            }
            catch (Exception ex)
            {
                // 处理其他异常
                Console.WriteLine("其他异常：" + ex.Message);
                return false;
            }
        }

        // 检查用户名是否已存在
        public bool IsNameExists(string name)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string sql = "SELECT COUNT(*) FROM Customer WHERE Name = @Name";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@Name", name);

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0; // 如果查询结果大于 0，说明用户名已存在
                }
            }
            catch (SqlException sqlEx)
            {
                Console.WriteLine("SQL 异常：" + sqlEx.Message);
                return false;
            }
            catch (Exception ex)
            {
                Console.WriteLine("其他异常：" + ex.Message);
                return false;
            }
        }
    
     // 通过邮箱获取用户信息
        public Customer GetCustomerByEmail(string username, string email)
        {
            try
            {
                Customer customer = null;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // 查询用户的详细信息
                    string sql = "SELECT CustomerId, Name, Email FROM Customer WHERE Name = @Name AND Email = @Email";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = username;
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = email;

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    System.Diagnostics.Debug.WriteLine("查询结果：" + reader.HasRows);
                    if (reader.Read())
                    {
                        // 如果查询到用户信息，则构造 Customer 对象
                        customer = new Customer
                        {
                            CustomerId = (int)reader["CustomerId"],
                            Name = reader["Name"].ToString(),
                            Email = reader["Email"].ToString()
                        };
                    }

                    reader.Close();
                }

                return customer; // 返回查询结果
            }
            catch (SqlException sqlEx)
            {
                Console.WriteLine("SQL 异常：" + sqlEx.Message);
                return null;
            }
            catch (Exception ex)
            {
                Console.WriteLine("其他异常：" + ex.Message);
                return null;
            }
        }
        // 更新用户密码
        public bool UpdateCustomerPassword(string username,string pwd)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string sql = "UPDATE Customer SET Password = @Password WHERE Name = @Name AND Email = @Email";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = username;
                    cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = pwd;

                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
            catch (SqlException sqlEx)
            {
                Console.WriteLine("SQL 异常：" + sqlEx.Message);
                return false;
            }
            catch (Exception ex)
            {
                Console.WriteLine("其他异常：" + ex.Message);
                return false;
            }
        }
    }
} 


// 用户注册
//public bool Register(string name, string password, string email)
//{
//    using (SqlConnection conn = new SqlConnection(connectionString))
//    {
//        string query = "INSERT INTO Customer (Name, Password, Email) VALUES (@Name, @Password, @Email)";
//        SqlCommand cmd = new SqlCommand(query, conn);
//        cmd.Parameters.AddWithValue("@Name", name);
//        cmd.Parameters.AddWithValue("@Password", password);
//        cmd.Parameters.AddWithValue("@Email", email);
//    }
//}