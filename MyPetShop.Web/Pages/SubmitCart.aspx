<%@ Page Title="创建订单" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="SubmitCart.aspx.cs" Inherits="MyPetShop.Web.Pages.SubmitCart" %>
<%@ Register Src="../Controls/PetTree.ascx" TagName="PetTree" TagPrefix="uc" %>  
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>填写发货地址</h2>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" CssClass="validation-summary" />
    <fieldset>
        <legend>发货地址表单</legend>
        <div class="form-group">
            <label for="Addr1">送货地址:</label>
            <asp:TextBox ID="Addr1" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="Addr1Required" runat="server" ControlToValidate="Addr1" ErrorMessage="送货地址必填！" CssClass="error-message" />
        </div>
        <div class="form-group">
            <label for="Addr2">发票寄送地址:</label>
            <asp:TextBox ID="Addr2" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="Addr2Required" runat="server" ControlToValidate="Addr2" ErrorMessage="发票寄送地址必填！" CssClass="error-message" />
        </div>
        <div class="form-group">
            <label for="City">城市:</label>
            <asp:TextBox ID="City" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="CityRequired" runat="server" ControlToValidate="City" ErrorMessage="城市必填！" CssClass="error-message" />
        </div>
        <div class="form-group">
            <label for="State">省份:</label>
            <asp:TextBox ID="State" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="StateRequired" runat="server" ControlToValidate="State" ErrorMessage="省份必填！" CssClass="error-message" />
        </div>
        <div class="form-group">
            <label for="Zip">邮编:</label>
            <asp:TextBox ID="Zip" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="ZipRequired" runat="server" ControlToValidate="Zip" ErrorMessage="邮编必填！" CssClass="error-message" />
        </div>
        <div class="form-group">
            <label for="Phone">联系电话:</label>
            <asp:TextBox ID="Phone" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="PhoneRequired" runat="server" ControlToValidate="Phone" ErrorMessage="联系电话必填！" CssClass="error-message" />
        </div>
    </fieldset>
    <asp:Button ID="SubmitOrderButton" runat="server" Text="提交结算" OnClick="SubmitOrderButton_Click" CssClass="btn btn-primary" />
    <asp:Label ID="OrderStatusLabel" runat="server" CssClass="status-label" />
</asp:Content>