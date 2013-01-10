using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ballyliffin_Gaa.Admin;
using Telerik.Web.UI;

namespace Ballyliffin_Gaa
{
    public partial class Emails_List : System.Web.UI.Page
    {
        public delegate void delSend(string subject, string body, string to, string from);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnBack.PostBackUrl = String.IsNullOrEmpty(Request.QueryString["returnurl"]) ? "/Default.aspx" : HttpUtility.UrlDecode(Request.Url.Query.Substring(Request.Url.Query.IndexOf("returnurl") + 10));
            } 
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            delSend ds = Commagent.SendEmailFromCommAgent;
            ds += Commagent.LogOutgoingEmail;

            BallyliffinDataContext db = new BallyliffinDataContext();
            GridItemCollection emails = grid_Emails.SelectedItems;
            foreach (GridItem item in emails)
            {
                sp_Emails_ViewAllResult email = db.sp_Emails_ViewAll().SingleOrDefault(m => m.EmailID == Convert.ToInt32(item.OwnerTableView.DataKeyValues[item.ItemIndex]["EmailID"]));
                ds(email.EmailSubject, email.EmailMessage, email.EmailTo, "ballyliffinGAA@gmail.com");
            }

            grid_Emails.Rebind();
        }
    }
}