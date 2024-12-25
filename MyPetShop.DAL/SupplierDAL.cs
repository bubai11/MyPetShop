using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace MyPetShop.DAL
{
    public class SupplierDAL
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["MyPetShopConnectionString"].ConnectionString;
        public DataTable GetAllSuppliers()
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string sql = "SELECT SuppId, Name FROM Supplier";
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, conn);
                    adapter.Fill(dt);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("获取供应商数据时出错: " + ex.Message);
            }

            return dt;
        }
    }
}
