<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true"
    CodeBehind="NewsLetter.aspx.cs" Inherits="Ballyliffin_Gaa.Admin.NewsLetter" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="server">
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
    
    
    <asp:Button CssClass="GenerateEmail" ID="btnSend" runat="server"
        Text="Send Newsletter" onclick="btnSend_Click" Visible="false" />

    <div class="InfoContainer" runat="server" id="divInfo">
        The News Letter will contain all news stories from the past week. Once you click
        generate a preview will be displayed. A button will also appear to allow you to
        send it. This will send it to all members who have signed up to receive the news
        letter.
        <br />
        <asp:Button CssClass="GenerateEmail" ID="btnGenerate" runat="server" 
            Text="Generate Newsletter" onclick="btnGenerate_Click" />
    </div>
    <telerik:RadEditor ID="txt_Body" runat="server" Skin="Default" Width="99%" Height="640px"
        Font-Names="Arial" EnableViewState="false" Visible="false" ToolsFile="~/Admin/SomeTools.xml">
        <Content>
        
        </Content>
    </telerik:RadEditor>
</asp:Content>
