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
        // 获取热门商品
        public DataTable GetAllProducts()
        {
            return productDAL.GetAllProducts();
        }
        // 获取最新商品
        public  List<Product> GetLatestProducts(int count)
        {
            return productDAL.GetLatestProducts(count);  // 从 DAL 层获取最新商品
        }

        // 按分类获取商品
        public List<Product> GetProductsByCategory(int categoryId)
        {
            return productDAL.GetProductsByCategory(categoryId);
        }

        // 按商品名称获取商品
        public List<Product> GetProductsByName(string productName)
        {
            return productDAL.GetProductsByName(productName);
        }
        public void DeleteProducts(string productIds)
        {
            string[] idArray = productIds.Split(',');
            foreach (string id in idArray)
            {
                int productId = Convert.ToInt32(id);
                productDAL.DeleteProduct(productId);
            }
        }
        public void UpdateProduct(DataRow product)
        {
            productDAL.UpdateProduct(product);
        }
        public void AddProduct(DataRow product)
        {
            productDAL.AddProduct(product);
        }
        public DataTable GetProductById(int productId)
        {
            return productDAL.GetProductById(productId);
        }
        public void DeleteProduct(int productId)
        {
            productDAL.DeleteProduct(productId);
        }
    }
}
