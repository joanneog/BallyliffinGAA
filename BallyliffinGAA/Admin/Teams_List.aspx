<%@ Page Title="Teams List" MasterPageFile="~/Admin/AdminMaster.master" Language="C#" AutoEventWireup="true" CodeBehind="Teams_List.aspx.cs" Inherits="Ballyliffin_Gaa.Teams_List" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
<telerik:RadAjaxManager EnableViewState="False" ID="AjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btn_Refresh">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grid_Teams" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="grid_Teams">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grid_Teams" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
    </telerik:RadAjaxLoadingPanel>
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Teams
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <div class="editPageToolbar">
                        <asp:Button ID="btnBack" runat="server" ToolTip="Back" CssClass="backbtn" CausesValidation="false"
                            TabIndex="1" />
                        <asp:Button ID="btn_Add" runat="server" Text="+ Add" CssClass="custombtng" 
                            Width="80px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_Refresh" runat="server" Text="Refresh" CssClass="custombtn" Width="80px" OnClick="btn_Refresh_Click"/>
                    </div>
                    <div class="paddedContentBox">
                        <telerik:radgrid id="grid_Teams" pagesize="20" runat="server"
                            allowpaging="True" showstatusbar="True" gridlines="None"
                            width="100%" allowsorting="True" DataSourceID="sqlDS_Teams" OnDeleteCommand="grid_Teams_Delete" AllowFilteringByColumn="true">
                            <GroupingSettings CaseSensitive="false"/>
                            <MasterTableView AutoGenerateColumns="false" DataSourceID="sqlDS_Teams" Font-Names="Arial" AllowFilteringByColumn="true">
                                <Columns>
                                    <telerik:GridTemplateColumn HeaderText="Team"  DataField="TeamDesc" SortExpression="TeamDesc" UniqueName="TeamDesc" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                    <ItemTemplate>
                                    <%# Eval("TeamDesc") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>            
                                    
                                    <telerik:GridTemplateColumn HeaderText="Division" DataField="DivisionDesc" SortExpression="DivisionDesc" UniqueName="DivisionDesc" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                    <ItemTemplate>
                                    <%# Eval("DivisionDesc")%>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>            
                                    
                                    <telerik:GridTemplateColumn HeaderText="Ours" AllowFiltering="false">
                                    <ItemTemplate>
                                    <asp:Image runat="server" ImageUrl="Admin/images/Ok.gif" Visible='<%#Eval("IsOurs") %>' />
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>   
                                    <telerik:GridTemplateColumn HeaderText="Edit" AllowFiltering="false">
                                        <ItemTemplate>
                                        <asp:ImageButton runat="server" ToolTip="Edit..." CausesValidation="false" NavigateUrl='<%# "Admin/Teams_Edit.aspx?key=" +Eval("TeamKey")+ "&returnurl=Teams_List.aspx"+Request.Url.Query%>' />
                                        <img style="border: 0px; vertical-align: middle;" alt="Edit..." src="Images/Edit_btn.gif" /></asp:HyperLink>
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
                                </MasterTableView></telerik:radgrid>
                            <asp:SqlDataSource runat="server" ID="sqlDS_Teams" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                            SelectCommand="sp_Teams_ViewAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
