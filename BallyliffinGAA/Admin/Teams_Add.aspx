<%@ Page Title="Teams Add" MasterPageFile="~/Admin/AdminMaster.master" Language="C#" AutoEventWireup="true" CodeBehind="Teams_Add.aspx.cs" Inherits="Ballyliffin_Gaa.Teams_Add" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server"><meta name="confirm" content="true" />
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Add a new Team
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
                                    Team <span class="req_asterisk"></span>
                                </td>
                                <td >
                                    <asp:TextBox ID="txt_TeamDesc" runat="server" Width="400px" MaxLength="200" TabIndex="1"></asp:TextBox>
									<asp:RequiredFieldValidator ID="reqVal_TeamDesc" runat="server" ErrorMessage="!" ControlToValidate="txt_TeamDesc" SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
                                </td>
                            </tr> <tr>
                                <td class="editPageTitleCell">
                                    Division
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_Division" runat="server" DataSourceID="sqlDS_Divisions" DataTextField="DivisionDesc"
                                        DataValueField="DivisionID" AppendDataBoundItems="true">
                                        <asp:ListItem Value="" Text="-Select-"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlDS_Divisions" runat="server" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                                        SelectCommand="SELECT DivisionDesc, DivisionID FROM Divisions WHERE (IsDeleted = 0)"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <%--<tr>
                                <td class="editPageTitleCell">
                                    Manager
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_Manager" runat="server" DataSourceID="sqlDS_Managers" DataTextField="MemberDesc"
                                        DataValueField="MemberID" AppendDataBoundItems="true">
                                        <asp:ListItem Value="" Text="-Select-"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlDS_Managers" runat="server" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                                        SelectCommand="SELECT Members.FirstName + ' ' + Members.LastName AS MemberDesc, Members.MemberID FROM Members INNER JOIN Roles ON Members.RoleID = Roles.RoleID WHERE (Members.IsDeleted = 0) AND (Roles.RoleID = 2)">
                                    </asp:SqlDataSource>
                                </td>
                            </tr>--%>
                            <tr>
                                <td class="editPageTitleCell">
                                    Our Team
                                </td>
                                <td valign="bottom">
                                    <asp:CheckBox ID="chk_IsOurs" runat="server" TabIndex="3" />
                                    <img src="images/information.png" alt="" title="Is it one of our teams or an opponent?" />
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



