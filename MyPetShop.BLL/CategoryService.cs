using System.Data;
using MyPetShop.DAL;

namespace MyPetShop.BLL
{
    public class CategoryService
    {
        private readonly CategoryDAL categoryDAL = new CategoryDAL();

        // 获取所有分类
        public DataTable GetAllCategories()
        {
            return categoryDAL.GetAllCategories();
        }

        // 根据分类 ID 获取商品
        public DataTable GetProductsByCategory(int categoryId)
        {
            return categoryDAL.GetProductsByCategory(categoryId);
        }
    }
}

