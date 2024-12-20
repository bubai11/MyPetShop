<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePwd.aspx.cs" Inherits="MyPetShop.Web.ChangePwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户密码修改</title>
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
        .tips{
            display:flex;
            justify-content: space-between;
            flex-flow:row nowrap;
        }
    </style>
</head>
<body>
<div class="index">
    <div class="getPwdForm">
        <div class="text-center">
            <img src="./Images/pet-shop.png" alt="MyPetShop Logo" style="height: 60px; margin: 20px;"/>
        </div>
        <h2>修改密码</h2>
        <form id="form1" runat="server" class="container mt-5">
            <div class="form-group">
                <label for="txtOldPwd">原密码</label>
                <asp:TextBox ID="txtOldPwd" TextMode="Password" CssClass="form-control" placeholder="请输入原密码" runat="server"></asp:TextBox>
                
    <asp:RequiredFieldValidator 
        ControlToValidate="txtOldPwd" 
        Display="Dynamic" 
        ForeColor="Red" 
        ID="rfvOldPwd" 
        runat="server" 
        ErrorMessage="必填">
    </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="txtPwd">新密码</label>
                <asp:TextBox ID="txtPwd" TextMode="Password" CssClass="form-control" placeholder="请输入新密码" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator 
    ControlToValidate="txtPwd" 
    Display="Dynamic" 
    ForeColor="Red" 
    ID="rfvPwd" 
    runat="server" 
    ErrorMessage="必填">
</asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="TextBox1">确认新密码</label>
                <asp:TextBox ID="TextBox1" TextMode="Password" CssClass="form-control" placeholder="请再次输入新密码" runat="server"></asp:TextBox>
               
    <asp:RequiredFieldValidator 
        ControlToValidate="TextBox1" 
        Display="Dynamic" 
        ForeColor="Red" 
        ID="RequiredFieldValidator1" 
        runat="server" 
        ErrorMessage="必填">
    </asp:RequiredFieldValidator>
            </div>
            <asp:CompareValidator 
    ControlToValidate="TextBox1" 
    ControlToCompare="txtPwd" 
    CssClass="text-danger" 
    ID="cvPwd" 
    runat="server" 
    ErrorMessage="两次密码不一致">
</asp:CompareValidator>
            <div class="loginbtn">
                <asp:Button ID="btnChangePwd" CssClass="btn btn-primary" Text="确认修改" OnClick="BtnChangePwd_Click" runat="server" />
            </div>
            
        <div class="tips">
                <asp:Label ID="lblMsg" CssClass="text-danger" runat="server"></asp:Label>
            <a href="Default.aspx">返回首页</a>
        </div>
        </form>
    </div>
</div>
</body>
</html>
