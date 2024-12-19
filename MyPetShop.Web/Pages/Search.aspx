<%@ Page Title="商品搜索" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MyPetShop.Web.Pages.SearchResults" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

</asp:Content>
