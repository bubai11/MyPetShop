<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyPetShop.Web.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css" 
        integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous"/>
<style>
       body {
           background-image: url(./Images/bg.jpg);
           background-size: cover;
           width: 100vw;
           height: 100vh;
           overflow:hidden;
       }
       .index{
           width:100%;
           height:100%;
           display:flex;
           align-items:center;
           justify-content:center;
       }
       .loginForm {
           width: 500px;
           border: #4d4d4d solid 1px;
           border-radius: 4px;
           box-shadow: 5px 5px 5px #4d4d4d;
           margin-left: auto;
           margin-right: auto;
           padding: 30px 20px;
           background-color: #fff;
           opacity:.92;
       }
       .loginForm h2 {
           text-align: center;
           margin-top:0px;
       }
       .button {
           text-align: center;
           vertical-align: middle;
       }
       .loginForm .container{
           width:90%;
       }
       .loginForm span{
           font-size:20px;
           text-align:center;
       }
       .tips{
           width:100%;
           display:flex;
           justify-content:space-between;
           margin-bottom:5px;
           margin-top:-5px;
       }
       .loginbtn{
           width:100%;
           display:flex;
           align-items:center;
           justify-content:center;
       }
       .btn{
           width:140px;

       }
</style>

</head>
   
<body>
<div class="index">
<div class="loginForm">
<div class="text-center">
    <img src="./Images/pet-shop.png" alt="MyPetShop Logo" style="height: 60px; margin: 20px;"/>
</div>
    <h2>登录</h2>
<form id="form1" runat="server" class="container mt-5">
        
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
        
<%--        <!-- 安全协议复选框 -->
        <div class="form-check mb-3">
            <asp:CheckBox ID="chkAgreement" CssClass="form-check-input" runat="server" />
            <label class="form-check-label" for="chkAgreement">
                我同意 <a href="#">xxx安全协议</a> 和 <a href="#">xxx隐私协议</a>
            </label>
        </div>
        --%>
        <div class="tips">
            <a href="Register.aspx">我要注册！</a>
            <a href="GetPwd.aspx">忘记密码？</a>
        </div>
        <!-- 登录按钮 -->
        <div class="loginbtn">
            <asp:Button ID="btnLogin" CssClass="btn btn-primary" Text="登 录" OnClick="btnLogin_Click" runat="server" />
        </div>
        
        <!-- 消息提示区域 -->
        <div class="mt-3">
            <asp:Label ID="lblMessage" CssClass="text-danger" runat="server"></asp:Label>
        </div>
    </form>
</div>
</div>

</body>
</html>
