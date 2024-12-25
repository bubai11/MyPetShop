<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="AddPro.aspx.cs" Inherits="MyPetShop.Web.Admin.AddPro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>添加商品信息</h2>
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
            <label for="txtListPrice">商品单价:</label>
            <asp:TextBox ID="txtListPrice" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvListPrice" runat="server" ControlToValidate="txtListPrice" ErrorMessage="商品单价不能为空" ForeColor="Red" />
            <asp:RangeValidator ID="rvListPrice" runat="server" ControlToValidate="txtListPrice" ErrorMessage="商品单价必须为数字" MinimumValue="0" MaximumValue="999999.99" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtUnitCost">单位成本:</label>
            <asp:TextBox ID="txtUnitCost" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvUnitCost" runat="server" ControlToValidate="txtUnitCost" ErrorMessage="单位成本不能为空" ForeColor="Red" />
            <asp:RangeValidator ID="rvUnitCost" runat="server" ControlToValidate="txtUnitCost" ErrorMessage="单位成本必须为数字" MinimumValue="0" MaximumValue="999999.99" ForeColor="Red" />
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
            <asp:RangeValidator ID="rvQty" runat="server" ControlToValidate="txtQty" ErrorMessage="库存必须为数字" Type="Integer" MinimumValue="0" MaximumValue="9999" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="fuImage">商品图片:</label>
            <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
        </div>
        <asp:Button ID="btnAdd" runat="server" Text="添加商品" OnClick="btnAdd_Click" CssClass="btn btn-primary" />
        <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" CssClass="btn btn-secondary" CausesValidation="False" />
    </div>
</asp:Content>