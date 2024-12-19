<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="MyPetShop.Web.Pages.OrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
</asp:Content>
