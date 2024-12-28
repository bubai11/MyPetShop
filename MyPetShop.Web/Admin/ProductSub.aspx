<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ProductSub.aspx.cs" Inherits="MyPetShop.Web.Admin.ProductSub" %>
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
        .imageClass{
            width:60px;
            height:auto;
        }
    </style>

    <div class="container">
        <!-- 左侧导航栏 -->
        <div class="left-pane">
            <uc:ManagementLinks runat="server" ID="ManagementLinks1" CssClass="management-links" />
        </div>

        <!-- 右侧商品分类列表 -->
        <div class="right-pane">
        <h3>修改商品信息</h3>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
        <div class="form-group">
            <label for="txtName">商品名称:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="商品名称不能为空" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtCategoryId">商品分类:</label>
            <asp:DropDownList ID="ddlCategoryId" runat="server" CssClass="form-control">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvCategoryId" runat="server" ControlToValidate="ddlCategoryId" ErrorMessage="商品分类不能为空" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtListPrice">商品价格:</label>
            <asp:TextBox ID="txtListPrice" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvListPrice" runat="server" ControlToValidate="txtListPrice" ErrorMessage="商品价格不能为空" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtUnitCost">单位成本:</label>
            <asp:TextBox ID="txtUnitCost" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvUnitCost" runat="server" ControlToValidate="txtUnitCost" ErrorMessage="单位成本不能为空" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtSuppId">供应商:</label>
            <asp:DropDownList ID="ddlSuppId" runat="server" CssClass="form-control">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvSuppId" runat="server" ControlToValidate="ddlSuppId" ErrorMessage="供应商不能为空" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="txtDescn">描述:</label>
            <asp:TextBox ID="txtDescn" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
        </div>
        <div class="form-group">
            <label for="txtQty">库存:</label>
            <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvQty" runat="server" ControlToValidate="txtQty" ErrorMessage="库存不能为空" ForeColor="Red" />
        </div>
        <div class="form-group">
            <label for="fuImage">商品图片:</label>
            <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
            <asp:Image ID="imgCurrentImage" runat="server" CssClass="imageClass img-responsive" />
        </div>
        <asp:Button ID="btnUpdate" runat="server" Text="修改商品" OnClick="btnUpdate_Click" CssClass="btn btn-primary" />
        <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" CssClass="btn btn-secondary" CausesValidation="False" />
    </div>
    </div>
</asp:Content>