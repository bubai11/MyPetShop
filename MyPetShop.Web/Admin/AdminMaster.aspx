<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="AdminMaster.aspx.cs" Inherits="MyPetShop.Web.Admin.AdminMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <style>  
        /* 外部容器，使用 Flexbox 布局 */  
        .admin-container {  
            display: flex;  
            justify-content: space-around;  /* 水平间距均匀 */  
            align-items: flex-start;  /* 从容器顶部对齐 */  
            height: auto;  /* 根据内容调整高度 */  
            margin: 20px; /* 确保整体有适当的外边距 */  
        }  

        /* 每个管理块 */  
        .admin-block {  
            display: flex;  
            flex-direction: column;  /* 使图标在上，文字在下 */  
            justify-content: center;  
            align-items: center;  
            width: 25%;  /* 每块占总宽度的25% */  
            padding: 30px; /* 增加内边距，使块内内容更显著 */  
            border: 2px solid #ddd;  /* 为每个块加个边框 */  
            border-radius: 8px;  
            text-align: center;  /* 文字居中 */  
            transition: transform 0.3s ease-in-out;  
            cursor: pointer;  /* 鼠标变为手型 */  
            margin: 10px; /* 每个块之间稍微增加间距 */  
        }  

        /* 管理块 hover 效果 */  
        .admin-block:hover {  
            transform: scale(1.05);  /* 鼠标悬停时稍微放大 */  
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);  /* 加点阴影 */  
        }  

        /* 图标样式 */  
        .admin-block img {  
            width: 70px;  /* 增加图标宽度 */  
            height: 70px;  /* 增加图标高度 */  
            margin-bottom: 10px;  /* 图标和文字间隔 */  
        }  

        /* 文字样式 */  
        .admin-block span {  
            font-size: 20px; /* 增大文字 */  
            color: #333;  
            text-decoration: none;  
            font-weight: bold;  
        }  

        /* 文字hover效果 */  
        .admin-block span:hover {  
            color: #007BFF;  
        }  
    </style>  

    <div class="admin-container">  
        <!-- 分类管理块 -->  
        <div class="admin-block" onclick="window.location.href='CategoryMaster.aspx'">  
            <img src="../Images/diagram.png" alt="Category Icon" />  
            <span>分类管理</span>  
        </div>  

        <!-- 商品管理块 -->  
        <div class="admin-block" onclick="window.location.href='ProductMaster.aspx'">  
            <img src="../Images/kitten.png" alt="Product Icon" />  
            <span>商品管理</span>  
        </div>  

        <!-- 订单管理块 -->  
        <div class="admin-block" onclick="window.location.href='OrderMaster.aspx'">  
            <img src="../Images/tracking.png" alt="Order Icon" />  
            <span>订单管理</span>  
        </div>  
    </div>  
</asp:Content>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* 外部容器，使用 Flexbox 布局 */
        .admin-container {
            display: flex;
            justify-content: space-around;  /* 水平间距均匀 */
            align-items: center;  /* 垂直居中 */
            height: 100vh;  /* 满屏高度 */
            margin: 0;
        }

        /* 每个管理块 */
        .admin-block {
            display: flex;
            flex-direction: column;  /* 使图标在上，文字在下 */
            justify-content: center;
            align-items: center;
            width: 30%;  /* 每块占总宽度的30% */
            padding: 20px;
            border: 2px solid #ddd;  /* 为每个块加个边框 */
            border-radius: 8px;
            text-align: center;  /* 文字居中 */
            transition: transform 0.3s ease-in-out;
        }

        /* 管理块 hover 效果 */
        .admin-block:hover {
            transform: scale(1.05);  /* 鼠标悬停时稍微放大 */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);  /* 加点阴影 */
        }

        /* 图标样式 */
        .admin-block img {
            width: 50px;  /* 图标宽度 */
            height: 50px;  /* 图标高度 */
            margin-bottom: 10px;  /* 图标和文字间隔 */
        }

        /* 文字样式 */
        .admin-block a {
            font-size: 18px;
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }

        /* 文字hover效果 */
        .admin-block a:hover {
            color: #007BFF;
        }
    </style>

    <div class="admin-container">
        <!-- 分类管理块 -->
        <div class="admin-block">
            <img src="../Images/diagram.png" alt="Category Icon" />
            <asp:HyperLink ID="hlCategory" runat="server" Text="分类管理" />
        </div>

        <!-- 商品管理块 -->
        <div class="admin-block">
            <img src="../Images/kitten.png" alt="Product Icon" />
            <asp:HyperLink ID="hlProduct" runat="server" Text="商品管理" />
        </div>

        <!-- 订单管理块 -->
        <div class="admin-block">
            <img src="../Images/tracking.png" alt="Order Icon" />
            <asp:HyperLink ID="hlOrder" runat="server" Text="订单管理" />
        </div>
    </div>
</asp:Content>--%>



