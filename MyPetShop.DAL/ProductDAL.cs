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
                    string sql = @"SELECT ProductId, Name, ListPrice, UnitCost, Descn, Image, Qty
                                   FROM Product
                                   WHERE Name LIKE @SearchQuery";
                    // 创建 SQL 命令实例  
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@SearchQuery", $"%{searchQuery}%");

                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                    DataTable resultTable = new DataTable();
                    adapter.Fill(resultTable);

                    return resultTable;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("搜索商品时出错：" + ex.Message);
                return null;
            }
        }
    }
}