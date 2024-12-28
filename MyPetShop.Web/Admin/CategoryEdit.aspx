<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CategoryEdit.aspx.cs" Inherits="MyPetShop.Web.Admin.CategoryEdit" %>
<%@ Register Src="~/Controls/ManagementLinks.ascx" TagName="ManagementLinks" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .category-edit {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            max-width: 400px;
            margin: 70px auto;
        }
        
        .category-edit table {
            width: 100%;
        }
        
        .category-edit td {
            padding: 8px 0;
        }
        
        .category-edit td:first-child {
            width: 80px; /* Set a fixed width for the label column */
            text-align: center;
            padding-right: 10px;
        }
        
        .category-edit input[type="text"],
        .category-edit textarea {
            width: calc(100% - 22px); /* Full width minus padding */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Include padding in the element's total width and height */
        }
        
        .category-edit textarea {
            resize: vertical;
        }
        
        .category-edit .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }

        .category-edit .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .category-edit .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        .category-edit h3{
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .back-link {
            display: block;
            text-align: center;
            color: #007bff;
            text-decoration: none;
            font-size: 16px;
        }
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
    <div class="category-edit">
        <h3>分类管理</h3>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
        <table>
            <tr>
                <td>名称:</td>
                <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>描述:</td>
                <td><asp:TextBox ID="txtDescn" runat="server" TextMode="MultiLine" Rows="3" Columns="20"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" CssClass="btn btn-secondary" />
                </td>
            </tr>
        </table>
        <a href="CategoryMaster.aspx" class="back-link">返回分类列表</a>
    </div>
        </div>
    </div>
</asp:Content>