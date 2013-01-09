<%@ Page Title="Emails List" MasterPageFile="~/Admin/AdminMaster.master" Language="C#" AutoEventWireup="true" CodeBehind="Emails_List.aspx.cs" Inherits="Ballyliffin_Gaa.Emails_List" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">

    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Emails
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <div class="editPageToolbar">
                        <asp:Button ID="btnBack" runat="server" ToolTip="Back" CssClass="backbtn" CausesValidation="false"
                            TabIndex="1" />
                        <asp:Button ID="btn_Add" runat="server" Text="Resend" CssClass="custombtng" 
                            Width="80px" onclick="btn_Add_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_Refresh" runat="server" Text="Refresh" CssClass="custombtn" Width="80px" />
                    </div>
                    <div class="paddedContentBox">
                        <telerik:radgrid id="grid_Emails" pagesize="20" runat="server"
                            allowpaging="True" showstatusbar="True" gridlines="None"
                            width="100%" allowsorting="True" DataSourceID="sqlDS_Emails" AllowMultiRowSelection="true">
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="false" DataSourceID="sqlDS_Emails" DataKeyNames="EmailID" Font-Names="Arial" AllowFilteringByColumn="true">
                                <Columns>
                                    <telerik:GridClientSelectColumn UniqueName="column">
                                        <ItemStyle Width="30px" />
                                    </telerik:GridClientSelectColumn>

                                    <telerik:GridTemplateColumn HeaderText="Subject" DataField="EmailSubject" SortExpression="EmailSubject" UniqueName="EmailSubject" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                    <ItemTemplate>
                                    <%# Eval("EmailSubject") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>            
                                    
                                    <telerik:GridTemplateColumn HeaderText="To" DataField="EmailTo" SortExpression="EmailTo" UniqueName="EmailTo" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                    <ItemTemplate>
                                    <%# Eval("EmailTo") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>            
                                    
                                    <telerik:GridTemplateColumn HeaderText="From" DataField="EmailFrom" SortExpression="EmailFrom" UniqueName="EmailFrom" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                    <ItemTemplate>
                                    <%# Eval("EmailFrom") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>            
                                    
                                    <telerik:GridTemplateColumn HeaderText="Sent" AllowFiltering="false" SortExpression="SentDate">
                                    <ItemTemplate>
                                    <%# Eval("SentDate", "{0:d}") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>   
                                        
                                </Columns>
                                </MasterTableView></telerik:radgrid>
                            <asp:SqlDataSource runat="server" ID="sqlDS_Emails" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                            SelectCommand="sp_Emails_ViewAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

