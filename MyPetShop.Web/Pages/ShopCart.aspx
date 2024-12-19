<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ShopCart.aspx.cs" Inherits="MyPetShop.Web.Pages.ShopCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cart-container">  
            <div class="cart-title">购物车</div>  

            <!-- 购物车商品列表 -->  
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="ProName" HeaderText="商品名称" />
                    <asp:BoundField DataField="ListPrice" HeaderText="单价" DataFormatString="{0:C2}" />
                    <asp:TemplateField HeaderText="购买数量">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("Qty") %>' Width="50px" OnTextChanged="txtQty_TextChanged" AutoPostBack="true"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:Button ID="btnSelect" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" Text="选择" />
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" CommandArgument="<%# Container.DataItemIndex %>" Text="删除" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <!-- 错误提示标签 -->
            <asp:Label ID="lblError" runat="server" Text="温馨提示：更改购买数量后，请单击重新计算按钮进行更新！" CssClass="lbl-error" />

            <!-- 操作按钮 -->
            <div class="cart-buttons">
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
</asp:Content>
