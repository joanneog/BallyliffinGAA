<%@ Page Title="Roles List" MasterPageFile="~/Admin/AdminMaster.master" Language="C#" AutoEventWireup="true" CodeBehind="Roles_List.aspx.cs" Inherits="Ballyliffin_Gaa.Roles_List" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
<telerik:RadAjaxManager EnableViewState="False" ID="AjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btn_Refresh">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grid_Roles" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="grid_Roles">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grid_Roles" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
    </telerik:RadAjaxLoadingPanel>
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Roles
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <div class="editPageToolbar">
                        <asp:Button ID="btnBack" runat="server" ToolTip="Back" CssClass="backbtn" CausesValidation="false"
                            TabIndex="1" />
                        <asp:Button ID="btn_Add" runat="server" Text="+ Add" CssClass="custombtng" 
                            Width="80px" onclick="btn_Add_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_Refresh" runat="server" Text="Refresh" CssClass="custombtn" Width="80px" />
                    </div>
                    <div class="paddedContentBox">
                        <telerik:radgrid id="grid_Roles" pagesize="20" runat="server"
                            allowpaging="True" showstatusbar="True" gridlines="None"
                            width="100%" allowsorting="True" DataSourceID="sqlDS_Roles" AllowFilteringByColumn="true">
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="false" DataSourceID="sqlDS_Roles" Font-Names="Arial" AllowFilteringByColumn="true">
                                <Columns>
                                    <telerik:GridTemplateColumn HeaderText="Role" DataField="RoleDesc" SortExpression="RoleDesc" UniqueName="RoleDesc" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                    <ItemTemplate>
                                            <span <%# (Convert.ToBoolean(Eval("IsDeleted"))) ? "class='deletedRecord'" : "class='notDeletedRecord'" %>>
                                                <%# Eval("RoleDesc")%></span>
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
                                            <img alt="" src="images/delete_btn.gif"  />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="18px" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </telerik:GridTemplateColumn>         
                                </Columns>
                                </MasterTableView></telerik:radgrid>
                            <asp:SqlDataSource runat="server" ID="sqlDS_Roles" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                            SelectCommand="sp_Roles_ViewAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
