using MyPetShop.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyPetShop.BLL
{
    public class CustomerService
    {
        private readonly CustomerDAL customerDAL = new CustomerDAL();

        // 登录验证业务逻辑
        public Customer Login(string username, string password)
        {
            // 添加业务逻辑，比如输入验证
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                throw new ArgumentException("用户名或密码不能为空！");
            }

            return customerDAL.GetCustomerByCredentials(username, password);
        }
        //注册验证业务逻辑
        public bool Register(string name, string email, string password)
        {
            // 1. 检查用户名是否已存在
            if (customerDAL.IsNameExists(name))
            {
                throw new Exception("用户名已存在，请换一个用户名！");
            }

            // 2. 调用数据访问层方法插入新用户
            return customerDAL.RegisterCustomer(name, email, password);
        }
        // 检查用户是否存在
        public bool CheckUserExistence(string username, string email)
        {
            return customerDAL.GetCustomerByEmail(username, email) != null;
        }

        // 重置密码业务逻辑
        public bool ResetPassword(string username, string email, string newPassword)
        {
            return customerDAL.UpdateCustomerPassword(username, email, newPassword);
        }
    }

}
