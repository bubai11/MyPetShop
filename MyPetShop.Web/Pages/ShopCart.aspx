<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ShopCart.aspx.cs" Inherits="MyPetShop.Web.Pages.ShopCart" %>
<%@ Register TagPrefix="uc" TagName="PetTree" Src="~/Controls/PetTree.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>  
  .search-container {  
      display: flex;  
      justify-content: space-between; /* Aligns the sidebar and main content side by side */  
      width: 100%;  
  }  

  .search-sidebar {  
      width: 30%; /* Adjust this width as necessary */  
      padding: 10px;  
      border-right: 1px solid #ccc; /* Optional: adds a separator */  
  }  

  .search-main {  
      width: 70%; /* Adjust this width as necessary */  
      padding: 10px;  
  }  
 </style> 
    <div class="search-container">  
    <!-- 左侧分类 -->  
    <div class="search-sidebar">  
        <h3>分类商品</h3>  
        <uc:PetTree ID="PetTree" runat="server" />  
    </div>  
    <!-- 右侧结果 -->  
    <div class="search-main">  
    <div class="cart-container">  
            <div class="cart-title">购物车</div>  

            <!-- 购物车商品列表 -->  
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProId,CartItemId" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand">
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
    </div>
    </div>
</asp:Content>
