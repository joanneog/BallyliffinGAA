<%@ Page Title="Teams Edit" MasterPageFile="~/Admin/AdminMaster.master" Language="C#" AutoEventWireup="true"
    CodeBehind="Teams_Edit.aspx.cs" Inherits="Ballyliffin_Gaa.Teams_Edit" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
    <meta name="confirm" content="true" />
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Edit Team
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
                        <asp:Label ID="lbl_Msg" runat="server" EnableViewState="false" CssClass="msgbox" Visible="false"></asp:Label>
                    </div>
                    <div style="width: 100%; padding: 7px;">
                        <table cellpadding="3" cellspacing="0" class="editForm">
                            <tr>
                                <td class="editPageTitleCell">
                                    Team <span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_TeamDesc" runat="server" Width="400px" MaxLength="200" TabIndex="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqVal_TeamDesc" runat="server" ErrorMessage="!"
                                        ControlToValidate="txt_TeamDesc" SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Division
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_Division" runat="server" DataSourceID="sqlDS_Divisions"
                                        DataTextField="DivisionDesc" DataValueField="DivisionID" AppendDataBoundItems="true">
                                        <asp:ListItem Value="" Text="-Select-"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlDS_Divisions" runat="server" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                                        SelectCommand="sp_Divisions_ShortView" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter Name="DivisionID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Manager
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_Manager" runat="server" DataSourceID="sqlDS_Managers" DataTextField="ManagerDesc"
                                        DataValueField="MemberID" AppendDataBoundItems="true">
                                        <asp:ListItem Value="" Text="-Select-"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlDS_Managers" runat="server" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                                        SelectCommand="SELECT Members.FirstName + ' ' + Members.LastName AS ManagerDesc, Members.MemberID FROM Members INNER JOIN Roles ON Members.RoleID = Roles.RoleID WHERE (Members.IsDeleted = 0) AND (Roles.RoleID = 2)">
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Our Team
                                </td>
                                <td valign="bottom">
                                    <asp:CheckBox ID="chk_IsOurs" runat="server" TabIndex="3" />
                                    <img src="images/information.png" alt="" title="Is it one of our teams or an opponent?" />
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
                    <div style="padding:7px; background-color:#F2F2F2">
                    <hr />
                    <h3 >Players</h3>
                    <hr /></div>
                    <div style="width: 100%; padding: 7px;">
                        <telerik:RadGrid ID="grid_Members" PageSize="20" runat="server" AllowPaging="True"
                            ShowStatusBar="True" GridLines="None" Width="98%" AllowSorting="True" DataSourceID="sqlDS_Members"
                            CellSpacing="0">
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="false" DataSourceID="sqlDS_Members" Font-Names="Arial"
                                AllowFilteringByColumn="true" DataKeyNames="TeamID">
                                <Columns>
                                    <telerik:GridTemplateColumn HeaderText="FirstName">
                                        <ItemTemplate>
                                            <%# Eval("FirstName") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="LastName">
                                        <ItemTemplate>
                                            <%# Eval("LastName")%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Email">
                                        <ItemTemplate>
                                            <%# Eval("EmailAddress") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Phone" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# Eval("PhoneNo") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Team">
                                        <ItemTemplate>
                                            <%# Eval("TeamDesc") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Role">
                                        <ItemTemplate>
                                            <%# Eval("RoleDesc") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="DOB" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# Eval("DOB","{0:d}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Joined" AllowFiltering="false">
                                        <ItemTemplate>
                                            <%# Eval("DateJoined","{0:d}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView></telerik:RadGrid>
                        <asp:SqlDataSource runat="server" ID="sqlDS_Members" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                            SelectCommand="SELECT Members.MemberID, Members.FirstName, Members.LastName, Members.EmailAddress, Members.PhoneNo, Members.TeamID, Members.RoleID, Members.DOB, Members.DateJoined, Members.IsDeleted, Members.MemberKey, Teams.TeamDesc, Roles.RoleDesc FROM Members INNER JOIN Roles ON Members.RoleID = Roles.RoleID INNER JOIN Teams ON Members.TeamID = Teams.TeamID Where TeamKey = @TeamKey">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="TeamKey" QueryStringField="key" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:HiddenField ID="h_timestamp" runat="server" />
                    </div>
                    <div class="editPageToolbarBottmRel">
                        <asp:Button ID="btnSave2" runat="server" Text="Save" CssClass="custombtng" Width="80px"
                            TabIndex="40" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
