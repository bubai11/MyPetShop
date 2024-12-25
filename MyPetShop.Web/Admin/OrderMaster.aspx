<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="OrderMaster.aspx.cs" Inherits="MyPetShop.Web.Admin.OrderMaster" %>
<%@ Register Src="~/Controls/ManagementLinks.ascx" TagName="ManagementLinks" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
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
            margin-right: 15px; /* 给左侧部分添加右间距 */
            border-right: 2px solid #ddd; /* 添加右边框分割线 */
            padding-right: 15px; /* 给右边加点内边距，使内容不紧贴分割线 */
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

        .btn-primary {
            margin-top: 20px;
        }

        /* 控制GridView的表格样式 */
        .table-striped {
            width: 100%;
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

        /* 修改按钮颜色 */
        .btn-warning {
            background-color: #B3C8CF; /* 修改审核商品按钮颜色 */
            border-color: #A1B7B4; /* 边框颜色 */
        }

        .btn-warning:hover {
            background-color: #A1B7B4;
            border-color: #8F9F9D;
        }

        .btn-info {
            background-color: #E5E1DA; /* 修改查看订单详情按钮颜色 */
            border-color: #D5D1C8; /* 边框颜色 */
        }

        .btn-info:hover {
            background-color: #D5D1C8;
            border-color: #B6B2A3;
        }
        .management-links ul li{
            list-style:none;
        }
        
        .management-links ul{
            padding-left:0px;
        }
    </style>

    <div class="container">
        <!-- 左侧导航栏 -->
        <div class="left-pane">
            <uc:ManagementLinks runat="server" ID="ManagementLinks1" CssClass="management-links" />
        </div>

        <!-- 右侧订单列表 -->
        <div class="right-pane">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <h3>订单列表</h3>
            <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False"
                          CssClass="table table-striped table-bordered"
                          OnRowCommand="gvOrders_RowCommand"
                          OnPageIndexChanging="gvOrders_PageIndexChanging"
                          DataKeyNames="OrderId">
                <Columns>
                    <asp:TemplateField HeaderText="选择">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OrderId" HeaderText="订单ID" SortExpression="OrderId" />
                    <asp:BoundField DataField="UserName" HeaderText="购买用户" SortExpression="UserName" />
                    <asp:BoundField DataField="OrderDate" HeaderText="订单日期" SortExpression="OrderDate" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Status" HeaderText="审核状态" SortExpression="Status" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:Button ID="btnReview" runat="server" Text="审核商品" CommandName="Review"
                                        CommandArgument='<%# Eval("OrderId") %>' CssClass="btn btn-warning btn-sm" />
                            <asp:Button ID="btnDetails" runat="server" Text="查看订单详情" CommandName="Details"
                                        CommandArgument='<%# Eval("OrderId") %>' CssClass="btn btn-info btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnBulkReview" runat="server" Text="批量审核" OnClick="btnBulkReview_Click" CssClass="btn btn-primary" />
        </div>
    </div>
</asp:Content>
