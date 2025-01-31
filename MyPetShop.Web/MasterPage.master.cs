﻿using MyPetShop.BLL;
using MyPetShop.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 判断页面是否首次加载
            if (!IsPostBack)
            {
                InitializePage();
            }
            SetWalletBalance(GetSession());// 检查是否有刷新余额的标记
            if (Session["RefreshBalance"] as string == "true")
            {
                SetWalletBalance(GetSession());
                // 清除标记，避免重复刷新  
                Session["RefreshBalance"] = "false";
            }
        }
        private void InitializePage()
        {
            Page.Title = "MyPetShop - 欢迎光临宠物商店";
        }

        private System.Web.SessionState.HttpSessionState GetSession()
        {
            return Session;
        }

        private void SetWalletBalance(System.Web.SessionState.HttpSessionState session)
        {
            System.Diagnostics.Debug.WriteLine("登陆成功" + session["CustomerId"]);
            if (session["CustomerId"] != null)
            {
                CustomerService customerService = new CustomerService();
                Customer currentUser = customerService.GetCustomerWithBalance(session["UserName"].ToString());
                if (currentUser != null)
                {
                    ltWalletBalance.Text = $"余额：￥{currentUser.Money:0.00}";
                }
                else
                {
                    ltWalletBalance.Text = "余额：￥0.00";
                }
            }
            else
            {
                ltWalletBalance.Text = "余额：登录查看";
            }
        }
    }
}