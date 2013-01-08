<%@ Page Title="News Details" MasterPageFile="~/Admin/AdminMaster.master" Language="C#" AutoEventWireup="true" CodeBehind="News_Details.aspx.cs" Inherits="Ballyliffin_Gaa.News_Details" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                News Details
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <div class="editPageToolbar">
                        <asp:Button ID="btnBack" runat="server" ToolTip="Back" CssClass="backbtn" CausesValidation="false" TabIndex="1" />
						<asp:Button ID="btnEdit" runat="server" Text="Edit..." CssClass="custombtnEdit" Width="70px"  TabIndex="40" />&nbsp;&nbsp;
                        </div>
                    <div style="width: 100%; padding: 7px;">
                        <table cellpadding="5" cellspacing="0" class="editForm">
							<tr id="tr_DeleteH" runat="server" visible="false">
                                <td class="detailsPageDeletedRow" colspan="2">
                                    <img src="images/Delete.gif" title="Record is Deleted!" alt="Record is Deleted!" />
                                    &nbsp;&nbsp; This record is Deleted!
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Headline
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Headline" runat="server">Lotto</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Date
                                </td>
                                <td>
                                    <asp:Label ID="lbl_NewsDate" runat="server">25/09/2012</asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td class="editPageTitleCell">
                                    Story
                                </td>
                                <td>
                                    <div id="lbl_Story" runat="server"  class="detailsPageCommentBox">Last Weeks winning lotto Numbers were 2, 4, 21, 43 and 28. The jackpot of 2,500 was won by local man John Lehane Main St. Ballyliffin. The jackpot will begin at €500 again next week. Thank you to all that support the club by taking part in the weekly lotto draw.</div>
                                </td>
                            </tr>
                            <tr id="tr_DeleteF" runat="server"  visible="false" >
                                <td class="detailsPageDeletedRow" colspan="2">
                                    <img src="images/Delete.gif" title="Record is Deleted!" alt="Record is Deleted!" />
                                    &nbsp;&nbsp; This record is Deleted!
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
