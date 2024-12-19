<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShopCart.aspx.cs" Inherits="MyPetShop.ShopCart" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>购物车</title>
    <style>
        .cart-container {
            width: 80%;
            margin: 20px auto;
            font-family: Arial, sans-serif;
        }
        .cart-title {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
        .cart-buttons {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }
        .cart-message {
            margin-top: 20px;
            color: #f00;
            font-weight: bold;
        }
        .lbl-error {  
            color: #f60; /* 设置不同的颜色以突出显示提示信息 */  
            font-weight: bold;  
        }  
    </style>
</head>
<body>
    <form id="form1" runat="server">  
        <div class="cart-container">  
            <div class="cart-title">购物车</div>  

            <!-- 购物车商品列表 -->  
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">  
                <Columns>  
                    <!-- 商品名称 -->  
                    <asp:BoundField DataField="ProName" HeaderText="商品名称" />  

                    <!-- 商品单价 -->  
                    <asp:BoundField DataField="ListPrice" HeaderText="单价" DataFormatString="{0:C2}" />  

                    <!-- 商品数量 -->  
                    <asp:TemplateField HeaderText="购买数量">  
                        <ItemTemplate>  
                            <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("Qty") %>' Width="50px"   
                                         OnTextChanged="txtQty_TextChanged" AutoPostBack="true"></asp:TextBox>  
                        </ItemTemplate>  
                    </asp:TemplateField>  

                    <!-- 小计 -->  
                    <asp:BoundField DataField="TotalPrice" HeaderText="小计" DataFormatString="{0:C2}" />  

                    <!-- 操作按钮 -->
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <!-- Select 按钮 -->
                            <asp:Button ID="btnSelect" runat="server" CommandName="Select" 
                                        CommandArgument="<%# Container.DataItemIndex %>" Text="选择" />
                
                            <!-- Delete 按钮 -->
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" 
                                        CommandArgument="<%# Container.DataItemIndex %>" Text="删除" />
                        </ItemTemplate>
                    </asp:TemplateField>                </Columns>  
            </asp:GridView>  

            <!-- 错误提示标签 -->  
            <asp:Label ID="lblError" runat="server" Text="温馨提示：更改购买数量后，请单击重新计算按钮进行更新！" CssClass="lbl-error" />  

            <!-- 操作按钮 -->  

            <div class="cart-buttons">  
                <%--<asp:Button ID="btnUpdate" runat="server" Text="重新计算" OnClick="btnUpdate_Click" CssClass="btn-update" />--%>  
                <%--<asp:Button ID="btnDeleteSelected" runat="server" Text="删除所选商品" OnClick="btnDeleteSelected_Click" CssClass="btn-delete-selected" />--%>  
                <asp:Button ID="btnClear" runat="server" Text="清空购物车" OnClick="btnClear_Click" CssClass="btn-clear" />  
                <asp:Button ID="btnCheckout" runat="server" Text="结算" OnClick="btnCheckout_Click" CssClass="btn-checkout" />  
            </div>  

            <!-- 提示信息 -->  
            <div class="cart-message">  
                <asp:Label ID="lblTotalPrice" runat="server" Text="总价：" CssClass="lbl-total" />  
                <br />  
                <asp:Label ID="lblCart" runat="server" CssClass="lbl-message" />  
            </div>  
        </div>  
    </form>  
</body>
</html>