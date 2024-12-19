<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="SubmitCart.aspx.cs" Inherits="MyPetShop.Web.Pages.SubmitCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ProName" HeaderText="商品名称" />
                    <asp:BoundField DataField="ListPrice" HeaderText="单价" DataFormatString="{0:C2}" />
                    <asp:TemplateField HeaderText="数量">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("Qty") %>' Width="50px" OnTextChanged="txtQty_TextChanged" AutoPostBack="true"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TotalPrice" HeaderText="小计" DataFormatString="{0:C2}" />
                    <asp:CommandField HeaderText="操作" ShowSelectButton="True" ControlStyle-CssClass="btn-select" />
                    <asp:CommandField HeaderText="删除" ControlStyle-CssClass="btn-delete" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnUpdate" runat="server" Text="更新购物车" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnClear" runat="server" Text="清空购物车" OnClick="btnClear_Click" />
            <asp:Button ID="btnCheckout" runat="server" Text="结算" OnClick="btnCheckout_Click" />
            <asp:Label ID="lblMessage" runat="server" />
        </div>
    </form>
</asp:Content>