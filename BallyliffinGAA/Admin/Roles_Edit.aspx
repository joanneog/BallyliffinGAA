<%@ Page Title="Roles Edit" MasterPageFile="~/Admin/AdminMaster.master" Language="C#" AutoEventWireup="true" CodeBehind="Roles_Edit.aspx.cs" Inherits="Ballyliffin_Gaa.Roles_Edit" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server"><meta name="confirm" content="true" />
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Edit Role
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <div class="editPageToolbar">
                        <asp:Button ID="btnBack" runat="server" ToolTip="Cancel & Go Back" CssClass="backbtn" CausesValidation="false" TabIndex="1" />
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="custombtng" Width="80px" TabIndex="40" />
                    </div>
                    <div style="width: 100%; padding: 7px;">
                        <table cellpadding="3" cellspacing="0" class="editForm">
                            <tr>
                                <td class="editPageTitleCell">
                                    Role <span class="req_asterisk"></span>
                                </td>
                                <td >
                                    <asp:TextBox ID="txt_RoleDesc" runat="server" Width="400px" MaxLength="200" TabIndex="1"></asp:TextBox>
									<asp:RequiredFieldValidator ID="reqVal_RoleDesc" runat="server" ErrorMessage="!" ControlToValidate="txt_RoleDesc" SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                            <td class="editPageTitleCell">
                            Delete
                            </td>
                            
                                <td valign="bottom">
                                    <asp:CheckBox ID="chk_IsDeleted" runat="server" Text="Deleted" TabIndex="3" />
                                    <span class="smallInfoPrint">If checked the record will not be shown in the System drop down lists</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="editPageToolbarBottmRel">
                        <asp:Button ID="btnSave2" runat="server" Text="Save" CssClass="custombtng" Width="80px" TabIndex="40" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

