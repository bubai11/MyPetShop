﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="MyPetShop.Web.Pages.OrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .order-container {
        width: 80%; /* 设置容器宽度为80% */
         margin: 80px auto;
        padding: 20px; /* 添加一些内边距 */
        box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* 添加阴影效果 */
        background-color: #fff; /* 设置背景颜色 */
        border-radius: 8px; /* 设置圆角 */
            border: 1px solid #ddd;
    }

    h2 {
        text-align: center; /* 标题居中 */
        margin-bottom: 20px; /* 添加标题与表格之间的间距 */
    }

    .table {
        width: 100%; /* 表格宽度100% */
        border-collapse: collapse; /* 表格边框合并 */
    }

    .table th,
    .table td {
        border: 1px solid #ddd; /* 单元格边框 */
        padding: 8px; /* 单元格内边距 */
        text-align: left; /* 文本左对齐 */
    }

    .table th {
        background-color: #f2f2f2; /* 表头背景颜色 */
        font-weight: bold; /* 表头字体加粗 */
    }

    .table-striped tbody tr:nth-of-type(odd) {
        background-color: #f9f9f9; /* 条纹背景颜色 */
    }
    </style>
    <div  class="order-container">
        <h4>我的订单列表</h4>
        <asp:GridView ID="OrderGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderId" CssClass="table table-striped">
            <Columns>
                <asp:BoundField DataField="OrderId" HeaderText="订单ID" ReadOnly="True" />
                <asp:BoundField DataField="CustomerId" HeaderText="用户号" ReadOnly="True" />
                <asp:BoundField DataField="UserName" HeaderText="用户名" ReadOnly="True" />
                <asp:BoundField DataField="OrderDate" HeaderText="订单日期" ReadOnly="True" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Addr1" HeaderText="用户地址" ReadOnly="True" />
                <asp:BoundField DataField="City" HeaderText="城市" ReadOnly="True" />
                <asp:BoundField DataField="Zip" HeaderText="邮编" ReadOnly="True" />
                <asp:BoundField DataField="Phone" HeaderText="电话" ReadOnly="True" />
                <asp:BoundField DataField="Status" HeaderText="状态" ReadOnly="True" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
            <h2>我的订单列表</h2>
            <asp:GridView ID="OrderGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderId" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="订单ID" ReadOnly="True" />
                    <asp:BoundField DataField="CustomerId" HeaderText="用户号" ReadOnly="True" />
                    <asp:BoundField DataField="UserName" HeaderText="用户名" ReadOnly="True" />
                    <asp:BoundField DataField="OrderDate" HeaderText="订单日期" ReadOnly="True" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Addr1" HeaderText="用户地址" ReadOnly="True" />
                    <asp:BoundField DataField="City" HeaderText="城市" ReadOnly="True" />
                    <asp:BoundField DataField="Zip" HeaderText="邮编" ReadOnly="True" />
                    <asp:BoundField DataField="Phone" HeaderText="电话" ReadOnly="True" />
                    <asp:BoundField DataField="Status" HeaderText="状态" ReadOnly="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>--%>
