<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CategoryMaster.aspx.cs" Inherits="MyPetShop.Web.Admin.CategoryMaster" %>
<%@ Register Src="~/Controls/ManagementLinks.ascx" TagName="ManagementLinks" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* 去掉链接的下划线 */
        a {
            text-decoration: none;
            color: inherit;  /* 使链接继承父元素的字体颜色 */
        }

        a:hover {
            text-decoration: none;  /* 去掉悬停时的下划线 */
            color: #007BFF;  /* 自定义悬停时的颜色 */
        }

        /* 容器：整体布局 */
        .container {
            margin-top: 20px;
            padding: 0 10px; /* 缩小左右内边距 */
            display: flex; /* 使用 flexbox 布局 */
            justify-content: space-between; /* 左右两部分占据空间 */
        }

        /* 左侧导航栏样式 */
        .left-pane {
            width: 25%; /* 左侧导航栏占页面宽度的 25% */
            margin-right: 15px; /* 添加右间距 */
            border-right: 2px solid #ddd; /* 添加右边框分割线 */
            padding-right: 15px; /* 添加内边距 */
        }

        /* 右侧内容区样式 */
        .right-pane {
            width: 73%; /* 右侧内容区占页面宽度的 73% */
        }

        h3 {
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        .table {
            margin-top: 15px;
            width: 100%; /* 确保表格宽度占满父容器 */
        }

        .btn {
            margin-right: 10px; /* 按钮之间的间距 */
        }

        /* 样式调整：左侧导航栏链接的间距 */
        .management-links a {
            display: block;
            margin-bottom: 10px;
            padding: 10px;
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            text-decoration: none;
            color: #333;
            border-radius: 4px;
        }

        .management-links a:hover {
            background-color: #e9ecef;
        }

        .management-links ul li {
            list-style: none;
        }

        .management-links ul {
            padding-left: 0px;
        }
    </style>

    <div class="container">
        <!-- 左侧导航栏 -->
        <div class="left-pane">
            <uc:ManagementLinks runat="server" ID="ManagementLinks1" CssClass="management-links" />
        </div>

        <!-- 右侧商品分类列表 -->
        <div class="right-pane">
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
                            <asp:Button ID="btnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("CategoryId") %>' Text="编辑" CssClass="btn btn-warning btn-sm" />
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("CategoryId") %>' Text="删除" CssClass="btn btn-danger btn-sm" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:Button ID="btnNew" runat="server" Text="新建分类" OnClick="btnNew_Click" CssClass="btn btn-primary" />
        </div>
    </div>
</asp:Content>
