<%@ Page Title="News Add" MasterPageFile="~/Admin/AdminMaster.master" Language="C#" AutoEventWireup="true"
    CodeBehind="News_Add.aspx.cs" Inherits="Ballyliffin_Gaa.News_Add" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
    <meta name="confirm" content="true" />
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Add a News Item
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <div class="editPageToolbar">
                        <asp:Button ID="btnBack" runat="server" ToolTip="Cancel & Go Back" CssClass="backbtn"
                            CausesValidation="false" TabIndex="1" />
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="custombtng" Width="80px"
                            TabIndex="40" onclick="btnSave_Click" />
                    </div>
                    <div style="width: 100%; padding: 7px;">
                        <table cellpadding="3" cellspacing="0" class="editForm">
                            <tr>
                                <td class="editPageTitleCell">
                                    HeadLine <span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Headline" runat="server" Width="400px" MaxLength="200" TabIndex="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqVal_HeadlineDesc" runat="server" ErrorMessage="!"
                                        ControlToValidate="txt_Headline" SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Story
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Story" runat="server" Width="400px" Height="100px" TextMode="MultiLine"
                                        TabIndex="1"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Date <span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <telerik:RadDateInput ID="date_NewsDate" runat="server" DateFormat="dd/mm/yyyy" DisplayDateFormat="dd/mm/yyyyy"
                                        Culture="en-IE" MinDate="1900-01-01" EmptyMessage="__/__/____">
                                    </telerik:RadDateInput>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="editPageToolbarBottmRel">
                        <asp:Button ID="btnSave2" runat="server" Text="Save" CssClass="custombtng" Width="80px"
                             TabIndex="40" onclick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
