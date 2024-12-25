using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyPetShop.DAL;
namespace MyPetShop.BLL
{
    public class SupplierService
    {
        private SupplierDAL supplierDAL = new SupplierDAL();
        public DataTable GetAllSuppliers()
        {
            return supplierDAL.GetAllSuppliers();
        }
    }

}
