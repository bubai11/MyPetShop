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

        // 登录验证方法
        //public bool Login(string name, string password, out DataRow userData)
        //{
            //    DataTable dt = customerDAL.Login(name, password);
            //    if (dt.Rows.Count > 0)
            //    {
            //        userData = dt.Rows[0]; // 获取用户数据
            //        return true; // 登录成功
            //    }
            //    else
            //    {
            //        userData = null;
            //        return false; // 登录失败
            //    }
            //}

            //// 用户注册方法
            //public bool Register(string name, string password, string email)
            //{
            //    return customerDAL.Register(name, password, email);
            //}
        //}
    }
}
