<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PetTree.ascx.cs" Inherits="MyPetShop.Web.Controls.PetTree" %>
<asp:TreeView ID="TreeViewCategories" runat="server" 
              ShowExpandCollapse="true" 
              OnSelectedNodeChanged="TreeViewCategories_SelectedNodeChanged">
</asp:TreeView>