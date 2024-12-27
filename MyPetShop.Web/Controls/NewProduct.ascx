<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewProduct.ascx.cs" Inherits="MyPetShop.Web.Controls.NewProduct" %>
<style>
    .showTable{
        float:left;
        width:350px;
        margin-left: 60px;
    }
    /* 商品名称的样式 */
.product-name {
    color: #333; /* 默认颜色 */
    text-decoration: none; /* 默认没有下划线 */
    font-weight: bold; /* 加粗字体 */
    transition: color 0.3s ease; /* 平滑的颜色变化效果 */
}

/* 鼠标悬浮时的样式 */
.product-name:hover {
    color: #007bff; /* 鼠标悬浮时变蓝 */
    text-decoration: underline; /* 鼠标悬浮时显示下划线 */
}
</style>
<asp:GridView ID="NewProductGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped showTable">
    <Columns>
        <asp:TemplateField HeaderText="商品名称">
            <ItemTemplate>
                <asp:HyperLink runat="server" CssClass="product-name" Text='<%# Eval("Name") %>' NavigateUrl='<%# "../Pages/ProShow.aspx?ProductName=" + Eval("Name") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="ListPrice" HeaderText="商品价格" SortExpression="ListPrice" DataFormatString="{0:C}" />
    </Columns>
</asp:GridView>

