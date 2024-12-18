﻿using System;
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

        // 获取热销商品的方法
        public DataTable GetHotProducts()
        {
            DataTable dataTable = new DataTable();
            string sql = @"
                SELECT TOP 5 
                    ProductId, 
                    Name, 
                    ListPrice, 
                    Qty
                FROM Product
                ORDER BY Sales DESC"; // 假设有一个字段 Sales 表示销量

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            adapter.Fill(dataTable);
                        }
                    }
                }
                catch (Exception ex)
                {
                    // 处理异常（可以记录日志或抛出异常）
                    throw new ApplicationException("获取热销商品失败: " + ex.Message);
                }
            }

            return dataTable;
        }
        //
        public DataTable GetProductById(int productId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string sql = @"
                SELECT ProductId, Name, ListPrice
                FROM Product
                WHERE ProductId = @ProductId";

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@ProductId", productId);

                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                    DataTable resultTable = new DataTable();
                    adapter.Fill(resultTable);

                    return resultTable;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("查询商品信息时出错：" + ex.Message);
                return null;
            }
        }

    }
}