<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="MyPetShop.Web.Pages.OrderList" %>  
<%@ Register Src="../Controls/PetTree.ascx" TagName="PetTree" TagPrefix="uc" %>  

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <style>  
        .order-container {  
            width: 90%; /* 设置容器宽度为90% */  
            margin: 20px auto; /* 减小上下空隙，居中对齐 */  
            padding: 20px; /* 添加一些内边距 */  
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */  
            background-color: #fff; /* 设置背景颜色 */  
            display: flex;  
            justify-content: space-between; /* Aligns the sidebar and main content side by side */  
            border-radius: 8px; /* 设置圆角 */  
            border: 1px solid #ddd; /* 边框 */  
        }  

        h2, h4 {  
            text-align: center; /* 标题居中 */  
            margin-bottom: 15px; /* 标题与内容之间的间距 */  
        }  

        .table {  
            width: 100%; /* 表格宽度100% */  
            border-collapse: collapse; /* 表格边框合并 */  
        }  

        .table th,  
        .table td {  
            border: 1px solid #ddd; /* 单元格边框 */  
            padding: 12px; /* 增大内边距 */  
            text-align: left; /* 文本左对齐 */  
        }  

        .table th {  
            background-color: #f2f2f2; /* 表头背景颜色 */  
            font-weight: bold; /* 表头字体加粗 */  
        }  

        .table-striped tbody tr:nth-of-type(odd) {  
            background-color: #f9f9f9; /* 条纹背景颜色 */  
        }  

        .search-sidebar {  
            padding: 15px; /* 增加内边距 */  
            width: 300px; /* 增加侧边栏宽度 */  
            border-right: 1px solid #ccc; /* 添加分隔线 */  
        }  

        .orderList {  
            flex-grow: 1; /* 使订单列表占据剩余空间 */  
            padding: 15px; /* 增加内边距 */  
        }  

        /* 提示信息样式 */  
        .no-orders-message {  
            text-align: center; /* 内容居中 */  
            color: #ff0000; /* 红色警示信息 */  
            font-size: 18px; /* 字体大小 */  
            margin-top: 20px; /* 上边距 */  
        }  
    </style>   

    <div class="order-container">  
        <!-- 左侧分类 -->  
        <div class="search-sidebar">  
            <h3>分类商品</h3>  
            <uc:PetTree ID="CategoryNavigation1" runat="server" />  
        </div>  
        <!-- 右侧订单列表 -->  
        <div class="search-sidebar orderList">  
            <h4>我的订单列表</h4>  
            
            <!-- 显示没有订单的提示 -->  
            <asp:Label ID="lblNoOrders" runat="server" CssClass="no-orders-message" Text="未登录或没有订单！" Visible="false" />  

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
    </div>  
</asp:Content>