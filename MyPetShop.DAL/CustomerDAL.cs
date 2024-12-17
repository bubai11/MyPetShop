using System;
<<<<<<< HEAD
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
=======
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
>>>>>>> a5bae2a04e261759a090aba9400034da809ce2fc

namespace MyPetShop.DAL
{
    public class CustomerDAL
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["MyPetShopConnectionString"].ConnectionString;

        // 用户登录验证
<<<<<<< HEAD
        public DataTable Login(string name, string password)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Customer WHERE Name = @Name AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", name);
=======
        public DataTable Login(string username, string password)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Users WHERE Username = @Username AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
>>>>>>> a5bae2a04e261759a090aba9400034da809ce2fc
                cmd.Parameters.AddWithValue("@Password", password);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        // 用户注册
<<<<<<< HEAD
        public bool Register(string name, string password, string email)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Customer (Name, Password, Email) VALUES (@Name, @Password, @Email)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Email", email);
=======
        public bool Register(string username, string password)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (Username, Password) VALUES (@Username, @Password)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
>>>>>>> a5bae2a04e261759a090aba9400034da809ce2fc

                conn.Open();
                return cmd.ExecuteNonQuery() > 0;
            }
        }
    }
}
