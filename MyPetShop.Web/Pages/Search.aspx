<%@ Page Title="商品搜索" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MyPetShop.Web.Pages.search" %>
<%@ Register Src="../Controls/PetTree.ascx" TagName="PetTree" TagPrefix="uc" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>  
    /* 细化树形菜单样式 */  
    #TreeViewCategories {  
        list-style-type: none;  
        margin: 0;  
        padding: 0;  
    }  

    #TreeViewCategories li {  
        font-size: 14px;  
        padding: 5px 0;  
        cursor: pointer;  
    }  

    #TreeViewCategories li:hover {  
        background-color: #f0f0f0;  
    }  

    #TreeViewCategories ul {  
        list-style-type: none;  
        margin-left: 20px; /* 缩进子分类 */  
        padding: 0;  
    }  

    #TreeViewCategories ul li {  
        font-size: 12px;  
        color: #555;  
    }  

    .expand-collapse {  
        display: inline-block;  
        margin-left: 5px;  
        cursor: pointer;  
        color: #007bff;  
    }  

    #TreeViewCategories > li {  
        font-weight: bold;  
    }  

    .search-container {  
        display: flex;  
        justify-content: space-between; /* Aligns the sidebar and main content side by side */  
        width: 90%; /* Adjust this width as necessary */  
        margin: 0 auto; /* Center the container */  
    }  

    .search-sidebar {  
        width: 30%; /* Adjust this width as necessary */  
        padding: 10px;  
        border-right: 1px solid #ccc; /* Optional: adds a separator */  
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* Add shadow for better visibility */  
    }  

    .search-main {  
        width: 70%; /* Adjust this width as necessary */  
        padding: 10px;  
    }  

    .cart-container {  
        max-width: 750px; /* Set the maximum width of the cart container */  
        margin: 0 auto; /* Center the cart container */  
        border: 1px solid #ddd; /* Add a border */  
        background-color: #fff; /* Background color for better visibility */  
        padding: 20px; /* Add padding */  
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */  
        border-radius: 5px; /* Add rounded corners */  
    }  

    .cart-title {  
        font-size: 24px;  
        font-weight: bold;  
        text-align: center;  
        margin-bottom: 20px;  
        color: #333;  
    }  

    .shopCart {  
        width: 100%;  
        border-collapse: collapse; /* Ensure table borders collapse into one */  
        margin-top: 20px; /* Add some space above the table */  
    }  

    .shopCart th {  
        background-color: #f2f2f2;  
        padding: 10px;  
        border: 1px solid #ddd;  
        text-align: left;  
        font-weight: bold;  
    }  

    .shopCart td {  
        padding: 10px;  
        border: 1px solid #ddd;  
        text-align: center; /* Center align table data */  
    }  

    .shopCart tr:nth-child(even) {  
        background-color: #f9f9f9;  
    }  

    .cart-buttons {  
        margin-top: 20px;  
        text-align: right; /* Align buttons to the right */  
    }  

    .btn-clear, .btn-checkout {  
        padding: 10px 20px;  
        margin-left: 10px;  
        border: none;  
        border-radius: 5px;  
        cursor: pointer;  
        font-size: 16px;  
    }  

    .btn-clear {  
        background-color: #f8d7da; /* Light red for clear button */  
        color: #721c24; /* Darker text color */  
    }  

    .btn-checkout {  
        background-color: #28a745; /* Green for checkout button */  
        color: white; /* White text */  
    }  

    .lbl-total, .lbl-message {  
        font-size: 18px;  
        font-weight: bold;  
        color: #333;  
        text-align: right; /* Align total price and message to the right */  
    }  
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
        <uc:PetTree ID="PetTree1" runat="server" />  
    </div>  
    
    <!-- 右侧搜索结果 -->
    <div class="search-main">
        <h3>搜索结果</h3>
        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
        <asp:GridView ID="gvSearchResults" runat="server" AutoGenerateColumns="False" CssClass="table">
            <Columns>
                <asp:TemplateField HeaderText="图片">
                    <ItemTemplate>
                        <img src='<%# ResolveUrl(Eval("Image").ToString()) %>' alt="商品图片" style="width: 100px; height: 100px;" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ProductId" HeaderText="商品编号" />
                <asp:BoundField DataField="Name" HeaderText="商品名称" />
                <asp:BoundField DataField="ListPrice" HeaderText="商品价格" DataFormatString="{0:C}" />
                <asp:BoundField DataField="UnitCost" HeaderText="单位成本" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Descn" HeaderText="商品描述" />
                <asp:BoundField DataField="Qty" HeaderText="库存" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:Button ID="btnAddToCart" runat="server" Text="放入购物车" CommandArgument='<%# Eval("ProductId") %>' OnClick="AddToCart_Click" CssClass="btn btn-primary" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
    </div>
</asp:Content>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="search-container">
        <!-- 左侧分类 -->
        <div class="search-sidebar">
            <h3>分类商品</h3>
            <uc:PetTree ID="PetTree" runat="server" />
        </div>

        <!-- 右侧搜索结果 -->
        <div class="search-main">
            <asp:Label ID="lblMessage" runat="server" Text="搜索结果如下：" Font-Bold="true" ForeColor="#333"></asp:Label>
            <asp:GridView ID="gvSearchResults" runat="server" AutoGenerateColumns="false" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="商品名称" />
                    <asp:BoundField DataField="ListPrice" HeaderText="价格" DataFormatString="{0:C}" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnAddToCart" runat="server" Text="加入购物车" 
                                        CommandArgument='<%# Eval("ProductId") %>' OnClick="AddToCart_Click" CssClass="btn btn-primary btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>--%>


<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>搜索结果</h2>
    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
    <asp:GridView ID="gvSearchResults" runat="server" AutoGenerateColumns="False" CssClass="table">
        <Columns>
            <asp:TemplateField HeaderText="图片">
                <ItemTemplate>
                    <img src='<%# ResolveUrl(Eval("Image").ToString()) %>' alt="商品图片" style="width: 100px; height: 100px;" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ProductId" HeaderText="商品编号" />
            <asp:BoundField DataField="Name" HeaderText="商品名称" />
            <asp:BoundField DataField="ListPrice" HeaderText="商品价格" DataFormatString="{0:C}" />
            <asp:BoundField DataField="UnitCost" HeaderText="单位成本" DataFormatString="{0:C}" />
            <asp:BoundField DataField="Descn" HeaderText="商品描述" />
            <asp:BoundField DataField="Qty" HeaderText="库存" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:Button ID="btnAddToCart" runat="server" Text="放入购物车" CommandArgument='<%# Eval("ProductId") %>' OnClick="AddToCart_Click" CssClass="btn btn-primary" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>--%>
