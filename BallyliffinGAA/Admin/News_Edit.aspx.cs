using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ballyliffin_Gaa
{
    public partial class News_Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnBack.PostBackUrl = String.IsNullOrEmpty(Request.QueryString["returnurl"]) ? "/Default.aspx" : HttpUtility.UrlDecode(Request.Url.Query.Substring(Request.Url.Query.IndexOf("returnurl") + 10));
                LoadData();
            }
        }

        private void LoadData()
        {
            BallyliffinDataContext db = new BallyliffinDataContext();
            sp_News_SignleRecordResult srr = db.sp_News_SignleRecord(new Guid(Request["Key"])).SingleOrDefault();
            txt_Headline.Text = srr.NewsHeadLine;
            txt_Story.Text = srr.NewsContent;
            date_NewsDate.SelectedDate = srr.NewsDate;
            chk_IsDeleted.Checked = srr.IsDeleted;
            hfTime.Value = srr.timestamp.TimestampToString();
        }

        protected void btnSave2_Click(object sender, EventArgs e)
        {
           
            if (Page.IsValid)
            {
                BallyliffinDataContext db = new BallyliffinDataContext();

                bool? result = false;
                db.sp_News_Update(new Guid(Request["Key"]), txt_Headline.Text, txt_Story.Text, date_NewsDate.SelectedDate, chk_IsDeleted.Checked, ToolsBLL.StringToTimestamp(hfTime.Value), ref result);
                if (result.Value)
                {
                    Response.Redirect(btnBack.PostBackUrl);
                }
                else
                {
                    lbl_Msg.Visible = true;
                    lbl_Msg.Text = "The record has been modified by another user. <a class='reloadRecordLink' href='" + Request.Url.Query + "'>Reload this Record</a>";
                }
            }
        }


    }
}