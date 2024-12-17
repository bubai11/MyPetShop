<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyPetShop.Web.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

</head>
<body>
<div class="text-center">
    <img src="./Images/pet-shop.png" alt="MyPetShop Logo" style="height: 60px; margin: 20px;">
</div>
<div class="loginForm">
    <h2>用户登录</h2>
<form id="form1" runat="server" class="container mt-5">
        <h2 class="mb-4">用户登录</h2>
        
        <!-- 用户名输入框 -->
        <div class="form-group">
            <label for="txtName">用户名</label>
            <asp:TextBox ID="txtName" CssClass="form-control" placeholder="请输入用户名" runat="server"></asp:TextBox>
        </div>
        
        <!-- 密码输入框 -->
        <div class="form-group">
            <label for="txtPassword">密码</label>
            <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" placeholder="请输入密码" runat="server"></asp:TextBox>
        </div>
        
        <!-- 安全协议复选框 -->
        <div class="form-check mb-3">
            <asp:CheckBox ID="chkAgreement" CssClass="form-check-input" runat="server" />
            <label class="form-check-label" for="chkAgreement">
                我同意 <a href="#">xxx安全协议</a> 和 <a href="#">xxx隐私协议</a>
            </label>
        </div>
        
        <!-- 登录按钮 -->
        <div>
            <asp:Button ID="btnLogin" CssClass="btn btn-primary" Text="登 录" OnClick="btnLogin_Click" runat="server" />
        </div>
        
        <!-- 消息提示区域 -->
        <div class="mt-3">
            <asp:Label ID="lblMessage" CssClass="text-danger" runat="server"></asp:Label>
        </div>
    </form>
</div>


</body>
</html>
