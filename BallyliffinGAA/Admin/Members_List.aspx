<%@ Page Title="Members List" MasterPageFile="~/Admin/AdminMaster.master" Language="C#"
    AutoEventWireup="true" CodeBehind="Members_List.aspx.cs" Inherits="Ballyliffin_Gaa.Members_List" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
    <telerik:RadAjaxManager EnableViewState="False" ID="AjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btn_Refresh">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grid_Members" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="grid_Members">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grid_Members" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
    </telerik:RadAjaxLoadingPanel>
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Members
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <div class="editPageToolbar">
                        <asp:Button ID="btnBack" runat="server" ToolTip="Back" CssClass="backbtn" CausesValidation="false"
                            TabIndex="1" />
                        <asp:Button ID="btn_Add" runat="server" Text="+ Add" CssClass="custombtng" 
                            Width="80px" onclick="btn_Add_Click" /> &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_Refresh" runat="server" Text="Refresh" CssClass="custombtn" 
                            Width="80px" onclick="btn_Refresh_Click" />
                    </div>
                    <div class="paddedContentBox">
                        <telerik:RadGrid ID="grid_Members" PageSize="20" runat="server" AllowPaging="True" OnDeleteCommand="grid_Members_DeleteCommand"
                            ShowStatusBar="True" GridLines="None" Width="100%" AllowSorting="True" AllowFilteringByColumn="true" DataSourceID="sqlDS_Members"
                            CellSpacing="0">
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="false" DataSourceID="sqlDS_Members" Font-Names="Arial"
                                AllowFilteringByColumn="true" DataKeyNames="MemberID" >
                                <Columns>
                                    <telerik:GridTemplateColumn HeaderText="First Name" DataField="FirstName" SortExpression="FirstName" UniqueName="FirstName" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                        <ItemTemplate>
                                            <%# Eval("FirstName") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Last Name" DataField="LastName" SortExpression="LastName" UniqueName="LastName" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                        <ItemTemplate>
                                            <%# Eval("LastName")%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Email" DataField="Email" SortExpression="EmailAddress" UniqueName="EmailAddress" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                        <ItemTemplate>
                                            <%# Eval("EmailAddress") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Phone" AllowFiltering="false" SortExpression="PhoneNo">
                                        <ItemTemplate>
                                            <%# Eval("PhoneNo") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Team" DataField="TeamDesc" SortExpression="TeamDesc" UniqueName="TeamDesc" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                        <ItemTemplate>
                                            <%# Eval("TeamDesc") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Role" DataField="RoleDesc" SortExpression="RoleDesc" UniqueName="RoleDesc" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                        <ItemTemplate>
                                            <%# Eval("RoleDesc") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="DOB" AllowFiltering="false" SortExpression="DOB">
                                        <ItemTemplate>
                                            <%# Eval("DOB","{0:d}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Joined" AllowFiltering="false" SortExpression="DateJoined">
                                        <ItemTemplate>
                                            <%# Eval("DateJoined","{0:d}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Edit" AllowFiltering="false">
                                        <ItemTemplate>
                                            <img style="border: 0px; vertical-align: middle;" alt="Edit..." src="Images/Edit_btn.gif" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="20px" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Delete" AllowFiltering="false">
                                        <ItemTemplate>
                                            <img alt="delete" src="images/delete_btn.gif" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="18px" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView></telerik:RadGrid>
                        <asp:SqlDataSource runat="server" ID="sqlDS_Members" CancelSelectOnNullParameter="false" SelectCommandType="StoredProcedure"
                            ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>" SelectCommand="sp_Members_ViewAll">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="Role" QueryStringField="RoleID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
