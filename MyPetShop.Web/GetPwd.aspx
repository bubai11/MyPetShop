<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetPwd.aspx.cs" Inherits="MyPetShop.Web.GetPwd" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>找回密码</title>
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous"/>
    <style>
        body {
            background-image: url(./Images/bg.jpg);
            background-size: cover;
            width: 100vw;
            height: 100vh;
            overflow: hidden;
        }
        .index {
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .getPwdForm {
            width: 500px;
            border: #4d4d4d solid 1px;
            border-radius: 4px;
            box-shadow: 5px 5px 5px #4d4d4d;
            margin-left: auto;
            margin-right: auto;
            padding: 30px 20px;
            background-color: #fff;
            opacity: .92;
        }
        .getPwdForm h2 {
            text-align: center;
            margin-top: 0px;
        }
        .getPwdForm .container {
            width: 90%;
        }
        .tips {
            width: 100%;
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
            margin-top: -5px;
        }
        .loginbtn {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .btn {
            width: 140px;
        }
    </style>
</head>
<body>
<div class="index">
    <div class="getPwdForm">
        <div class="text-center">
            <img src="./Images/pet-shop.png" alt="MyPetShop Logo" style="height: 60px; margin: 20px;"/>
        </div>
        <h2>找回密码</h2>
        <form id="form1" runat="server" class="container mt-5">
            <div class="form-group">
                <label for="txtName">用户名</label>
                <asp:TextBox ID="txtName" CssClass="form-control" placeholder="请输入用户名" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtEmail">注册邮箱</label>
                <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="请输入注册邮箱" runat="server"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="txtCaptcha">验证码</label>
                <asp:TextBox ID="txtCaptcha" CssClass="form-control" placeholder="请输入验证码" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtNewPassword">新密码</label>
                <asp:TextBox ID="txtNewPassword" CssClass="form-control" TextMode="Password" placeholder="请输入新密码" runat="server"></asp:TextBox>
            </div>
            <div class="tips">
                <a href="Login.aspx">返回登录</a>
            </div>
            <div class="loginbtn">
                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" Text="提交" OnClick="btnSubmit_Click" runat="server" />
            </div>
            <div class="mt-3">
                <asp:Label ID="lblMsg" CssClass="text-danger" runat="server"></asp:Label>
            </div>
        </form>
    </div>
</div>
</body>
</html>