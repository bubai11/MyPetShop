<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AutoShow.ascx.cs" Inherits="MyPetShop.Web.Controls.AutoShow" %>
<style>
    .autoshow{
        float:right;
        width:750px;
        margin-right: 60px;
    }
    .title-container {
        text-align: center;
        margin-bottom: 20px;
    }
    .title-container h2 {
        font-family:STCaiyun;
        font-size: 40px;
        color: #333;
        margin: 0;
        display: inline-block;
        position: relative;
        font-weight: bold;
    }
    .title-container img {
        vertical-align: middle;
        margin-left: 10px;
        width: 150px; /* 根据实际图片大小调整 */
        height: auto; /* 保持图片比例 */
    }
</style>
<asp:ScriptManager ID="ScriptManager1" runat="server" />
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="title-container">
            <h2>欢迎来到宠物商店！</h2>
            <img src="../Images/autoshow.gif" alt="热销商品推荐" />
        </div>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false" />

        <asp:GridView ID="gvProducts" runat="server" CssClass="table table-striped autoshow" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="图片">
                    <ItemTemplate>
                        <img src='<%# ResolveUrl(Eval("Image").ToString()) %>' alt="商品图片" style="width: 100px; height: 100px;" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ProductId" HeaderText="商品编号" />
                <asp:BoundField DataField="Name" HeaderText="商品名称" />
                <asp:BoundField DataField="ListPrice" HeaderText="商品价格" DataFormatString="{0:C}" />
                <asp:BoundField DataField="UnitCost" HeaderText="单位成本" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Descn" HeaderText="商品描述" />
                <asp:BoundField DataField="Qty" HeaderText="库存" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:Button ID="btnAddToCart" runat="server" Text="放入购物车" CommandArgument='<%# Eval("ProductId") %>' OnClick="AddToCart_Click" CssClass="btn btn-primary" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
    </Triggers>
</asp:UpdatePanel>

<asp:Timer ID="Timer1" runat="server" Interval="3000" OnTick="Timer1_Tick" />
<asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>
        <div>加载中...</div>
    </ProgressTemplate>
</asp:UpdateProgress>
