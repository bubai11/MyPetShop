<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShopCart.aspx.cs" Inherits="MyPetShop.ShopCart" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>购物车</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="ProName" HeaderText="商品名称" />
                    <asp:BoundField DataField="ListPrice" HeaderText="单价" DataFormatString="{0:C2}" />
                    <asp:TemplateField HeaderText="数量">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("Qty") %>' Width="50px" OnTextChanged="txtQty_TextChanged"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TotalPrice" HeaderText="小计" DataFormatString="{0:C2}" />
                    <asp:CommandField HeaderText="操作" SelectButtonCaption="选择" ControlStyle-CssClass="btn-select" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="删除" DeleteButtonCaption="删除" ControlStyle-CssClass="btn-delete" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnUpdate" runat="server" Text="更新购物车" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnClear" runat="server" Text="清空购物车" OnClick="btnClear_Click" />
            <asp:Button ID="btnCheckout" runat="server" Text="结算" OnClick="btnCheckout_Click" />
            <asp:Label ID="lblMessage" runat="server" />
        </div>
    </form>
</body>
</html>