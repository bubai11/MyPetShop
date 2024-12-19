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
    public class OrderListDAL
    {
        private readonly string connectionString =
            ConfigurationManager.ConnectionStrings["MyPetShopConnectionString"].ConnectionString;
        public DataTable GetOrdersByCustomerId(int customerId)
        {
            DataTable ordersTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT OrderId, CustomerId, UserName, OrderDate, Addr1, City, Zip, Phone, Status FROM Order WHERE CustomerId = @CustomerId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CustomerId", customerId);

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(ordersTable);
                    }
                }
            }

            return ordersTable;

        }
    }
}
