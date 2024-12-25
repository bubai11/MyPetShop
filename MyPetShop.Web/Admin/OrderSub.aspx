<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="OrderSub.aspx.cs" Inherits="MyPetShop.Web.Admin.OrderSub" %>
<%@ Register Src="~/Controls/ManagementLinks.ascx" TagName="ManagementLinks" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* 整体容器样式 */
        .container {
            margin-top: 20px;
            padding: 0 10px; /* 左右缩小内边距 */
            display: flex; /* 使用flex布局 */
            justify-content: space-between; /* 左右两部分占据空间 */
        }

        /* 左侧导航栏 */
        .left-pane {
            width: 25%; /* 左侧导航栏占页面宽度的25% */
            margin-right: 20px; /* 给左侧部分添加右间距 */
            border-right: 2px solid #ddd; /* 添加右边框分割线 */
            padding-right: 15px; /* 右边添加内边距 */
        }

        /* 右侧内容区 */
        .right-pane {
            width: 73%; /* 右侧内容区占页面宽度的73% */
            display: flex;
            flex-direction: column;
        }

        /* 标题样式 */
        h3 {
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        /* 面板样式 */
        .panel {
            margin-bottom: 20px; /* 面板底部间距 */
        }

        .panel-body {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        /* 表格样式 */
        .table {
            margin-top: 15px;
            width: 100%; /* 确保表格宽度占满父容器 */
        }

        /* 按钮样式 */
        .btn {
            margin-right: 10px; /* 按钮之间的间距 */
        }

        /* 样式调整：左侧导航栏链接 */
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
            background-color: #B3C8CF;
            border-color: #A1B7B4;
        }

        .btn-warning:hover {
            background-color: #A1B7B4;
            border-color: #8F9F9D;
        }

        .btn-info {
            background-color: #E5E1DA;
            border-color: #D5D1C8;
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

        /* 订单主表面板样式 */
        #orderDetails {
            display: grid; /* 使用 Grid 布局 */
            grid-template-columns: 1fr 1fr; /* 两列布局 */
            gap: 10px; /* 列之间的间距 */
            border: 2px solid #ddd; /* 添加边框 */
            border-radius: 4px; /* 圆角边框 */
            padding: 20px; /* 内边距 */
            background-color: #fff; /* 背景颜色 */
        }

        /* 每个属性和值的布局 */
        #orderDetails p {
            display: flex;
            justify-content: space-between; /* 属性和值分开显示 */
        }

        /* 样式优化 */
        .panel-body {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        /* 订单主表面板样式 */
        /*#orderDetails {
            border: 2px solid #ddd;*/ /* 添加边框 */
            /*border-radius: 4px;*/ /* 圆角边框 */
            /*padding: 10px;*/ /* 内边距 */
            /*background-color: #fff;*/ /* 背景颜色 */
        /*}*/

        /* 订单主表内容区域 */
        /*.panel-body {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 4px;
            border: 1px solid #ddd;
}*/
    </style>

<div class="container">
        <!-- 左侧导航栏 -->
        <div class="left-pane">
            <uc:ManagementLinks runat="server" ID="ManagementLinks1" CssClass="management-links" />
        </div>

        <!-- 右侧内容区 -->
        <div class="right-pane">
            <h3>订单主表</h3>
            <div id="orderDetails" class="panel panel-default">
                <div class="panel-body">
                    <!-- 左侧：订单基本信息 -->
                    <p><strong>订单ID:</strong> <span id="lblOrderId" runat="server"></span></p>
                    <p><strong>客户名称:</strong> <span id="lblUserName" runat="server"></span></p>
                    <p><strong>订购时间:</strong> <span id="lblOrderDate" runat="server"></span></p>
                    <p><strong>地址:</strong> <span id="lblAddr" runat="server"></span></p>
                    <p><strong>城市:</strong> <span id="lblCity" runat="server"></span></p>

                    <!-- 右侧：订单的其他信息 -->
                    <p><strong>区域:</strong> <span id="lblState" runat="server"></span></p>
                    <p><strong>邮政编码:</strong> <span id="lblZip" runat="server"></span></p>
                    <p><strong>邮箱:</strong> <span id="lblEmail" runat="server"></span></p>
                    <p><strong>手机:</strong> <span id="lblPhone" runat="server"></span></p>
                    <p><strong>审核状态:</strong> <span id="lblStatus" runat="server"></span></p>
                </div>
            </div>

            <h3>购买商品详情</h3>
            <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="SerialNo" HeaderText="序号" SortExpression="SerialNo" />
                    <asp:BoundField DataField="ProductName" HeaderText="商品名称" SortExpression="ProductName" />
                    <asp:BoundField DataField="ListPrice" HeaderText="商品单价" SortExpression="ListPrice" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="Qty" HeaderText="购买数量" SortExpression="Qty" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="总价" SortExpression="TotalPrice" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>