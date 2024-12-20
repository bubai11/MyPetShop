<%@ Page Title="创建订单" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="SubmitCart.aspx.cs" Inherits="MyPetShop.Web.Pages.SubmitCart" %>
<%@ Register Src="../Controls/PetTree.ascx" TagName="PetTree" TagPrefix="uc" %>  
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
     display: flex;  
     justify-content: center;
     align-items:center;
     flex-flow:column wrap;
 }  
 .form-group>input{
     width: 400px;
    height: 30px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
}

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.error-message {
    color: red;
    font-size: 0.9em;
}

.validation-summary {
    color: red;
    margin-bottom: 15px;
}

.btn {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
    font-size: 1em;
}

.btn-primary {
    background-color: #007bff;
}

.status-label {
    margin-top: 15px;
}
</style> 
    <div class="search-container">  
    <div class="search-sidebar">  
        <h3>分类商品</h3>  
        <uc:PetTree ID="PetTree" runat="server" />  
    </div>  
    <!-- 右侧结果 -->  
    <div class="search-main"> 
    <h3>填写发货地址</h3>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" CssClass="validation-summary" />
    <fieldset>
        <div class="form-group">
            <label for="Addr1">送货地址:</label>
            <asp:TextBox ID="Addr1" runat="server"  CssClass="form-control"  Placeholder="请输入送货地址"/>
            <asp:RequiredFieldValidator ID="Addr1Required" runat="server" ControlToValidate="Addr1" ErrorMessage="送货地址必填！" CssClass="error-message" />
        </div>
        <div class="form-group">
            <label for="Addr2">发票寄送地址:</label>
            <asp:TextBox ID="Addr2" runat="server" CssClass="form-control" Placeholder="请输入发票寄送地址" />
            <asp:RequiredFieldValidator ID="Addr2Required" runat="server" ControlToValidate="Addr2" ErrorMessage="发票寄送地址必填！" CssClass="error-message" />
        </div>
        <div class="form-group">
            <label for="City">城市:</label>
            <asp:TextBox ID="City" runat="server" CssClass="form-control"  Placeholder="请输入城市"/>
            <asp:RequiredFieldValidator ID="CityRequired" runat="server" ControlToValidate="City" ErrorMessage="城市必填！" CssClass="error-message" />
        </div>
        <div class="form-group">
            <label for="State">省份:</label>
            <asp:TextBox ID="State" runat="server" CssClass="form-control"  Placeholder="请输入省份"/>
            <asp:RequiredFieldValidator ID="StateRequired" runat="server" ControlToValidate="State" ErrorMessage="省份必填！" CssClass="error-message" />
        </div>
        <div class="form-group">
            <label for="Zip">邮编:</label>
            <asp:TextBox ID="Zip" runat="server" CssClass="form-control"  Placeholder="请输入邮编"/>
            <asp:RequiredFieldValidator ID="ZipRequired" runat="server" ControlToValidate="Zip" ErrorMessage="邮编必填！" CssClass="error-message" />
        </div>
        <div class="form-group">
            <label for="Phone">联系电话:</label>
            <asp:TextBox ID="Phone" runat="server" CssClass="form-control"  Placeholder="请输入联系电话"/>
            <asp:RequiredFieldValidator ID="PhoneRequired" runat="server" ControlToValidate="Phone" ErrorMessage="联系电话必填！" CssClass="error-message" />
        </div>
    </fieldset>
    <asp:Button ID="SubmitOrderButton" runat="server" Text="提交结算" OnClick="SubmitOrderButton_Click" CssClass="btn btn-primary" />
    <asp:Label ID="OrderStatusLabel" runat="server" CssClass="status-label" />
        </div></div>
<script>
    //function scrollToBottom() {
    //    // 使用window.scrollTo方法滚动到页面底部
    //    // 0, 0表示滚动到页面的垂直和水平位置
    //    document.querySelector('.index').scrollTop=document.querySelector('.index').scrollHeight;
    //}
</script>
</asp:Content>