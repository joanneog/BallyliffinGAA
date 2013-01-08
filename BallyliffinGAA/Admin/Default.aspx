<%@ Page Language="C#" Title="DashBoard" MasterPageFile="~/Admin/AdminMaster.master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ballyliffin_Gaa.Admin.Default" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
    <style type="text/css">
        
        </style>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="PageContentPlaceHolder" runat="Server">
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 style="position: relative;">
                Dashboard
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <table style="width: 100%;" cellpadding="5" cellspacing="0">
                        <tr>
                            <td valign="top" style="width: 100%;">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td valign="top" style="padding: 0px 15px 0px 0px; width:350px">
                                            <table cellpadding="5" cellspacing="0" class="Dash" width="100%">
                                                <tr>
                                                    <td valign="middle" align="left" class="headerCell" style="padding-left: 20px; width:60px; 
                                                        border-bottom: 1px solid #6e7070; border-right:none; text-align: left;">
                                                        <img alt="" src="images/Members.png" />
                                                    </td>
                                                    <td valign="middle" align="left" class="headerCell" style="padding: 0px;
                                                        font-size: 14px; border-bottom: 1px solid #6e7070; border-left:none; text-align: left;" colspan="2">
                                                        Members
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" valign="middle" class="tbl1cell2">
                                                        <asp:Button ID="btnMember" runat="server" PostBackUrl="~/Admin/Members_List.aspx?returnurl=Default.aspx"
                                                            CssClass="custombtng" Text="All Members" Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tbl1cell2" colspan="2">
                                                        <telerik:RadComboBox ID="ddl_Roles" runat="server" Height="120px" Width="238px" DropDownWidth="300px"
                                                            AppendDataBoundItems="true" AutoPostBack="True" EmptyMessage="Filter by Member Role"
                                                            HighlightTemplatedItems="true" EnableLoadOnDemand="true" OnItemsRequested="ddl_Roles_ItemsRequested"
                                                            OnSelectedIndexChanged="ddl_Roles_SelectedIndexChanged" CausesValidation="False"
                                                            EnableTextSelection="False" Filter="Contains" ItemsPerRequest="2">
                                                            <HeaderTemplate>
                                                                <table style="width: 280px" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td style="width: 240px;">
                                                                            Role
                                                                        </td>
                                                                        <td style="width: 40px; text-align: center;">
                                                                            Count
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <table style="width: 280px" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td style="width: 240px;">
                                                                            <%# DataBinder.Eval(Container, "Attributes['RoleDesc']")%>
                                                                        </td>
                                                                        <td style="width: 40px; text-align: center;">
                                                                            <%# DataBinder.Eval(Container, "Attributes['Total']")%>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                        </telerik:RadComboBox>
                                                        <asp:SqlDataSource ID="SqlDS_Roles" runat="server" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                                                            SelectCommand="sp_MembersByRole_ShortView" SelectCommandType="StoredProcedure">
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top" rowspan="2" style="padding: 0px 15px 0px 0px; width:350px">
                                            <table cellpadding="5" cellspacing="0" class="Dash" width="100%">
                                                <tr>
                                                <td class="headerCell" style="border-bottom: 1px solid #6e7070; border-right:none;"><img src="images/email.png" alt="email" /></td>

                                                    <td valign="middle" align="left" class="headerCell" style="padding: 8px 0px 5px 10px;
                                                        font-size: 16px; border-bottom: 1px solid #6e7070; text-align: left;" colspan="2">
                                                        General
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tbl1cell1">
                                                        <img src="images/email_compose.png" alt="compose" />
                                                    </td>
                                                    <td colspan="1" valign="middle" class="tbl1cell2">
                                                        <asp:Button ID="btnDivisions" runat="server" PostBackUrl="~/Admin/Divisions_List.aspx?returnurl=Default.aspx"
                                                            CssClass="custombtng" Text="Divisions" Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tbl1cell1">
                                                        <img src="images/teams.png" alt="sent" />
                                                    </td>
                                                    <td colspan="1" valign="middle" class="tbl1cell2">
                                                        <asp:Button ID="btnTeams" runat="server" PostBackUrl="~/Admin/Teams_List.aspx?returnurl=Default.aspx"
                                                            CssClass="custombtng" Text="Teams" Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tbl1cell1">
                                                        <img src="images/match.png" alt="sent" />
                                                    </td>
                                                    <td colspan="1" valign="middle" class="tbl1cell2">
                                                        <asp:Button ID="btnMatches" runat="server" PostBackUrl="~/Admin/Matches_List.aspx?returnurl=Default.aspx"
                                                            CssClass="custombtng" Text="Matches" Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tbl1cell1">
                                                        <img src="images/news_letter.png" alt="sent" />
                                                    </td>
                                                    <td colspan="1" valign="middle" class="tbl1cell2">
                                                        <asp:Button ID="btnNews" runat="server" PostBackUrl="~/Admin/News_List.aspx?returnurl=Default.aspx"
                                                            CssClass="custombtng" Text="News" Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tbl1cell1">
                                                        <img src="images/venue.jpg" alt="sent" />
                                                    </td>
                                                    <td colspan="1" valign="middle" class="tbl1cell2">
                                                        <asp:Button ID="btnVenues" runat="server" PostBackUrl="~/Admin/Venues_List.aspx?returnurl=Default.aspx"
                                                            CssClass="custombtng" Text="Venues" Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tbl1cell1">
                                                        <img src="images/news_letter.png" alt="sent" />
                                                    </td>
                                                    <td colspan="1" valign="middle" class="tbl1cell2">
                                                        <asp:Button ID="btnRoles" runat="server" PostBackUrl="~/Admin/Roles_List.aspx?returnurl=Default.aspx"
                                                            CssClass="custombtng" Text="Roles" Width="160px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td valign="top" rowspan="2" style="padding: 0px 15px 0px 0px; width:350px">
                                             <table cellpadding="5" cellspacing="0" class="Dash" width="100%">
                                                <tr>

                                                    <td valign="middle" align="left" class="headerCell" style="padding: 8px 0px 5px 10px;
                                                        font-size: 16px; border-bottom: 1px solid #6e7070; text-align: left;" colspan="2">
                                                        This Weeks Fixtures
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tbl1cell1" >
                           <telerik:RadGrid id="gridFixtures" runat="server" DataSourceID="sqlDS_Fixtures">
                                                          
                            <MasterTableView AutoGenerateColumns="false" DataSourceID="sqlDS_Fixtures" Font-Names="Arial"
                                AllowFilteringByColumn="false" ShowHeader="false">
                                <Columns>
                                    <telerik:GridBoundColumn HeaderText="TeamADesc" DataField="TeamADesc" SortExpression="TeamADesc" UniqueName="TeamADesc">
                                    </telerik:GridBoundColumn>
                                   
                                    <telerik:GridBoundColumn HeaderText="TeamBDesc" DataField="TeamBDesc" SortExpression="TeamBDesc" UniqueName="TeamBDesc">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="MatchDate" DataField="MatchDate" SortExpression="MatchDate" UniqueName="MatchDate">
                                    </telerik:GridBoundColumn>
                                   
                                    <telerik:GridBoundColumn HeaderText="VenueDesc" DataField="VenueDesc" SortExpression="VenueDesc" UniqueName="VenueDesc">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="RefereeName" DataField="RefereeName" SortExpression="RefereeName" UniqueName="RefereeName">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView></telerik:RadGrid>
                        <asp:SqlDataSource runat="server" ID="sqlDS_Fixtures" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                            SelectCommand="sp_Dash_MatchesThisWeek" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" style="padding: 10px 15px 0px 0px; width:350px">
                                            <table cellpadding="5" cellspacing="0" class="Dash">
                                                <tr>
                                                <td class="headerCell" style="border-bottom: 1px solid #6e7070; border-right:none;"><img src="images/email.png" alt="email" /></td>

                                                    <td valign="middle" align="left" class="headerCell" style="padding: 8px 0px 5px 10px;
                                                        font-size: 16px; border-bottom: 1px solid #6e7070; text-align: left;" colspan="2">
                                                        Emails
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tbl1cell1">
                                                        <img src="images/email_compose.png" alt="compose" />
                                                    </td>
                                                    <td colspan="1" valign="middle" class="tbl1cell2">
                                                        <asp:Button ID="btnCompose" runat="server" PostBackUrl="~/Admin/Emails_Compose.aspx?returnurl=Default.aspx"
                                                            CssClass="custombtng" Text="Compose" Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tbl1cell1">
                                                        <img src="images/email_sent.png" alt="sent" />
                                                    </td>
                                                    <td colspan="1" valign="middle" class="tbl1cell2">
                                                        <asp:Button ID="btnSent" runat="server" PostBackUrl="~/Admin/Emails_List.aspx?returnurl=Default.aspx"
                                                            CssClass="custombtng" Text="Sent Emails" Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tbl1cell1">
                                                        <img src="images/news.png" alt="sent" />
                                                    </td>
                                                    <td colspan="1" valign="middle" class="tbl1cell2">
                                                        <asp:Button ID="btnNewsletter" runat="server" PostBackUrl="~/Admin/NewsLetter.aspx?returnurl=Default.aspx"
                                                            CssClass="custombtng" Text="Send Newsletter" Width="160px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tbl1cell1">
                                                        <img src="images/email_sent.png" alt="sent" />
                                                    </td>
                                                    <td colspan="1" valign="middle" class="tbl1cell2">
                                                        <asp:Button ID="btnReminders" runat="server" PostBackUrl="~/Admin/Emails_Reminders.aspx?returnurl=Default.aspx"
                                                            CssClass="custombtng" Text="Send Reminders" Width="160px" />
                                                    </td>
                                                    </tr>
                                                <tr>
                                                    <td class="tbl1cell1">
                                                        <img src="images/email_in.png" alt="sent" />
                                                    </td>
                                                    <td colspan="1" valign="middle" class="tbl1cell2">
                                                        <asp:Button ID="btnMessages" runat="server" PostBackUrl="~/Admin/ContactUs_List.aspx?returnurl=Default.aspx"
                                                            CssClass="custombtng" Text="Messages" Width="160px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:content>
