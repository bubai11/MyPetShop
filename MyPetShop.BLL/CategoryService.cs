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

        // 添加分类
        public void AddCategory(DataRow category)
        {
            categoryDAL.AddCategory(category);
        }

        // 更新分类
        public void UpdateCategory(DataRow category)
        {
            categoryDAL.UpdateCategory(category);
        }

        // 删除分类
        public void DeleteCategory(int categoryId)
        {
            categoryDAL.DeleteCategory(categoryId);
        }

        // 根据 ID 获取分类信息
        public DataRow GetCategoryById(int categoryId)
        {
            return categoryDAL.GetCategoryById(categoryId);
        }
    }
}