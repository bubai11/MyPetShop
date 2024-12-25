<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ProductSub.aspx.cs" Inherits="MyPetShop.Web.Admin.ProductSub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3>修改商品信息</h3>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
        <div class="form-group">
            <label for="txtName">商品名称:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="商品名称不能为空" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtCategoryId">商品分类:</label>
            <asp:DropDownList ID="ddlCategoryId" runat="server" CssClass="form-control">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvCategoryId" runat="server" ControlToValidate="ddlCategoryId" ErrorMessage="商品分类不能为空" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtListPrice">商品价格:</label>
            <asp:TextBox ID="txtListPrice" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvListPrice" runat="server" ControlToValidate="txtListPrice" ErrorMessage="商品价格不能为空" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtUnitCost">单位成本:</label>
            <asp:TextBox ID="txtUnitCost" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvUnitCost" runat="server" ControlToValidate="txtUnitCost" ErrorMessage="单位成本不能为空" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtSuppId">供应商:</label>
            <asp:DropDownList ID="ddlSuppId" runat="server" CssClass="form-control">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvSuppId" runat="server" ControlToValidate="ddlSuppId" ErrorMessage="供应商不能为空" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtDescn">描述:</label>
            <asp:TextBox ID="txtDescn" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
        </div>
        <div class="form-group">
            <label for="txtQty">库存:</label>
            <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvQty" runat="server" ControlToValidate="txtQty" ErrorMessage="库存不能为空" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="fuImage">商品图片:</label>
            <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
            <asp:Image ID="imgCurrentImage" runat="server" CssClass="img-responsive" />
        </div>
        <asp:Button ID="btnUpdate" runat="server" Text="修改商品" OnClick="btnUpdate_Click" CssClass="btn btn-primary" />
        <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" CssClass="btn btn-secondary" CausesValidation="False" />
    </div>
</asp:Content>