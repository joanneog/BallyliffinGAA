<%@ Page Title="Matches List" MasterPageFile="~/Admin/AdminMaster.master" Language="C#" AutoEventWireup="true" CodeBehind="Matches_List.aspx.cs" Inherits="Ballyliffin_Gaa.Matches_List" %>

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
                            CellSpacing="0">
                            <GroupingSettings CaseSensitive="false" />
                            <MasterTableView AutoGenerateColumns="false" DataSourceID="sqlDS_Matches" Font-Names="Arial" AllowFilteringByColumn="true">
                                <Columns>
                                
                                    <telerik:GridTemplateColumn HeaderText="Referee">
                                    <ItemTemplate>
                                    <span><%# Eval("FirstName") %>  <%# Eval("LastName") %> </span>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>          
                                    
                                    <telerik:GridTemplateColumn HeaderText="Home Team">
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
                                    
                                    <telerik:GridTemplateColumn HeaderText="Away Team">
                                    <ItemTemplate>
                                    <%# Eval("TeamBDesc") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>  
                                    
                                    <telerik:GridTemplateColumn HeaderText="Venue">
                                    <ItemTemplate>
                                    <%# Eval("VenueDesc") %>
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>          
                                    
                                    <telerik:GridTemplateColumn HeaderText="Played" AllowFiltering="false">
                                    <ItemTemplate>
                                    <asp:Image runat="server" Visible='<%# Eval("IsPlayed") %>' ImageUrl="Admin/images/Ok.gif" />
                                    </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn HeaderText="Date" AllowFiltering="false">
                                    <ItemTemplate>
                                    <%# Eval("MatchDate") %>
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
                                            <img src="images/delete_btn.gif"  />
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

