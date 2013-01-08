<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true"
    CodeBehind="Admin_Add.aspx.cs" Inherits="Ballyliffin_Gaa.Admin.Admin_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="server">
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Add a new Administrator
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <div class="editPageToolbar">
                        <asp:Button ID="btnBack" runat="server" ToolTip="Cancel & Go Back" CssClass="backbtn"
                            CausesValidation="false" TabIndex="1" />
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="custombtng" Width="80px"
                            TabIndex="40" OnClick="btnSave_Click" />
                    </div>
                    <div style="width: 100%; padding: 7px;">
                        <table cellpadding="3" cellspacing="0" class="editForm">
                            <tr>
                                <td class="editPageTitleCell">
                                    Username<span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Username" runat="server" Width="400px" MaxLength="200" TabIndex="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqVal_username" runat="server" ErrorMessage="!"
                                        ControlToValidate="txt_Username" SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Password<span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Password" TextMode="Password" runat="server" Width="400px" MaxLength="200"
                                        TabIndex="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqVal_password" runat="server" ErrorMessage="!"
                                        ControlToValidate="txt_Password" SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_Password"
                                        Display="Dynamic" CssClass="msgbox" ErrorMessage="Password must be at least 6 characters long and or made up of at least 1 letter and 1 number"
                                        ValidationExpression="^(?=.*\d)(?=.*[a-zA-Z]).{6,30}$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Confirm Password<span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ConfirmPassword" runat="server" Width="400px" MaxLength="200"
                                        TabIndex="1" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqVal_ConfirmPassword" runat="server" ErrorMessage="!"
                                        ControlToValidate="txt_ConfirmPassword" SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_Password"
                                        ControlToValidate="txt_ConfirmPassword" CssClass="msgbox" Display="Dynamic" ErrorMessage="Must match password inserted above"></asp:CompareValidator>
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
                        <asp:Button ID="btnSave2" OnClick="btnSave_Click" runat="server" Text="Save" CssClass="custombtng"
                            Width="80px" TabIndex="40" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
