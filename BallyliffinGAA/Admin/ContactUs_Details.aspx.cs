using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ballyliffin_Gaa
{
    public partial class ContactUs_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnBack.PostBackUrl = String.IsNullOrEmpty(Request.QueryString["returnurl"]) ? "Admin/DashBoard.aspx" : HttpUtility.UrlDecode(Request.Url.Query.Substring(Request.Url.Query.IndexOf("returnurl") + 10));
                LoadData();
            }
        }

        private void LoadData()
        {
            if (!string.IsNullOrEmpty(Request["key"]))
            {
                BallyliffinDataContext db = new BallyliffinDataContext();
                sp_visitorContacts_SignleRecordResult record = db.sp_visitorContacts_SignleRecord(new Guid(Request["key"])).SingleOrDefault();
                lbl_ContactDate.Text = record.ContactDate.ToString();
                lbl_ContactName.Text = record.ContactName;
                lbl_Email.Text = record.EmailAddress;
                lbl_Subject.Text = record.VisitorContactDesc;
                lbl_Message.InnerHtml = record.ContactMessage.Replace("\r\n", "<br/>");
                tr_DeleteF.Visible = record.IsDeleted;
                tr_DeleteH.Visible = record.IsDeleted;
            }
        }

    }
}