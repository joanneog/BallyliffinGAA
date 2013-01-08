<%@ Page Title="Match Add" MasterPageFile="~/Admin/AdminMaster.master" Language="C#" AutoEventWireup="true"
    CodeBehind="Matches_Add.aspx.cs" Inherits="Ballyliffin_Gaa.Matches_Add" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
    <meta name="confirm" content="true" />
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Add a new Match
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
                                    Home Team<span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_HomeTeam" runat="server" DataSourceID="sqlDS_Teams" DataTextField="TeamDesc"
                                        DataValueField="TeamID" AppendDataBoundItems="true">
                                        <asp:ListItem Value="" Text="-Select-"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlDS_Teams" runat="server" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                                        SelectCommand="sp_Teams_ShortView" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="false">
                                        <SelectParameters>
                                            <asp:Parameter Name="TeamID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:RequiredFieldValidator ID="reqVal_HomeTeam" runat="server" ErrorMessage="!"
                                        ControlToValidate="ddl_HomeTeam" SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
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
                                    Referee <span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_Referee" runat="server" DataSourceID="sqlDS_Members" AppendDataBoundItems="true"
                                        DataTextField="MemberDesc" DataValueField="MemberID">
                                        <asp:ListItem Value="" Text="-Select-"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource CancelSelectOnNullParameter="False" ID="sqlDS_Members" 
                                        runat="server" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                                        
                                        SelectCommand="SELECT Members.MemberID, Members.FirstName + ' ' + Members.LastName AS MemberDesc FROM Members INNER JOIN Roles ON Roles.RoleID = Members.RoleID WHERE (Members.IsDeleted = 0) AND (Roles.RoleID = 1)">
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
                                        Culture="en-IE" EmptyMessage="__/__/____" SelectionOnFocus="SelectAll">
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
                                        SelectCommand="sp_Venues_ShortView" CancelSelectOnNullParameter="false" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter Name="VenueID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
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
