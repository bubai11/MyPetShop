<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MyPetShop.Web.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
        .form-group {
            margin-bottom: 15px;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .text-danger {
            color: red;
        }
        .form-group {
    margin-bottom: 15px;
    margin-top: 15px;
}
    </style></head>
<body>
<div class="index">
    <div class="loginForm">
            <div class="text-center">
                <img src="./Images/pet-shop.png" alt="MyPetShop Logo" style="height: 60px; margin: 20px;"/>
            </div>
            <h2>注册</h2>
            <form id="form1" runat="server" class="container mt-5">
            <div class="form-group">
                    <label for="txtName">用户名:</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="请输入用户名">

                    </asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ControlToValidate="txtName" 
                            Display="Dynamic" 
                            ForeColor="Red" 
                            ID="rfvName" 
                            runat="server" 
                            ErrorMessage="必填">
                        </asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="txtEmail">邮箱:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="请输入邮箱"></asp:TextBox>
                    
                        <asp:RequiredFieldValidator 
                            ControlToValidate="txtEmail" 
                            Display="Dynamic" 
                            ForeColor="Red" 
                            ID="rfvEmail" 
                            runat="server" 
                            ErrorMessage="必填">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator 
                            ID="revEmail" 
                            runat="server" 
                            ErrorMessage="邮箱格式不正确!" 
                            ControlToValidate="txtEmail" 
                            Display="Dynamic" 
                            ForeColor="Red" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        </asp:RegularExpressionValidator>
            
                </div>
                <div class="form-group">
                    <label for="txtPwd">密码:</label>
                        <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" CssClass="form-control" placeholder="请输入密码"></asp:TextBox>
                     <asp:RequiredFieldValidator 
                            ControlToValidate="txtPwd" 
                            Display="Dynamic" 
                            ForeColor="Red" 
                            ID="rfvPwd" 
                            runat="server" 
                            ErrorMessage="必填">
                        </asp:RequiredFieldValidator>
            
                <!-- 确认密码 -->
                <div class="form-group">
                    <label for="txtPwdAgain">确认密码:</label>
                    <asp:TextBox ID="txtPwdAgain" runat="server" TextMode="Password" CssClass="form-control" placeholder="请确认密码"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                            ControlToValidate="txtPwdAgain" 
                            Display="Dynamic" 
                            ForeColor="Red" 
                            ID="rfvPwdAgain" 
                            runat="server" 
                            ErrorMessage="必填">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator 
                            ID="cvPwd" 
                            runat="server" 
                            ControlToCompare="txtPwd" 
                            ControlToValidate="txtPwdAgain" 
                            ErrorMessage="两次输入的密码不一致!" 
                            Display="Dynamic" 
                            ForeColor="Red">
                        </asp:CompareValidator>
            </div>
                <div class="tips">
                    <a href="Login.aspx">我要登录</a>
                </div>
                <div class="loginbtn">
                    <asp:Button ID="btnRegister" runat="server" Text="注册" OnClick="btnRegister_Click" CssClass="btn btn-primary"/>
                </div>
                    <div class="mt-3">
                    <asp:Label ID= "lblMsg" runat="server" ForeColor="Red"></asp:Label>
                </div>
        </div>
    </form>
    </div>
    </div>
</body>
</html>
