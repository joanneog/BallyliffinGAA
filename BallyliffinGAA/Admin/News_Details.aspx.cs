using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ballyliffin_Gaa
{
    public partial class News_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Page_PreRenderComplete(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Loads the selected record data into the form, sets the back button link, page default field focus and default action button
                LoadData();
                btnBack.PostBackUrl = String.IsNullOrEmpty(Request.QueryString["returnurl"]) ? "~/Admin/Default.aspx" : HttpUtility.UrlDecode(Request.Url.Query.Substring(Request.Url.Query.IndexOf("returnurl") + 10));
                btnEdit.PostBackUrl = "News_Edit.aspx?key=" + Request["Key"] + "&returnurl=News_Details.aspx" + Request.Url.Query;
            }
        }

        private void LoadData()
        {
            if (!string.IsNullOrEmpty(Request["key"]))
            {
                BallyliffinDataContext dbbally = new BallyliffinDataContext();
                sp_News_SignleRecordResult record = dbbally.sp_News_SignleRecord(new Guid(Request["key"])).SingleOrDefault();
                lbl_Headline.Text = record.NewsHeadLine;
                lbl_Story.InnerText = record.NewsContent;
                lbl_NewsDate.Text = record.NewsDate.ToShortDateString();
            }
        }
    }
}