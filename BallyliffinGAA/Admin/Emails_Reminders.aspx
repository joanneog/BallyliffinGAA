<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeBehind="Emails_Reminders.aspx.cs" Inherits="Ballyliffin_Gaa.Admin.Emails_Reminders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <style type="text/css">
        .InfoContainer
        {
            background-color: #ffc;
            border: 1px solid #ccc;
            margin: auto;
            padding: 100px;
            width: 300px;
            font-size: 15px;
            font-family: Arial;
            font-style: italic;
        }
    </style>
</asp:Content>
<asp:content id="Content3" contentplaceholderid="PageContentPlaceHolder" runat="server">
    <telerik:RadAjaxManager EnableViewState="False" ID="AjaxManager1" runat="server"
        DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
         <telerik:AjaxSetting AjaxControlID="btnGenerate">
            <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="btnSend" />
                    <telerik:AjaxUpdatedControl ControlID="divInfo" />
                    <telerik:AjaxUpdatedControl ControlID="btnGenerate" />
                    <telerik:AjaxUpdatedControl ControlID="txt_Body" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
    </telerik:RadAjaxLoadingPanel>
    
    
    
    <div class="InfoContainer" runat="server" id="divInfo">
    <asp:label id="lbl_lastSent" runat="server"></asp:label>
        <br /><br />
        An email will be sent to all members who are involved in fixtures over the next week.
        The Email will contain all the relevant information about the fixture.
<br />
        <asp:Button CssClass="GenerateEmail" ID="btnSend" runat="server"
        Text="Send Reminders" onclick="btnSend_Click" />
    </div>
</asp:content>
