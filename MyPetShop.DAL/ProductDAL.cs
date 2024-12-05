//using MyPetShop.DAL;
//using System.Collections.Generic;

//public class ProductDAL
//{
//    // 创建一个数据上下文对象，连接到 MyPetShop 数据库
//    private MyPetShopDataContext db = new MyPetShopDataContext();

//    // 获取所有商品的列表
//    public List<Product> GetAllProducts()
//    {
//        // 使用 LINQ 查询获取所有商品
//        return db.Products.ToList();
//    }

//    // 根据商品ID获取特定商品
//    public Product GetProductById(int productId)
//    {
//        return db.Products.FirstOrDefault(p => p.ProductId == productId);
//    }

//    // 获取某个分类下的所有商品
//    public List<Product> GetProductsByCategory(int categoryId)
//    {
//        return db.Products.Where(p => p.CategoryId == categoryId).ToList();
//    }
//}
