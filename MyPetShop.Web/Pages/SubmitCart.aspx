<%@ Page Title="创建订单" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="SubmitCart.aspx.cs" Inherits="MyPetShop.Web.Pages.SubmitCart" %>
<%@ Register Src="../Controls/PetTree.ascx" TagName="PetTree" TagPrefix="uc" %>  
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>  
     .search-container {  
         display: flex;  
         justify-content: space-between; /* Aligns the sidebar and main content side by side */  
         width: 100%;  
     }  

     .search-sidebar {  
         width: 30%; /* Adjust this width as necessary */  
         padding: 10px;  
         border-right: 1px solid #ccc; /* Optional: adds a separator */  
     }  

     .search-main {  
         width: 70%; /* Adjust this width as necessary */  
         padding: 10px;  
     }  
    </style> 
    <div class="search-container">  
    <!-- 左侧分类 -->  
    <div class="search-sidebar">  
        <h3>分类商品</h3>  
        <uc:PetTree ID="PetTree" runat="server" />  
    </div>  
    <!-- 右侧结果 -->  
    <div class="search-main">  
        <h2>填写发货地址</h2>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />

        <fieldset>
            <legend>发货地址表单</legend>
            <!-- 发货地址 -->
            <asp:TextBox ID="Addr1" runat="server" TextMode="MultiLine" Rows="3" />
            <asp:RequiredFieldValidator ID="Addr1Required" runat="server" ControlToValidate="Addr1" ErrorMessage="送货地址必填！" />

            <!-- 发票寄送地址 -->
            <asp:TextBox ID="Addr2" runat="server" TextMode="MultiLine" Rows="3" />
            <asp:RequiredFieldValidator ID="Addr2Required" runat="server" ControlToValidate="Addr2" ErrorMessage="发票寄送地址必填！" />

            <!-- 城市 -->
            <asp:TextBox ID="City" runat="server" />
            <asp:RequiredFieldValidator ID="CityRequired" runat="server" ControlToValidate="City" ErrorMessage="城市必填！" />

            <!-- 省份 -->
            <asp:TextBox ID="State" runat="server" />
            <asp:RequiredFieldValidator ID="StateRequired" runat="server" ControlToValidate="State" ErrorMessage="省份必填！" />

            <!-- 邮编 -->
            <asp:TextBox ID="Zip" runat="server" />
            <asp:RequiredFieldValidator ID="ZipRequired" runat="server" ControlToValidate="Zip" ErrorMessage="邮编必填！" />

            <!-- 联系电话 -->
            <asp:TextBox ID="Phone" runat="server" />
            <asp:RequiredFieldValidator ID="PhoneRequired" runat="server" ControlToValidate="Phone" ErrorMessage="联系电话必填！" />
        </fieldset>

        <asp:Button ID="SubmitOrderButton" runat="server" Text="提交结算" OnClick="SubmitOrderButton_Click" />
        <asp:Label ID="OrderStatusLabel" runat="server" />
        </div>
        </div>
</asp:Content>