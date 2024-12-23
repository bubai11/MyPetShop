<%@ Page Title="商品搜索" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MyPetShop.Web.Pages.search" %>
<%@ Register Src="../Controls/PetTree.ascx" TagName="PetTree" TagPrefix="uc" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
