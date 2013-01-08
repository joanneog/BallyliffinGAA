<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true"
    CodeBehind="Administrator_Management.aspx.cs" Inherits="Ballyliffin_Gaa.Admin.Administrator_Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="server">
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Administrators
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <div class="editPageToolbar">
                        <asp:Button ID="btnBack" runat="server" ToolTip="Back" CssClass="backbtn" CausesValidation="false"
                            TabIndex="1" />
                        <asp:Button ID="btn_Add" runat="server" Text="+ Add" CssClass="custombtng" Width="80px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_Refresh" runat="server" Text="Refresh" CssClass="custombtn" Width="80px" />
                    </div>
                    <div class="paddedContentBox">
                        <telerik:RadGrid ID="grid_admins" PageSize="20" runat="server" AllowPaging="True"
                            ShowStatusBar="True" GridLines="None" Width="100%" AllowSorting="True" OnDeleteCommand="Admin_Delete"
                            OnEditCommand="Admin_Edit">
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="false" Font-Names="Arial" AllowFilteringByColumn="true">
                                <Columns>
                                    <telerik:GridTemplateColumn DataField="IsApproved" HeaderText="Active" SortExpression="IsApproved"
                                        UniqueName="IsApproved" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Image runat="server" ID="img_IsApproved" ImageUrl="~/images/Ok.gif" Visible='<%# Eval("IsApproved") %>' />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Username" DataField="UserName" SortExpression="UserName"
                                        UniqueName="UserName" AllowFiltering="false" HeaderStyle-Font-Bold="true">
                                        <ItemTemplate>
                                            <%# Eval("Username") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Email" DataField="Email" SortExpression="Email"
                                        UniqueName="Email" AllowFiltering="false" HeaderStyle-Font-Bold="true">
                                        <ItemTemplate>
                                            <%# Eval("Email") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Password" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="img_password" runat="server" ToolTip="Change Password..." CausesValidation="false"
                                                CommandArgument='<%# Eval("Username") %>' ImageUrl="images/Unlock.png" OnCommand="Admin_ChangePassword">
                                            </asp:ImageButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Edit" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="img_Edit" runat="server" ToolTip="Edit..." CausesValidation="false"
                                                CommandName="Edit" CommandArgument='<%# Eval("Username") %>' ImageUrl="images/Edit_btn.gif">
                                            </asp:ImageButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Delete" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="img_Delete" runat="server" CausesValidation="false" CommandName="Delete"
                                                OnClientClick="return confirm('Are you sure you want to delete this record?');"
                                                Text="Delete" ImageUrl="~/Images/Delete_btn.gif" ToolTip="Delete this record"
                                                CommandArgument='<%# Eval("Username") %>'></asp:ImageButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView></telerik:RadGrid>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
