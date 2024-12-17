<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserStatus.ascx.cs" Inherits="MyPetShop.Web.Controls.UserStatus" %>
<div>
    <%-- 如果用户已登录，显示欢迎信息和相关操作 --%>
    <asp:Panel ID="pnlLoggedIn" runat="server" Visible="false">
        您好, <asp:Label ID="lblUsername" runat="server" Text="Guest"></asp:Label>
        <%-- 用户是普通用户时显示 --%>
        <asp:HyperLink ID="lnkShoppingHistory" runat="server" NavigateUrl="~/ShoppingHistory.aspx" Visible="true">购物记录</asp:HyperLink>
        <%-- 用户是管理员时显示 --%>
        <asp:HyperLink ID="lnkAdminPanel" runat="server" NavigateUrl="~/AdminPanel.aspx" Visible="false">系统管理</asp:HyperLink>
        <asp:HyperLink ID="lnkChangePassword" runat="server" NavigateUrl="~/ChangePassword.aspx">密码修改</asp:HyperLink>
        <asp:HyperLink ID="lnkLogout" runat="server" NavigateUrl="~/Logout.aspx">退出登录</asp:HyperLink>
    </asp:Panel>

    <%-- 如果用户未登录，显示登录/注册链接 --%>
    <asp:Panel ID="pnlLoggedOut" runat="server" Visible="true">
        您还未登录!
        <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/Login.aspx">登录</asp:HyperLink>
        <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/Register.aspx">注册</asp:HyperLink>
    </asp:Panel>
</div>