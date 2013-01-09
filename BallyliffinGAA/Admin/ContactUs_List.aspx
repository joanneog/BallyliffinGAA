<%@ Page Title="Contact Us List" MasterPageFile="~/Admin/AdminMaster.master" Language="C#"
    AutoEventWireup="true" CodeBehind="ContactUs_List.aspx.cs" Inherits="Ballyliffin_Gaa.ContactUs_List" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Contact Us
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <div class="editPageToolbar">
                        <asp:Button ID="btnBack" runat="server" ToolTip="Back" CssClass="backbtn" CausesValidation="false"
                            TabIndex="1" />
                        <asp:Button ID="btn_Refresh" runat="server" Text="Refresh" CssClass="custombtn" Width="80px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="paddedContentBox">
                        <telerik:RadGrid ID="grid_VisitorContacts" PageSize="20" runat="server" AllowPaging="True" OnDeleteCommand="grid_VisitorContacts_Delete"
                            ShowStatusBar="True" GridLines="None" Width="100%" AllowSorting="True" DataSourceID="sqlDS_VisitorContacts">
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="false" DataSourceID="sqlDS_VisitorContacts"
                                Font-Names="Arial" AllowFilteringByColumn="true" DataKeyNames="VisitorContactID">
                                <Columns>
                                    <telerik:GridTemplateColumn HeaderText="Title" DataField="VisitorContactDesc" SortExpression="VisitorContactDesc" UniqueName="VisitorContactDesc" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link_Contact" Text='<%# Eval("VisitorContactDesc") %>' CssClass="namelink"
                                                runat="server" NavigateUrl='<%#"ContactUs_Details.aspx?"+Eval("VisitorContactKey")+ "&returnurl=ContactUs_List.aspx"+ Request.Url.Query %>'></asp:HyperLink>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Name" DataField="ContactName" SortExpression="ContactName" UniqueName="ContactName" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                        <ItemTemplate>
                                            <%# Eval("ContactName") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Email" DataField="EmailAddress" SortExpression="EmailAddress" UniqueName="EmailAddress" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                        <ItemTemplate>
                                            <%# Eval("EmailAddress") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Date" AllowFiltering="false" SortExpression="ContactDate">
                                        <ItemTemplate>
                                            <%# Eval("ContactDate","{0:d}") %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn AllowFiltering="false">
                                        <ItemTemplate>
                                            <asp:Button ID="btn_Reply" runat="server" Text="Reply" CssClass="custombtng" Width="120px"
                                                PostBackUrl='<%# "Emails_Compose.aspx?ContactKey=" + Eval("VisitorContactKey") + "&returnurl=ContactUs_List.aspx" + Request.Url.Query %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        
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
                            </MasterTableView></telerik:RadGrid>
                            <asp:SqlDataSource runat="server" ID="sqlDS_VisitorContacts" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                            SelectCommand="sp_VisitorContacts_ViewAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
