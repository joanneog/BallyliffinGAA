<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeBehind="Admin_Edit.aspx.cs" Inherits="Ballyliffin_Gaa.Admin.Admin_Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="server">
 <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Edit Admin
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <div class="editPageToolbar">
                        <asp:Button ID="btnBack" runat="server" ToolTip="Cancel & Go Back" CssClass="backbtn" CausesValidation="false" TabIndex="1" />
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="custombtng" 
                            Width="80px" TabIndex="40" onclick="btnSave_Click" />
                        
                    </div>
                    <div style="width: 100%; padding: 7px;">
                        <table cellpadding="3" cellspacing="0" class="editForm">
                            <tr>
                                <td class="editPageTitleCell">
                                    Username<span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Username" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Email<span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Email" runat="server" Width="400px" MaxLength="200" TabIndex="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqVal_Email" runat="server" ErrorMessage="!" ControlToValidate="txt_Email"
                                        SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_Email"
                                        Display="Dynamic" CssClass="msgbox" ErrorMessage="Invalid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="editPageToolbarBottmRel">
                        <asp:Button ID="btnSave2" runat="server" Text="Save" CssClass="custombtng" Width="80px" TabIndex="40" onclick="btnSave_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



