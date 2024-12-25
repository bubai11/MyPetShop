<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserStatus.ascx.cs" Inherits="MyPetShop.Web.Controls.UserStatus" %>  
<style>  
    .no-underline {  
        text-decoration: none;  /* 去掉下划线 */  
    }  
    
    .no-underline:hover {  
        text-decoration: underline;  /* 鼠标悬停时显示下划线 */  
    }  
</style>  

<div class="userStatus">  
    <asp:Label ID="lblStatus" runat="server" CssClass="text-white"></asp:Label>  
    <asp:Label ID="Label1" runat="server" CssClass="text-dark"></asp:Label>  
    <asp:HyperLink ID="lnkAction1" runat="server" CssClass="ml-3 text-white no-underline"></asp:HyperLink>  
    <asp:HyperLink ID="lnkAction2" runat="server" CssClass="ml-3 text-white no-underline"></asp:HyperLink>  
    <asp:HyperLink ID="lnkAction3" runat="server" CssClass="ml-3 text-white no-underline"></asp:HyperLink>  
</div>