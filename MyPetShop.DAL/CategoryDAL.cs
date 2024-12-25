using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace MyPetShop.DAL
{
    public class CategoryDAL
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["MyPetShopConnectionString"].ConnectionString;

        // 获取所有分类
        public DataTable GetAllCategories()
        {
            DataTable dt = new DataTable();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string sql = "SELECT CategoryId, Name, Descn FROM Category";
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, conn);
                    adapter.Fill(dt);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("获取分类数据时出错: " + ex.Message);
            }

            return dt;
        }

        // 根据分类 ID 获取商品
        public DataTable GetProductsByCategory(int categoryId)
        {
            DataTable dt = new DataTable();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string sql = "SELECT ProductId, Name FROM Product WHERE CategoryId = @CategoryId";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@CategoryId", categoryId);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("获取商品数据时出错: " + ex.Message);
            }

            return dt;
        }

        // 添加分类
        public void AddCategory(DataRow category)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sql = "INSERT INTO Category (Name, Descn) VALUES (@Name, @Descn)";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@Name", category["Name"]);
                    cmd.Parameters.AddWithValue("@Descn", category["Descn"]);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("添加分类时出错: " + ex.Message);
            }
        }

        // 更新分类
        public void UpdateCategory(DataRow category)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sql = "UPDATE Category SET Name = @Name, Descn = @Descn WHERE CategoryId = @CategoryId";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@Name", category["Name"]);
                    cmd.Parameters.AddWithValue("@Descn", category["Descn"]);
                    cmd.Parameters.AddWithValue("@CategoryId", category["CategoryId"]);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("更新分类时出错: " + ex.Message);
            }
        }

        // 删除分类
        public void DeleteCategory(int categoryId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sql = "DELETE FROM Category WHERE CategoryId = @CategoryId";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@CategoryId", categoryId);
                    int affectedRows = cmd.ExecuteNonQuery();
                    if (affectedRows == 0)
                    {
                        throw new Exception("No rows affected. The category might not exist.");
                    }
                }
            }
            catch (SqlException ex)
            {
                // Log the exception details
                Console.WriteLine($"SQL Error: {ex.Message}");
                Console.WriteLine($"Error Number: {ex.Number}");
                Console.WriteLine($"Error State: {ex.State}");
                throw; // Re-throw the exception to preserve the stack trace
            }
            catch (Exception ex)
            {
                // Log the exception details
                Console.WriteLine($"Error deleting category: {ex.Message}");
                throw; // Re-throw the exception to preserve the stack trace
            }
        }

        // 根据 ID 获取分类信息
        public DataRow GetCategoryById(int categoryId)
        {
            DataTable dt = new DataTable();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sql = "SELECT CategoryId, Name, Descn FROM Category WHERE CategoryId = @CategoryId";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@CategoryId", categoryId);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        return dt.Rows[0];
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("根据 ID 获取分类信息时出错: " + ex.Message);
            }

            return null;
        }
    }
}