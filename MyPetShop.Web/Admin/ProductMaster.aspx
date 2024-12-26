<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ProductMaster.aspx.cs" Inherits="MyPetShop.Web.Admin.ProductMaster" %>  
<%@ Register Src="~/Controls/ManagementLinks.ascx" TagName="ManagementLinks" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <style>  
        /* 定制删除按钮颜色 */  
        .btn-custom-delete {  
            background-color: #208bbae6;  
            color: #fff; /* 调整字体颜色 */  
            border: none; /* 移除边框 */
            border-radius:5px;
            font-weight:500;
            height: 35px;
            padding: 0 10px;
        }  

        /* 定制添加按钮颜色 */  
        .btn-custom-add {  
            background-color: #139557c2;  
            color: #fff; /* 调整字体颜色 */  
            border: none; /* 移除边框 */  
            border-radius:5px;
            font-weight:500;
            height: 35px;
            padding: 0 10px;
        }  

        /* 去掉链接的下划线 */  
        a {  
            text-decoration: none;  /* 移除下划线 */  
            color: inherit;  /* 使链接继承父元素的字体颜色 */  
        }  

        a:hover {  
            text-decoration: none; /* 去掉悬停时的下划线 */  
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

        <!-- 右侧商品列表 -->  
        <div class="right-pane">  
            <asp:ScriptManager ID="ScriptManager1" runat="server" />  
            <h3>商品信息管理</h3>  
            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False"  
                          CssClass="table table-striped table-bordered"  
                          DataKeyNames="ProductId" OnRowCommand="gvProducts_RowCommand"  
                          OnPageIndexChanging="gvProducts_PageIndexChanging">  
                <Columns>  
                    <asp:TemplateField>  
                        <ItemTemplate>  
                            <asp:CheckBox ID="chkSelect" runat="server" />  
                        </ItemTemplate>  
                    </asp:TemplateField>  
                    <asp:BoundField DataField="ProductId" HeaderText="商品ID" />  
                    <asp:BoundField DataField="Name" HeaderText="商品名称" />  
                    <asp:BoundField DataField="ListPrice" HeaderText="商品价格" />  
                    <asp:BoundField DataField="Qty" HeaderText="库存" />  
                    <asp:TemplateField HeaderText="操作">  
                        <ItemTemplate>  
                            <a href="ProductSub.aspx?ProductId=<%# Eval("ProductId") %>" class="btn btn-primary btn-sm">修改</a>  
                        </ItemTemplate>  
                    </asp:TemplateField>  
                </Columns>  
            </asp:GridView>  
            <asp:Button ID="btnDeleteSelected" runat="server" Text="删除选中商品" OnClick="btnDeleteSelected_Click" CssClass="btn-custom-delete" />  
            <asp:Button ID="btnAddProduct" runat="server" Text="添加商品" OnClick="btnAddProduct_Click" CssClass="btn-custom-add" />  
        </div>  
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>  
    </div>  
</asp:Content>