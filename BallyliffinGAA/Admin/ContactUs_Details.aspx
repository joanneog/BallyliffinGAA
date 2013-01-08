<%@ Page Title="Contact Us Details" MasterPageFile="~/Admin/AdminMaster.master" Language="C#" AutoEventWireup="true" CodeBehind="~/Admin/ContactUs_Details.aspx.cs" Inherits="Ballyliffin_Gaa.ContactUs_Details" %>

<asp:Content ID="pageHeader" ContentPlaceHolderID="headerPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
    <div class="contentbox" style="background: #999999; padding: 1px; width: 100%;">
        <div class="contentheader">
            <h2 class="editH2Title">
                Contact Us Details
            </h2>
        </div>
        <div class="contentPageBoxHolderHi">
            <div class="contentPageBoxHolder">
                <div class="contentPageBox">
                    <div class="editPageToolbar">
                        <asp:Button ID="btnBack" runat="server" ToolTip="Back" CssClass="backbtn" CausesValidation="false" TabIndex="1" />
                    </div>
                    <div style="width: 100%; padding: 7px;">
                        <table cellpadding="5" cellspacing="0" class="editForm">
							<tr id="tr_DeleteH" runat="server" >
                                <td class="detailsPageDeletedRow" colspan="2">
                                    <img src="images/Delete.gif" title="Record is Deleted!" alt="Record is Deleted!" />
                                    &nbsp;&nbsp; This record is Deleted!
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Subject
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Subject" runat="server">Fixtures Clashing</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Contact Name
                                </td>
                                <td>
                                    <asp:Label ID="lbl_ContactName" runat="server">Davin Kelly</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Email Address
                                </td>
                                <td>
                                    <asp:Label ID="lbl_Email" runat="server">DavinKelly@mail.com</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="editPageTitleCell">
                                    Contact Date
                                </td>
                                <td>
                                    <asp:Label ID="lbl_ContactDate" runat="server">2012/09/03</asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td class="editPageTitleCell">
                                    Message
                                </td>
                                <td>
                                    <div id="lbl_Message" runat="server"  class="detailsPageCommentBox">The fixtures shown are clashing. There are two matches on at the same time and Venue on Sunday</div>
                                </td>
                            </tr>
                            <tr id="tr_DeleteF" runat="server" >
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