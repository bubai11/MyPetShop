<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SiteMap.ascx.cs" Inherits="MyPetShop.Web.Controls.SiteMap" %>
<style>
    .breadcrumb {
        display: inline;
        padding-left: 10px;
    }
    .breadcrumb .current-node {
        font-weight: bold;
        color: #000;
    }
</style>
<div>
    <span>您的位置：</span>
    <asp:SiteMapPath ID="SiteMapPath1" runat="server" CssClass="breadcrumb">
        <CurrentNodeStyle CssClass="current-node" />
        <NodeStyle CssClass="node" />
        <RootNodeStyle CssClass="root-node" />
    </asp:SiteMapPath>
</div>
