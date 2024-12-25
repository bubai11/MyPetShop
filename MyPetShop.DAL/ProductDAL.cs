using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MyPetShop.DAL
{
    public class ProductDAL
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["MyPetShopConnectionString"].ConnectionString;

        /// <summary>  
        /// 根据产品名称或描述搜索产品  
        /// </summary>  
        /// <param name="searchQuery">搜索关键词</param>  
        /// <returns>符合条件的产品信息以 DataTable 形式返回</returns>  
        // 搜索商品的方法
        public DataTable SearchProducts(string searchQuery)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // 查询 Product 表中所有需要的字段
                    string sql = @"
                        SELECT ProductId, CategoryId, Name, ListPrice, UnitCost, Descn, Image, Qty
                        FROM Product
                        WHERE Name LIKE @SearchQuery OR Descn LIKE @SearchQuery";

                    // 创建 SQL 命令实例
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@SearchQuery", $"%{searchQuery}%");

                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                    DataTable resultTable = new DataTable();
                    adapter.Fill(resultTable);

                    Console.WriteLine("查询结果行数：" + resultTable.Rows.Count);

                    return resultTable;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("搜索商品时出错：" + ex.Message);
                return null;
            }
        }

        // 获取所有商品
        // 获取所有商品的基本信息，包括图片
        public DataTable GetAllProducts()
        {
            DataTable dataTable = new DataTable();
            string query = "SELECT ProductId, Name, ListPrice, UnitCost, Descn, Image, Qty FROM Product";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dataTable);
            }

            return dataTable;
        }

        // 根据产品ID获取产品信息
        public DataTable GetProductById(int productId)
        {
            DataTable product = new DataTable();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string sql = @"
            SELECT ProductId, CategoryId, Name, ListPrice, UnitCost, Descn, Image, Qty, SuppId
            FROM Product
            WHERE ProductId = @ProductId";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@ProductId", productId);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Check if there are any rows to read
                    if (reader.HasRows)
                    {
                        product.Columns.Add("ProductId", typeof(int));
                        product.Columns.Add("CategoryId", typeof(int));
                        product.Columns.Add("Name", typeof(string));
                        product.Columns.Add("ListPrice", typeof(decimal));
                        product.Columns.Add("UnitCost", typeof(decimal));
                        product.Columns.Add("SuppId", typeof(int));
                        product.Columns.Add("Descn", typeof(string));
                        product.Columns.Add("Image", typeof(string));
                        product.Columns.Add("Qty", typeof(int));

                        while (reader.Read())
                        {
                            DataRow row = product.NewRow();
                            row["ProductId"] = reader.GetInt32(reader.GetOrdinal("ProductId"));
                            row["CategoryId"] = reader.GetInt32(reader.GetOrdinal("CategoryId"));
                            row["Name"] = reader.GetString(reader.GetOrdinal("Name"));
                            row["ListPrice"] = reader.GetDecimal(reader.GetOrdinal("ListPrice"));
                            row["UnitCost"] = reader.GetDecimal(reader.GetOrdinal("UnitCost"));
                            row["SuppId"] = reader.GetInt32(reader.GetOrdinal("SuppId"));
                            row["Descn"] = reader.GetString(reader.GetOrdinal("Descn"));
                            row["Image"] = reader.GetString(reader.GetOrdinal("Image"));
                            row["Qty"] = reader.GetInt32(reader.GetOrdinal("Qty"));
                            product.Rows.Add(row);
                        }
                    }
                    else
                    {
                        Console.WriteLine("No rows found for the given ProductId.");
                    }
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("获取商品信息时出错：" + ex.Message);
            }
            return product;
        }
        // 获取最新商品
        public   List<Product> GetLatestProducts(int count)
        {
            List<Product> products = new List<Product>();

            // 使用字符串插值将 count 直接嵌入到 SQL 查询中
            string query = $"SELECT TOP ({count}) ProductId, Name, ListPrice FROM Product ORDER BY ProductId DESC";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Product product = new Product
                    {
                        ProductId = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        ListPrice = reader.GetDecimal(2)
                    };
                    products.Add(product);
                }
            }

            return products;
        }


        // 获取某分类的商品
        public List<Product> GetProductsByCategory(int categoryId)
        {
            List<Product> products = new List<Product>();
            string query = "SELECT ProductId, Name, ListPrice, UnitCost, Descn, Image, Qty FROM Product WHERE CategoryId = @CategoryId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CategoryId", categoryId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    products.Add(new Product
                    {
                        ProductId = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        ListPrice = reader.GetDecimal(2),
                        UnitCost = reader.GetDecimal(3),
                        Descn = reader.GetString(4),
                        Image = reader.GetString(5),
                        Qty = reader.GetInt32(6)
                    });
                }
            }

            return products;
        }

        // 按商品名称查询商品
        public  List<Product> GetProductsByName(string productName)
        {
            List<Product> products = new List<Product>();
            string query = "SELECT ProductId, Name, ListPrice, UnitCost, Descn, Image, Qty FROM Product WHERE Name LIKE @ProductName";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ProductName", "%" + productName + "%");

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    products.Add(new Product
                    {
                        ProductId = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        ListPrice = reader.GetDecimal(2),
                        UnitCost = reader.GetDecimal(3),
                        Descn = reader.GetString(4),
                        Image = reader.GetString(5),
                        Qty = reader.GetInt32(6)
                    });
                }
            }

            return products;
        }
        public void UpdateProduct(DataRow product)
        {
            string query = @"
                UPDATE Product 
                SET 
                    CategoryId = @CategoryId, 
                    Name = @Name, 
                    ListPrice = @ListPrice, 
                    UnitCost = @UnitCost, 
                    SuppId = @SuppId, 
                    Descn = @Descn, 
                    Image = @Image, 
                    Qty = @Qty 
                WHERE ProductId = @ProductId";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CategoryId", product["CategoryId"]);
                cmd.Parameters.AddWithValue("@Name", product["Name"]);
                cmd.Parameters.AddWithValue("@ListPrice", product["ListPrice"]);
                cmd.Parameters.AddWithValue("@UnitCost", product["UnitCost"]);
                cmd.Parameters.AddWithValue("@SuppId", product["SuppId"]);
                cmd.Parameters.AddWithValue("@Descn", product["Descn"]);
                cmd.Parameters.AddWithValue("@Image", product["Image"]);
                cmd.Parameters.AddWithValue("@Qty", product["Qty"]);
                cmd.Parameters.AddWithValue("@ProductId", product["ProductId"]);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void DeleteProduct(int productId)
        {
            string query = "DELETE FROM Product WHERE ProductId = @ProductId";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ProductId", productId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public void AddProduct(DataRow product)
        {
            string query = "INSERT INTO Product (CategoryId, Name, ListPrice, UnitCost, SuppId, Descn, Image, Qty) VALUES (@CategoryId, @Name, @ListPrice, @UnitCost, @SuppId, @Descn, @Image, @Qty)";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CategoryId", product["CategoryId"]);
                cmd.Parameters.AddWithValue("@Name", product["Name"]);
                cmd.Parameters.AddWithValue("@ListPrice", product["ListPrice"]);
                cmd.Parameters.AddWithValue("@UnitCost", product["UnitCost"]);
                cmd.Parameters.AddWithValue("@SuppId", product["SuppId"]);
                cmd.Parameters.AddWithValue("@Descn", product["Descn"]);
                cmd.Parameters.AddWithValue("@Image", product["Image"]);
                cmd.Parameters.AddWithValue("@Qty", product["Qty"]);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void DeleteCartItemsByProductId(int productId)
        {
            string query = "DELETE FROM CartItem WHERE ProId = @ProductId";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ProductId", productId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}