<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SiteToolbar.ascx.cs" Inherits="SiteToolbar" %>
<%@ OutputCache Duration="300" VaryByParam="none"  %>
<div class="sitetoolbarholder" >
        
    <div style="padding-right: 15px; font-size: 11px; color:#ffffff; position: fixed; margin-top:1%; right:10px; ">
    
            <asp:LoginName ID="LoginName1" runat="server"  FormatString="Logged in as {0}" />
    &nbsp;&nbsp;|&nbsp;&nbsp;
        <asp:LoginStatus ID="LoginStatus1" runat="server" ForeColor="#E1F0FF" LogoutAction="Redirect" LogoutPageUrl="~/login.aspx"/>&nbsp;&nbsp;
    </div>
    <div id="topmenu" style="padding-left:80px;">
        <div style="padding: 4px 0px 0px 10px;">
        <div style="display:block; height:28px;"></div>
            <asp:HyperLink ID="l_Home" NavigateUrl="~/index.aspx" runat="server">Home</asp:HyperLink>&nbsp; &nbsp;
            <asp:HyperLink ID="l_Dsh" NavigateUrl="~/Admin/Default.aspx" runat="server">Dashboard</asp:HyperLink>&nbsp; &nbsp;
            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Admin/Administrator_Management.aspx" runat="server">Admin Management</asp:HyperLink>&nbsp; &nbsp;
            
            
        </div>
    </div>
    <div style="clear: both">
    </div>
</div>
