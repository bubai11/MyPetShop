<%@ Page Title="Submit Cart" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="SubmitCart.aspx.cs" Inherits="MyPetShop.Web.Pages.SubmitCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>填写发货地址</h2>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
    <fieldset>
        <legend>Shipping Address</legend>
        <asp:TextBox ID="Addr1" runat="server" TextMode="MultiLine" Rows="3" RequiredFieldValidatorID="Addr1Required" />
        <asp:RequiredFieldValidator ID="Addr1Required" runat="server" ControlToValidate="Addr1TextBox" ErrorMessage="送货地址必填！" />
        <asp:TextBox ID="Addr2" runat="server" TextMode="MultiLine" Rows="3"  RequiredFieldValidatorID="Addr2Required" />
        <asp:RequiredFieldValidator ID="Addr2Required" runat="server" ControlToValidate="Addr2TextBox" ErrorMessage="发票寄送地址必填！" />
        <asp:TextBox ID="City" runat="server" RequiredFieldValidatorID="CityRequired" />
        <asp:RequiredFieldValidator ID="CityRequired" runat="server" ControlToValidate="CityTextBox" ErrorMessage="城市必填！" />
        <asp:TextBox ID="State" runat="server" RequiredFieldValidatorID="StateRequired" />
        <asp:RequiredFieldValidator ID="StateRequired" runat="server" ControlToValidate="StateTextBox" ErrorMessage="省份必填！" />
        <asp:TextBox ID="Zip" runat="server" RequiredFieldValidatorID="ZipRequired" />
        <asp:RequiredFieldValidator ID="ZipRequired" runat="server" ControlToValidate="ZipTextBox" ErrorMessage="邮编必填！" />
        <asp:TextBox ID="Phone" runat="server" RequiredFieldValidatorID="PhoneRequired" />
        <asp:RequiredFieldValidator ID="PhoneRequired" runat="server" ControlToValidate="PhoneTextBox" ErrorMessage="联系电话必填！" />
    </fieldset>
    <asp:Button ID="SubmitOrderButton" runat="server" Text="提交结算" OnClick="SubmitOrderButton_Click" />
    <asp:Label ID="OrderStatusLabel" runat="server" />
</asp:Content>