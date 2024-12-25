<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ProductSub.aspx.cs" Inherits="MyPetShop.Web.Admin.ProductSub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>修改商品信息</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
        <div class="form-group">
            <label for="txtName">商品名称:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="商品名称不能为空" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtListPrice">商品价格:</label>
            <asp:TextBox ID="txtListPrice" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvListPrice" runat="server" ControlToValidate="txtListPrice" ErrorMessage="商品价格不能为空" ForeColor="Red" />
            <asp:RangeValidator ID="rvListPrice" runat="server" ControlToValidate="txtListPrice" ErrorMessage="商品价格必须为数字" Type="Currency" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtQty">库存:</label>
            <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvQty" runat="server" ControlToValidate="txtQty" ErrorMessage="库存不能为空" ForeColor="Red" />
            <asp:RangeValidator ID="rvQty" runat="server" ControlToValidate="txtQty" ErrorMessage="库存必须为数字" Type="Integer" ForeColor="Red" />
        </div>
        <asp:Button ID="btnUpdate" runat="server" Text="修改商品" OnClick="btnUpdate_Click" CssClass="btn btn-primary" />
        <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" CssClass="btn btn-secondary" CausesValidation="False" />
    </div>
</asp:Content>