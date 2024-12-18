using MyPetShop.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyPetShop.Web
{
    public partial class GetPwd : System.Web.UI.Page
    {
        private readonly CustomerService customerBLL = new CustomerService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // 提交按钮点击事件处理程序
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string captcha = txtCaptcha.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();

            // 检查用户名、邮箱和新密码是否都已填写
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(newPassword) || string.IsNullOrEmpty(captcha))
            {
                lblMsg.Text = "用户名、邮箱、新密码和验证码都不能为空。";
                return;
            }

            // 验证验证码是否正确
            if (captcha != "666")
            {
                lblMsg.Text = "验证码不正确。";
                return;
            }

            // 验证用户是否存在
            bool userExists = customerBLL.CheckUserExistence(username, email);

            if (userExists)
            {
                // 用户存在，重置密码
                bool resetSuccess = customerBLL.ResetPassword(username, email, newPassword);

                if (resetSuccess)
                {
                    lblMsg.Text = "密码重置成功。";
                }
                else
                {
                    lblMsg.Text = "密码重置失败。";
                }
            }
            else
            {
                // 用户不存在
                lblMsg.Text = "找不到该用户名和邮箱的组合。";
            }
        }
    

        //// 生成密码重置代码的示例方法
        //private string GenerateResetCode()
        //{
        //    // 实际应用中，这里应该是一个安全的随机码生成逻辑
        //    return Guid.NewGuid().ToString("N");
        //}

        //// 发送密码重置代码的示例方法
        //private void SendResetCode(string resetCode, string email)
        //{
        //    // 实际应用中，这里应该是发送邮件或短信的逻辑
        //    // 以下代码仅为示例
        //    Console.WriteLine($"Sending reset code to {email}: {resetCode}");
        //}
    }
}