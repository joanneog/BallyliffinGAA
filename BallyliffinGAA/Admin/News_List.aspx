<%@ Page Title="News List" MasterPageFile="~/Admin/AdminMaster.master" Language="C#"
    AutoEventWireup="true" CodeBehind="News_List.aspx.cs" Inherits="Ballyliffin_Gaa.Admin.News_List" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
<telerik:RadAjaxManager EnableViewState="False" ID="AjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btn_Refresh">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grid_News" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="grid_News">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grid_News" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
    </telerik:RadAjaxLoadingPanel>
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                News
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
                        <telerik:radgrid id="grid_News" pagesize="20" runat="server"
                            allowpaging="True" showstatusbar="True" gridlines="None"
                            width="100%" allowsorting="True" DataSourceID="sqlDS_News" 
                            OnDeleteCommand="grid_News_Delete" AllowFilteringByColumn="true">
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="false" DataSourceID="sqlDS_News" Font-Names="Arial" AllowFilteringByColumn="true" DataKeyNames="NewsID">
                                <Columns>
                                    <telerik:GridTemplateColumn HeaderText="Headline" DataField="NewsHeadline" SortExpression="NewsHeadline" UniqueName="NewsHeadline" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                    <ItemTemplate>
                                    
                                    <asp:HyperLink runat="server" CssClass="namelink" Text='<%# Eval("NewsHeadline") %>' NavigateUrl='<%# "~/Admin/News_Details.aspx?key="+Eval("NewsKey")+"&returnurl=News_List.aspx"+Request.Url.Query %>'></asp:HyperLink>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>            
                                    
                                    <telerik:GridTemplateColumn HeaderText="Story" AllowFiltering="false">
                                    <ItemTemplate>
                                    <%# Eval("NewsContent") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>            
                                    
                                    <telerik:GridTemplateColumn HeaderText="Date" DataField="NewsDate" SortExpression="NewsDate" UniqueName="NewsDate" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                    <ItemTemplate>
                                    <%# Eval("NewsDate","{0:d}") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>   
                                      <telerik:GridTemplateColumn HeaderText="Edit" AllowFiltering="false">
                                        <ItemTemplate>
                                        <asp:ImageButton ID="imgb_Edit" runat="server" ToolTip="Edit..." ImageUrl="~/Images/Edit_btn.gif" CausesValidation="false" PostBackUrl='<%# "~/Admin/News_Edit.aspx?key="+Eval("NewsKey")+"&returnurl=News_List.aspx"+ Request.Url.Query %>'/>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="20px" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Delete" AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgb_Delete" runat="server" Visible='<%# ! Convert.ToBoolean(Eval("IsDeleted")) %>' CausesValidation="false" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');" ImageUrl="~/Images/Delete_btn.gif" ToolTip="Delete this record" />
                                            <asp:Image runat="server" ID="img_Deleted" ImageUrl="~/images/Delete.gif" Visible='<%# Eval("IsDeleted") %>' ToolTip="This record is deleted." />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="18px" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </telerik:GridTemplateColumn>          
                                </Columns>
                                </MasterTableView></telerik:radgrid>
                               
                            <asp:SqlDataSource runat="server" ID="sqlDS_News" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                            SelectCommand="sp_News_ViewAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
