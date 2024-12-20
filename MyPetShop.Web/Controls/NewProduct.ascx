<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewProduct.ascx.cs" Inherits="MyPetShop.Web.Controls.NewProduct" %>
<asp:GridView ID="NewProductGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
    <Columns>
        <asp:TemplateField HeaderText="商品名称">
            <ItemTemplate>
                <asp:HyperLink runat="server" Text='<%# Eval("Name") %>' NavigateUrl='<%# "../Pages/ProShow.aspx?ProductName=" + Eval("Name") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="ListPrice" HeaderText="商品价格" SortExpression="ListPrice" DataFormatString="{0:C}" />
    </Columns>
</asp:GridView>

