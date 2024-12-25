<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CategoryMaster.aspx.cs" Inherits="MyPetShop.Web.Admin.CategoryMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* Your CSS styles here */
    </style>
    <div class="container">
        <h3>商品分类管理</h3>
        <asp:Repeater ID="rptCategories" runat="server" OnItemCommand="rptCategories_ItemCommand">
            <HeaderTemplate>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>分类名称</th>
                            <th>分类描述</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("Name") %></td>
                    <td><%# Eval("Descn") %></td>
                    <td>
                        <asp:Button ID="btnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("CategoryId") %>' Text="编辑" />
                        <asp:Button ID="btnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("CategoryId") %>' Text="删除" />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
            </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:Button ID="btnNew" runat="server" Text="新建分类" OnClick="btnNew_Click" CssClass="btn btn-primary"/>
    </div>
</asp:Content>