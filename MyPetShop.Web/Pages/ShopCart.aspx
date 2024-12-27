<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ShopCart.aspx.cs" Inherits="MyPetShop.Web.Pages.ShopCart" %>  
<%@ Register TagPrefix="uc" TagName="PetTree" Src="~/Controls/PetTree.ascx" %>  
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  

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
    </style>  

    <div class="search-container">  
        <!-- 左侧分类 -->  
        <div class="search-sidebar">  
            <h3>分类商品</h3>  
            <uc:PetTree ID="PetTree" runat="server" />  
        </div>  
        <!-- 右侧结果 -->  
        <div class="search-main">  
            <div class="cart-container">  
                <div class="cart-title">购物车</div>  

                <!-- 购物车商品列表 -->  
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProId,CartItemId" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand" CssClass="shopCart">  
                    <Columns>  
                        <asp:BoundField DataField="ProName" HeaderText="商品名称" />  
                        <asp:BoundField DataField="ListPrice" HeaderText="单价" DataFormatString="{0:C2}" />  
                        <asp:TemplateField HeaderText="购买数量">  
                            <ItemTemplate>  
                                <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("Qty") %>' Width="50px" OnTextChanged="txtQty_TextChanged" AutoPostBack="true"></asp:TextBox>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField HeaderText="操作">  
                            <ItemTemplate>  
                                <asp:Button ID="btnSelect" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" Text="选择" />  
                                <asp:Button ID="btnDelete" runat="server" CommandName="Delete" CommandArgument="<%# Container.DataItemIndex %>" Text="删除" />  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                    </Columns>  
                </asp:GridView>  

                <!-- 操作按钮 -->  
                <div class="cart-buttons">  
                    <asp:Button ID="btnClear" runat="server" Text="清空购物车" OnClick="btnClear_Click" CssClass="btn-clear" />  
                    <asp:Button ID="btnCheckout" runat="server" Text="结算" OnClick="btnCheckout_Click" CssClass="btn-checkout" />  
                </div>  

                <!-- 提示信息 -->  
                <div class="cart-message">  
                    <asp:Label ID="lblTotalPrice" runat="server" Text="总价：" CssClass="lbl-total" />  
                    <br />  
                    <asp:Label ID="lblCart" runat="server" CssClass="lbl-message" />  
                </div>  
            </div>  
        </div>  
    </div>  
</asp:Content>