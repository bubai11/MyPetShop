<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyPetShop.Web._Default" %>
<%--<%@ Register Src="~/Controls/AutoShow.ascx" TagPrefix="uc" TagName="AutoShow" %>--%>
<%@ Register Src="~/Controls/NewProduct.ascx" TagName="NewProduct" TagPrefix="uc" %>
<%--<%@ Register TagPrefix="uc" Namespace="MyPetShop.Web.Controls" Assembly="MyPetShop.Web" %>--%>


<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc:NewProduct ID="NewProduct" runat="server" />
    <%--<uc:AutoShow ID="AutoShow" runat="server"/>--%>

</asp:Content>
