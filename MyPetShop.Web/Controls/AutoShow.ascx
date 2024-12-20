<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AutoShow.ascx.cs" Inherits="MyPetShop.Web.UserControls.AutoShow" %>
<asp:ScriptManager ID="ScriptManager1" runat="server" />
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:GridView ID="gvHotProducts" runat="server" CssClass="table table-striped" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ProductId" HeaderText="编号" />
                <asp:BoundField DataField="Name" HeaderText="商品名称" />
                <asp:BoundField DataField="ListPrice" HeaderText="价格" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Qty" HeaderText="库存" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkBuy" runat="server" Text="购买" 
                                       NavigateUrl='<%# "Cart.aspx?productId=" + Eval("ProductId") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
    </Triggers>
</asp:UpdatePanel>
<asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="Timer1_Tick" />
<asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>
        <div>加载中...</div>
    </ProgressTemplate>
</asp:UpdateProgress>
<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <!-- 进度条控件，加载时显示 -->
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
                <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 100%"></div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>

        <!-- GridView 用于展示热销商品 -->
        <asp:GridView ID="gvHotProducts" runat="server" AutoGenerateColumns="False" EmptyDataText="No hot products available" Width="100%" CssClass="table table-striped">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Product Name" SortExpression="Name" />
                <asp:BoundField DataField="ListPrice" HeaderText="Price" SortExpression="ListPrice" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Descn" HeaderText="Description" SortExpression="Descn" />
                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" >
                    <ItemTemplate>
                        <img src='<%# Eval("Image") %>' alt="Product Image" width="50" height="50" />
                    </ItemTemplate>
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </ContentTemplate>
</asp:UpdatePanel>--%>

<!-- 定时器控件，3秒自动切换 -->
<%--<asp:Timer ID="Timer1" runat="server" Interval="3000" OnTick="Timer1_Tick" />--%>
