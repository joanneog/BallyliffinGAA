<%@ Page Title="Matches Edit" MasterPageFile="~/Admin/AdminMaster.master" Language="C#"
    AutoEventWireup="true" CodeBehind="Matches_Edit.aspx.cs" Inherits="Ballyliffin_Gaa.Matches_Edit" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
    <meta name="confirm" content="true" />
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Edit Match
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <div class="editPageToolbar">
                        <asp:Button ID="btnBack" runat="server" ToolTip="Cancel & Go Back" CssClass="backbtn"
                            CausesValidation="false" TabIndex="1" />
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="custombtng" Width="80px"
                            TabIndex="40" />
                    </div>
                    <div style="width: 100%; padding: 7px;">
                        <table cellpadding="3" cellspacing="0" class="editForm">
                            <tr>
                                <td class="editPageTitleCell">
                                    Home Team<span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_HomeTeam" runat="server" DataSourceID="sqlDS_Teams" DataTextField="TeamDesc"
                                        DataValueField="TeamID" AppendDataBoundItems="true">
                                        <asp:ListItem Value="" Text="-Select-"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlDS_Teams" runat="server" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                                        SelectCommand="SELECT TeamDesc, TeamID FROM Teams WHERE (IsDeleted = 0)"></asp:SqlDataSource>
                                    <asp:RequiredFieldValidator ID="reqVal_HomeTeam" runat="server" ErrorMessage="!"
                                        ControlToValidate="ddl_HomeTeam" SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Home Team Score
                                </td>
                                <td>
                                    <telerik:RadNumericTextBox ID="num_HomeScore" runat="server" CausesValidation="true"
                                        EnableViewState="false" Culture="en-IE" MinValue="0" Width="70px">
                                    </telerik:RadNumericTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Away Team<span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_AwayTeam" runat="server" DataSourceID="sqlDS_Teams" DataTextField="TeamDesc"
                                        DataValueField="TeamID" AppendDataBoundItems="true">
                                        <asp:ListItem Value="" Text="-Select-"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="reqVal_AwayTeam" runat="server" ErrorMessage="!"
                                        ControlToValidate="ddl_AwayTeam" SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Away Team Score
                                </td>
                                <td>
                                    <telerik:RadNumericTextBox ID="num_AwayTeamScore" runat="server" CausesValidation="true"
                                        EnableViewState="false" Culture="en-IE" MinValue="0" Width="70px">
                                    </telerik:RadNumericTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Referee <span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_Referee" runat="server" DataSourceID="sqlDS_Members" AppendDataBoundItems="true"
                                        DataTextField="MemberDesc" DataValueField="MemberID">
                                        <asp:ListItem Value="" Text="-Select-"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlDS_Members" runat="server" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                                        SelectCommand="SELECT Members.MemberID, Members.FirstName + ' ' + Members.LastName AS MemberDesc FROM Members INNER JOIN Roles ON Roles.RoleID = Members.RoleID WHERE (Members.IsDeleted = 0) AND (Roles.RoleID = 5)">
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Date
                                </td>
                                <td>
                                    <telerik:RadDateInput ID="date_match" TabIndex="1" runat="server" MinDate="1900-01-01"
                                        Width="90px" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" CausesValidation="True"
                                        Culture="en-IE" EmptyMessage="__/__/____" SelectionOnFocus="SelectAll" EnableViewState="false">
                                    </telerik:RadDateInput>
                                    <asp:RequiredFieldValidator ID="reqVal_Date" runat="server" ErrorMessage="!" ControlToValidate="date_match"
                                        SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Venue <span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_Venue" runat="server" DataSourceID="sqlDS_Venues" AppendDataBoundItems="true"
                                        DataTextField="VenueDesc" DataValueField="VenueID">
                                        <asp:ListItem Value="" Text="-Select-"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlDS_Venues" runat="server" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                                        SelectCommand="SELECT VenueID, VenueDesc FROM Venues WHERE (IsDeleted = 0)">
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Played
                                </td>
                                <td>
                                    <asp:CheckBox ID="chk_IsPlayed" runat="server" TabIndex="3" />
                                    <img src="images/information.png" alt="" title="If the match has been played the score must be entered" />
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Delete
                                </td>
                                <td valign="bottom">
                                    <asp:CheckBox ID="chk_IsDeleted" runat="server" TabIndex="3" />
                                    <img src="images/information.png" alt="" title="If checked the record will not be shown in the System drop down lists" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="editPageToolbarBottmRel">
                        <asp:Button ID="btnSave2" runat="server" Text="Save" CssClass="custombtng" Width="80px"
                            TabIndex="40" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
