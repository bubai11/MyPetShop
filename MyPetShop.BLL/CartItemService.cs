using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyPetShop.DAL;

namespace MyPetShop.BLL
{
    public class CartItemService
    {
        private readonly CartItemDAL cartDAL = new CartItemDAL();

        // 添加商品到购物车
        public void AddToCart(int customerId, int productId, string productName, decimal listPrice, int quantity)
        {
            cartDAL.AddToCart(customerId, productId, productName, listPrice, quantity);
        }

        // 获取购物车中所有商品
        public DataTable GetCartItems(int customerId)
        {
            return cartDAL.GetCartItems(customerId);
        }
    }
}
