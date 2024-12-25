<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManagementLinks.ascx.cs" Inherits="MyPetShop.Web.Controls.ManagementLinks" %>  
<div class="management-links">  
    <h4>您的管理</h4>  
    <ul>  
        <li>  
            <asp:HyperLink ID="hlCategory" runat="server">分类管理</asp:HyperLink>  
        </li>  
        <li>  
            <asp:HyperLink ID="hlProduct" runat="server">商品管理</asp:HyperLink>  
        </li>  
        <li>  
            <asp:HyperLink ID="hlOrder" runat="server">订单管理</asp:HyperLink>  
        </li>  
    </ul>  
</div>