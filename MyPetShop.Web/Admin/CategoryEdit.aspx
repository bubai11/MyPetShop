<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CategoryEdit.aspx.cs" Inherits="MyPetShop.Web.Admin.CategoryEdit" %>
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
    </style>
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
</asp:Content>