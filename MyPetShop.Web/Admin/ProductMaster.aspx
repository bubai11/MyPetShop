<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ProductMaster.aspx.cs" Inherits="MyPetShop.Web.Admin.ProductMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>商品信息管理</h2>
        <asp:Panel ID="pnlProductList" runat="server" CssClass="panel panel-default">
            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped"
                DataKeyNames="ProductId" OnRowCommand="gvProducts_RowCommand" AllowPaging="True" OnPageIndexChanging="gvProducts_PageIndexChanging">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ProductId" HeaderText="商品ID" />
                    <asp:BoundField DataField="Name" HeaderText="商品名称" />
                    <asp:BoundField DataField="ListPrice" HeaderText="商品价格" />
                    <asp:BoundField DataField="Qty" HeaderText="库存" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="ProductSub.aspx?ProductId=<%# Eval("ProductId") %>">修改</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="pagination" />
            </asp:GridView>
            <asp:Button ID="btnDeleteSelected" runat="server" Text="删除选中商品" OnClick="btnDeleteSelected_Click" CssClass="btn btn-danger" />
            <asp:Button ID="btnAddProduct" runat="server" Text="添加商品" OnClick="btnAddProduct_Click" CssClass="btn btn-primary" />
        </asp:Panel>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
    </div>
</asp:Content>