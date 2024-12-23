<%@ Page Title="商品详情" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ProShow.aspx.cs" Inherits="MyPetShop.Web.Pages.ProShow" %>
<%@ Register Src="../Controls/PetTree.ascx" TagName="PetTree" TagPrefix="uc" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>  
        .search-container {  
            display: flex;  
            justify-content: space-around; /* Aligns the sidebar and main content side by side */  
            width: 100%;  
        }  

        .search-sidebar:first-child {  
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
        <uc:PetTree ID="CategoryNavigation1" runat="server" />
    </div>
    <div class="search-sidebar">
        <h2>商品详情</h2>
        <!-- 商品详细信息列表 -->
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
    </div>
    </div>
</asp:Content>
