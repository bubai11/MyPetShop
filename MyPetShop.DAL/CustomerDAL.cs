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

        // 用户登录验证
        //public DataTable Login(string name, string password)
        //{
        //    using (SqlConnection conn = new SqlConnection(connectionString))
        //    {
        //        string query = "SELECT * FROM Customer WHERE Name = @Name AND Password = @Password";
        //        SqlCommand cmd = new SqlCommand(query, conn);
        //        cmd.Parameters.AddWithValue("@Name", name);
        //    }
        //}

        //// 用户注册
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
    }
}
