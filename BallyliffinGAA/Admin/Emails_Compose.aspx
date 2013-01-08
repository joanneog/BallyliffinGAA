<%@ Page Title="Compose Email" MasterPageFile="~/Admin/AdminMaster.master" Language="C#" AutoEventWireup="true" CodeBehind="Emails_Compose.aspx.cs" Inherits="Ballyliffin_Gaa.Emails_Compose" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server"><meta name="confirm" content="true" />
    <style type="text/css">
        .mailtable
        {
            width: 100%;
            background-color: #dfdfdf;
        }
        .titlecell
        {
            width: 80px;
        }
        
        .attachmentlink
        {
            display:block;
            margin-bottom:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Compose Email
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <div class="editPageToolbar">
                        <asp:Button ID="btnBack" runat="server" ToolTip="Back" CssClass="backbtn" CausesValidation="false"
                            TabIndex="1" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_Send" runat="server" Text="Send" CssClass="custombtng" 
                            Width="80px" onclick="btn_Send_Click"
                            />
                    </div>
                    <div class="paddedContentBox">
                        <table cellpadding="5" cellspacing="0" class="mailtable">
                            <tr>
                                <td valign="top" class="titlecell" align="right">
                                    To:
                                </td>
                                <td valign="top">
                                    <asp:TextBox ID="txt_To" runat="server" Width="300px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_To"
                                        ErrorMessage="!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="rvalSchedleDate0" runat="server" ErrorMessage="Please enter the recipient Email address"
                                        ControlToValidate="txt_To" SetFocusOnError="True">
                                        <img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ControlToValidate="txt_To" Display="Dynamic" 
                                        ErrorMessage="Invalid email address" SetFocusOnError="True" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" class="titlecell" align="right">
                                    Subject:
                                </td>
                                <td valign="top">
                                    <asp:TextBox ID="txt_Subject" runat="server" Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                            <td></td>
                                <td >
                                    <telerik:RadEditor ID="txt_Body" runat="server" Skin="Default" Width="99%" Height="640px"
                                        Font-Names="Arial" EnableViewState="false" ToolsFile="~/Admin/SomeTools.xml">
                                        <Content>
                                        </Content>
                                    </telerik:RadEditor>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
