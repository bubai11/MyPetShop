<%@ Page Title="Submit Cart" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="SubmitCart.aspx.cs" Inherits="MyPetShop.Web.Pages.SubmitCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>填写发货地址</h2>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
    <fieldset>
        <legend>发货地址表单</legend>
        <!-- 修改 ControlToValidate 为 Addr1 -->
        <asp:TextBox ID="Addr1" runat="server" TextMode="MultiLine" Rows="3" />
        <asp:RequiredFieldValidator ID="Addr1Required" runat="server" ControlToValidate="Addr1" ErrorMessage="送货地址必填！" />

        <!-- 修改 ControlToValidate 为 Addr2 -->
        <asp:TextBox ID="Addr2" runat="server" TextMode="MultiLine" Rows="3" />
        <asp:RequiredFieldValidator ID="Addr2Required" runat="server" ControlToValidate="Addr2" ErrorMessage="发票寄送地址必填！" />

        <!-- 修改 ControlToValidate 为 City -->
        <asp:TextBox ID="City" runat="server" />
        <asp:RequiredFieldValidator ID="CityRequired" runat="server" ControlToValidate="City" ErrorMessage="城市必填！" />

        <!-- 修改 ControlToValidate 为 State -->
        <asp:TextBox ID="State" runat="server" />
        <asp:RequiredFieldValidator ID="StateRequired" runat="server" ControlToValidate="State" ErrorMessage="省份必填！" />

        <!-- 修改 ControlToValidate 为 Zip -->
        <asp:TextBox ID="Zip" runat="server" />
        <asp:RequiredFieldValidator ID="ZipRequired" runat="server" ControlToValidate="Zip" ErrorMessage="邮编必填！" />

        <!-- 修改 ControlToValidate 为 Phone -->
        <asp:TextBox ID="Phone" runat="server" />
        <asp:RequiredFieldValidator ID="PhoneRequired" runat="server" ControlToValidate="Phone" ErrorMessage="联系电话必填！" />
    </fieldset>
    <asp:Button ID="SubmitOrderButton" runat="server" Text="提交结算" OnClick="SubmitOrderButton_Click" />
    <asp:Label ID="OrderStatusLabel" runat="server" />
</asp:Content>
