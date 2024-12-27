<%@ Page Title="商品详情" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ProShow.aspx.cs" Inherits="MyPetShop.Web.Pages.ProShow" %>  
<%@ Register Src="../Controls/PetTree.ascx" TagName="PetTree" TagPrefix="uc" %>  

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <style>  
        .search-container {  
            display: flex;  
            justify-content: space-between;  
            width: 90%; /* 减小宽度 */  
            margin: 0 auto; /* 居中页面内容 */  
        }  
        .search-sidebar {  
            width: 28%;   
            padding: 15px;  
            border-right: 1px solid #ccc;  
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* 添加阴影 */  
        }  
        .search-main {  
            width: 70%;   
            padding: 15px;  
        }  
        .product-alert {  
            background-color: #e7f3fe;  
            border: 1px solid #b8ebf8;  
            color: #31708f;  
            padding: 20px;  
            margin: 20px 0;  
            border-radius: 5px;  
            font-size: 18px;  
            font-weight: bold;  
            text-align: center;  
            display: flex; /* 使用 flexbox 来居中内容 */  
            align-items: center;  
            justify-content: center;  
        }  
        .product-alert::before {   
            content: "⚠️ ";   
            font-size: 20px;  
            margin-right: 8px; /* 添加图标与文本之间的间隔 */  
        }  

        /* Styles for TreeView */  
        .treeview-container {   
            margin-top: 20px;   
            padding: 10px;   
        }  
        
        .custom-treeview .TreeNode {  
            padding: 8px 10px;  
            cursor: pointer;  
            color: #333;  
            transition: background-color 0.3s;  
        }  

        .custom-treeview .TreeNode:hover {  
            background-color: #e0f7fa;  
        }  

        .custom-treeview .TreeNode-selected {  
            background-color: #00acc1;  
            color: white;  
        }  
    </style>  

    <div class="search-container">  
        <div class="search-sidebar">  
            <h3>分类商品</h3>  
            <div class="treeview-container">  
                <uc:PetTree ID="CategoryNavigation1" runat="server" OnSelectedNodeChanged="CategoryNavigation1_SelectedNodeChanged" AutoPostBack="true" CssClass="custom-treeview" />  
            </div>  
        </div>  

        <div class="search-main">  
            <h2>商品详情</h2>  

            <asp:UpdatePanel ID="UpdatePanelProductDetails" runat="server">  
                <ContentTemplate>  
                    <asp:Label ID="lblNoProduct" runat="server" Text="请选择您要查看详情的商品" CssClass="alert alert-info product-alert" Visible="false" />  

                    <asp:GridView ID="ProductGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"   
                                  AllowPaging="True" PageSize="4" OnPageIndexChanging="ProductGridView_PageIndexChanging">  
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
                                    <asp:Button ID="btnAddToCart" runat="server" Text="放入购物车" CommandArgument='<%# Eval("ProductId") %>'   
                                                OnClick="AddToCart_Click" CssClass="btn btn-primary" />  
                                </ItemTemplate>  
                            </asp:TemplateField>  
                        </Columns>  
                    </asp:GridView>  
                </ContentTemplate>  
            </asp:UpdatePanel>  
        </div>  
    </div>  
</asp:Content>