using MyPetShop.DAL;
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

        private readonly CartItemDAL cartItemDAL = new CartItemDAL();
        // 添加商品到购物车
        public bool AddProductToCart(int customerId, int proId, string proName, decimal listPrice, int qty)
        {
            return cartItemDAL.InsertCartItem(customerId, proId, proName, listPrice, qty);
        }

        // 删除购物车商品
        public bool DeleteProductFromCart(int cartItemId)
        {
            return cartItemDAL.DeleteCartItem(cartItemId);
        }

        // 修改购物车中商品的数量
        public bool UpdateProductQuantity(int cartItemId, int qty)
        {
            return cartItemDAL.UpdateCartItemQuantity(cartItemId, qty);
        }

        // 清空购物车
        public bool ClearCart(int customerId)
        {
            return cartItemDAL.ClearCartItems(customerId);
        }

        // 获取购物车中所有商品
        public DataTable GetCart(int customerId)
        {
            return cartItemDAL.GetCartItems(customerId);
        }

        // 计算购物车总价
        public decimal CalculateTotal(int customerId)
        {
            return cartItemDAL.CalculateCartTotal(customerId);
        }
    }
}
