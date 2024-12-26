<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PetTree.ascx.cs" Inherits="MyPetShop.Web.Controls.PetTree" %>
<asp:ScriptManager ID="ScriptManager1" runat="server" />
<asp:UpdatePanel ID="UpdatePanelCategories" runat="server">
    <ContentTemplate>
        <asp:TreeView ID="TreeViewCategories" runat="server" 
                      ShowExpandCollapse="true" 
                      OnSelectedNodeChanged="TreeViewCategories_SelectedNodeChanged" 
                      AutoPostBack="true">
        </asp:TreeView>
    </ContentTemplate>
</asp:UpdatePanel>