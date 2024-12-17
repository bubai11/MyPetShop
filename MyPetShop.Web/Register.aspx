<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MyPetShop.Web.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="leftside">
            <table style="border-collapse:collapse;">
                <!-- 标题行 -->
                <tr>
                    <td class="tdcenter" colspan="2">注册</td>
                </tr>
            
                <!-- 用户名 -->
                <tr>
                    <td class="tdright">用户名:</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator 
                            ControlToValidate="txtName" 
                            Display="Dynamic" 
                            ForeColor="Red" 
                            ID="rfvName" 
                            runat="server" 
                            ErrorMessage="必填">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
            
                <!-- 邮箱 -->
                <tr>
                    <td class="tdright">邮箱:</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator 
                            ControlToValidate="txtEmail" 
                            Display="Dynamic" 
                            ForeColor="Red" 
                            ID="rfvEmail" 
                            runat="server" 
                            ErrorMessage="必填">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
            
                <!-- 邮箱格式校验 -->
                <tr>
                    <td class="tdright" colspan="2">
                        <asp:RegularExpressionValidator 
                            ID="revEmail" 
                            runat="server" 
                            ErrorMessage="邮箱格式不正确!" 
                            ControlToValidate="txtEmail" 
                            Display="Dynamic" 
                            ForeColor="Red" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        </asp:RegularExpressionValidator>
                    </td>
                </tr>
            
                <!-- 密码 -->
                <tr>
                    <td class="tdright">密码:</td>
                    <td>
                        <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator 
                            ControlToValidate="txtPwd" 
                            Display="Dynamic" 
                            ForeColor="Red" 
                            ID="rfvPwd" 
                            runat="server" 
                            ErrorMessage="必填">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
            
                <!-- 确认密码 -->
                <tr>
                    <td class="tdright">确认密码:</td>
                    <td>
                        <asp:TextBox ID="txtPwdAgain" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator 
                            ControlToValidate="txtPwdAgain" 
                            Display="Dynamic" 
                            ForeColor="Red" 
                            ID="rfvPwdAgain" 
                            runat="server" 
                            ErrorMessage="必填">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
            
                <!-- 密码比较校验 -->
                <tr>
                    <td class="tdright" colspan="2">
                        <asp:CompareValidator 
                            ID="cvPwd" 
                            runat="server" 
                            ControlToCompare="txtPwd" 
                            ControlToValidate="txtPwdAgain" 
                            ErrorMessage="两次输入的密码不一致!" 
                            Display="Dynamic" 
                            ForeColor="Red">
                        </asp:CompareValidator>
                    </td>
                </tr>
            
                <!-- 提交按钮 -->
                <tr>
                    <td class="tdcenter" colspan="2">
                        <asp:Button ID="btnRegister" runat="server" Text="注册" OnClick="btnRegister_Click" />
                    </td>
                </tr>
                <tr>
                <td>我要登录</td>
                <td>
                    <asp:Label ID= "lblMsg" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
            </table>
        </div>
    </form>

</body>
</html>
