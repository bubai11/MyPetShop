using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyPetShop.DAL;

namespace MyPetShop.BLL
{
    public class ProductService
    {
        private readonly ProductDAL productDAL = new ProductDAL();

        /// <summary>
        /// 调用数据访问层进行商品搜索
        /// </summary>
        public DataTable SearchProducts(string searchQuery)
        {
            return productDAL.SearchProducts(searchQuery);

        }
    }
}
