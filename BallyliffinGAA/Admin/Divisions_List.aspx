<%@ Page Title="Divisions List" MasterPageFile="~/Admin/AdminMaster.master" Language="C#"
    AutoEventWireup="true" CodeBehind="Divisions_List.aspx.cs" Inherits="Ballyliffin_Gaa.Divisions_List" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
<telerik:RadAjaxManager EnableViewState="False" ID="AjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="grid_Divisions">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grid_Divisions" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="grid_Divisions">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grid_Divisions" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
    </telerik:RadAjaxLoadingPanel>
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Divisions
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
                        <asp:Button ID="btn_Refresh" runat="server" Text="Refresh" CssClass="custombtn" 
                            Width="80px" onclick="btn_Refresh_Click" />
                    </div>
                    <div class="paddedContentBox">
                        <telerik:RadGrid ID="grid_Divisions" PageSize="20" runat="server" AllowPaging="True" OnDeleteCommand="grid_Divisions_Delete"
                            ShowStatusBar="True" GridLines="None" Width="100%" AllowSorting="True" DataSourceID="sqlDS_Divisions" AllowFilteringByColumn="true">
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="false" DataSourceID="sqlDS_Divisions" Font-Names="Arial"
                                AllowFilteringByColumn="true">
                                <Columns>
                                    <telerik:GridTemplateColumn HeaderText="Division" DataField="DivisionDesc" SortExpression="DivisionDesc" UniqueName="DivisionDesc" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                        <ItemTemplate>
                                            <%# Eval("DivisionDesc") %>
                                            <%--<asp:HyperLink ID="HyperLink1" runat="server" Text=' <%# Eval("DivisionDesc") %>' NavigateUrl='<%# "~/Admin/Division_Edit.aspx?key="+Eval("DivisionsKey")+"&returnurl=Divisions_List.aspx"+Request.Url.Query %>'></asp:HyperLink>--%>
                                    
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                     <telerik:GridTemplateColumn HeaderText="Edit" AllowFiltering="false">
                                        <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" ToolTip="Edit..." CausesValidation="false" NavigateUrl='<%# "~/Admin/Divisions_Edit.aspx?key="+Eval("DivisionKey")+"&returnurl=Divisions_List.aspx" %>'/>
                                            <img style="border: 0px; vertical-align: middle;" alt="Edit..." src="Images/Edit_btn.gif" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="20px" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Delete" AllowFiltering="false">
                                        <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" Visible='<%# ! Convert.ToBoolean(Eval("IsDeleted")) %>' CausesValidation="false" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');" Text="Delete" ImageUrl="~/Images/Delete_btn.gif" ToolTip="Delete this record" />
                                           <asp:Image ID="Image1" runat="server" src="images/delete.gif" alt="delete" Visible='<%# Convert.ToBoolean(Eval("IsDeleted")) %>'/>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="18px" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView></telerik:RadGrid>
                            <asp:SqlDataSource runat="server" ID="sqlDS_Divisions" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                            SelectCommand="sp_Divisions_ViewAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
