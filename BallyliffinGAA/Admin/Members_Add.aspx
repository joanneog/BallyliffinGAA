﻿<%@ Page Title="Members Add" MasterPageFile="~/Admin/AdminMaster.master" Language="C#"
    AutoEventWireup="true" CodeBehind="Members_Add.aspx.cs" Inherits="Ballyliffin_Gaa.Members_Add" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
    <meta name="confirm" content="true" />
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Add a new Member
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
                                    First Name <span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_FirstName" runat="server" Width="200px" MaxLength="200" TabIndex="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqVal_FirstName" runat="server" ErrorMessage="!"
                                        ControlToValidate="txt_FirstName" SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Last Name <span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_LastName" runat="server" Width="200px" MaxLength="200" TabIndex="1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqVal_LastName" runat="server" ErrorMessage="!"
                                        ControlToValidate="txt_LastName" SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Email Address
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Email" runat="server" Width="200px" MaxLength="200" TabIndex="1"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Phone Number
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Phone" runat="server" Width="200px" MaxLength="200" TabIndex="1"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Team
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_Team" runat="server" DataSourceID="sqlDS_Teams" DataTextField="TeamDesc"
                                        DataValueField="TeamID" AppendDataBoundItems="true">
                                        <asp:ListItem Value="" Text="-Select-"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlDS_Teams" runat="server" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                                        SelectCommand="SELECT TeamDesc, TeamID FROM Teams WHERE (IsDeleted = 0)"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Role <span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_Roles" runat="server" DataSourceID="sqlDS_Roles" AppendDataBoundItems="true" DataTextField="RoleDesc"
                                        DataValueField="RoleID"><asp:ListItem Value="" Text="-Select-"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlDS_Roles" runat="server" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                                        SelectCommand="SELECT RoleDesc, RoleID FROM Roles WHERE (IsDeleted = 0)"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Date of Birth
                                </td>
                                <td>
                                    <telerik:RadDateInput ID="date_DOB" TabIndex="1" runat="server" MinDate="1900-01-01"
                                        Width="70px" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" CausesValidation="True"
                                        Culture="en-IE" EmptyMessage="__/__/____" SelectionOnFocus="SelectAll">
                                    </telerik:RadDateInput>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Date Joined <span class="req_asterisk"></span>
                                </td>
                                <td>
                                    <telerik:RadDateInput ID="date_Joined" TabIndex="1" runat="server" MinDate="1900-01-01"
                                        Width="70px" DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" CausesValidation="True"
                                        Culture="en-IE" EmptyMessage="__/__/____" SelectionOnFocus="SelectAll">
                                    </telerik:RadDateInput>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="!"
                                        ControlToValidate="txt_LastName" SetFocusOnError="True"><img alt="Required" title="Required" src="images/redbox_required.gif" /></asp:RequiredFieldValidator>
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
