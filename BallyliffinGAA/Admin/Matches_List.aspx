﻿<%@ Page Title="Matches List" MasterPageFile="~/Admin/AdminMaster.master" Language="C#" AutoEventWireup="true" CodeBehind="Matches_List.aspx.cs" Inherits="Ballyliffin_Gaa.Matches_List" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">

    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Matches
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
                        <telerik:radgrid id="grid_Matches" pagesize="20" runat="server"
                            allowpaging="True" showstatusbar="True" gridlines="None"
                            width="100%" allowsorting="True" DataSourceID="sqlDS_Matches" 
                            CellSpacing="0" OnDeleteCommand="grid_Matches_Delete">
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="false" DataSourceID="sqlDS_Matches" DataKeyNames="MatchID" Font-Names="Arial" AllowFilteringByColumn="true">
                                <Columns>
                                
                                    <telerik:GridTemplateColumn HeaderText="Referee"  DataField="RefereeName" SortExpression="RefereeName" UniqueName="RefereeName" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                    <ItemTemplate>
                                    <%# Eval("RefereeName") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>          
                                    
                                    <telerik:GridTemplateColumn HeaderText="Home Team"  DataField="TeamADesc" SortExpression="TeamADesc" UniqueName="TeamADesc" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                    <ItemTemplate>
                                    <%# Eval("TeamADesc") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>                                    
                                    <telerik:GridTemplateColumn HeaderText="Score" AllowFiltering="false">
                                    <ItemTemplate>
                                    <%# Eval("TeamAScore") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>          
                                    
                                    <telerik:GridTemplateColumn HeaderText="Score" AllowFiltering="false">
                                    <ItemTemplate>
                                    <%# Eval("TeamBScore") %> 
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>          
                                    
                                    <telerik:GridTemplateColumn HeaderText="Away Team" DataField="TeamBDesc" SortExpression="TeamBDesc" UniqueName="TeamBDesc" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                    <ItemTemplate>
                                    <%# Eval("TeamBDesc") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>  
                                    
                                    <telerik:GridTemplateColumn HeaderText="Venue" DataField="VenueDesc" SortExpression="VenueDesc" UniqueName="VenueDesc" AutoPostBackOnFilter="True" CurrentFilterFunction="Contains" FilterControlWidth="140px" FilterImageToolTip="Search" FilterImageUrl="images/Search.gif">
                                    <ItemTemplate>
                                    <%# Eval("VenueDesc") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>          
                                    
                                    <telerik:GridTemplateColumn HeaderText="Played" AllowFiltering="false">
                                    <ItemTemplate>
                                    <asp:Image runat="server" Visible='<%# Eval("IsPlayed") %>' ImageUrl="~/images/Ok.gif" />
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn HeaderText="Date" AllowFiltering="false">
                                    <ItemTemplate>
                                    <%# Eval("MatchDate") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>   
                                               <telerik:GridTemplateColumn HeaderText="Edit" AllowFiltering="false">
                                        <ItemTemplate>
                                        <asp:ImageButton ID="imgb_Edit" runat="server" ToolTip="Edit..." ImageUrl="~/Images/Edit_btn.gif" CausesValidation="false" PostBackUrl='<%# "~/Admin/Matches_Edit.aspx?key="+Eval("MatchKey")+"&returnurl=Matches_List.aspx" + Request.Url.Query%>'/>
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
                                
                            <asp:SqlDataSource runat="server" ID="sqlDS_Matches" ConnectionString="<%$ ConnectionStrings:BallyliffinGaaConnectionString %>"
                            SelectCommand="sp_Matches_ViewAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

