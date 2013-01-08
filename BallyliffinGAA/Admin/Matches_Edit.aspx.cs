using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ballyliffin_Gaa
{
    public partial class Matches_Edit : System.Web.UI.Page
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

                Page.Form.DefaultFocus = ddl_HomeTeam.ClientID;
                Page.Form.DefaultButton = btnSave.UniqueID;
            }
        }

        private void LoadData()
        {
            if (!string.IsNullOrEmpty(Request["key"]))
            {
                BallyliffinDataContext db = new BallyliffinDataContext();
                sp_Matches_SignleRecordResult record = db.sp_Matches_SignleRecord(new Guid(Request["key"])).SingleOrDefault();

                ddl_HomeTeam.SelectedValue = record.TeamAID.ToString();
                ddl_AwayTeam.SelectedValue = record.TeamBID.ToString();
                num_HomeScore.Text = record.TeamAScore.ToString();
                num_AwayTeamScore.Text = record.TeamBScore.ToString();
                ddl_Referee.SelectedValue = record.RefereeID.ToString();
                date_match.SelectedDate = record.MatchDate;
                ddl_Venue.SelectedValue = record.VenueID.ToString();
                chk_IsPlayed.Checked = record.IsPlayed;
                h_timestamp.Value = record.timestamp.TimestampToString();
                chk_IsDeleted.Checked = record.IsDeleted;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BallyliffinDataContext db = new BallyliffinDataContext();

                bool? result = false;
                db.sp_Matches_Update(new Guid(Request["key"]), Convert.ToInt32(ddl_HomeTeam.SelectedValue), 
                    Convert.ToInt32(ddl_AwayTeam.SelectedValue), 
                    Convert.ToInt32(ddl_Referee.SelectedValue),
                    num_HomeScore.Value == null ? (int?)null : Convert.ToInt32(num_HomeScore.Value),
                    num_AwayTeamScore.Value == null ? (int?)null : Convert.ToInt32(num_AwayTeamScore.Value), 
                    chk_IsPlayed.Checked, date_match.SelectedDate, 
                    Convert.ToInt32(ddl_Venue.SelectedValue), 
                    chk_IsDeleted.Checked, 
                    ToolsBLL.StringToTimestamp(h_timestamp.Value), 
                    ref  result);

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