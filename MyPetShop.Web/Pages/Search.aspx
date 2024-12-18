<%@ Page Title="商品搜索" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MyPetShop.Web.Pages.SearchResults" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>搜索结果</h2>
    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
    <asp:GridView ID="gvSearchResults" runat="server" CssClass="table table-bordered mt-4" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="ProductId" HeaderText="商品编号" />
            <asp:BoundField DataField="Name" HeaderText="商品名称" />
            <asp:BoundField DataField="ListPrice" HeaderText="价格" DataFormatString="{0:C}" />
            <asp:BoundField DataField="Qty" HeaderText="库存" />
            <asp:BoundField DataField="Descn" HeaderText="描述" />
        </Columns>
    </asp:GridView>
</asp:Content>
