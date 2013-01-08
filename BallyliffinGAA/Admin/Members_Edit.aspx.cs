using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ballyliffin_Gaa
{
    public partial class Members_Edit : System.Web.UI.Page
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

                Page.Form.DefaultFocus = txt_FirstName.ClientID;
                Page.Form.DefaultButton = btnSave.UniqueID;
            }
        }

        private void LoadData()
        {
            if (!string.IsNullOrEmpty(Request["key"]))
            {
                BallyliffinDataContext db = new BallyliffinDataContext();
                sp_Members_SignleRecordResult record = db.sp_Members_SignleRecord(new Guid(Request["key"])).SingleOrDefault();
                txt_FirstName.Text = record.FirstName;
                txt_LastName.Text = record.LastName;
                txt_Phone.Text = record.PhoneNo;
                txt_Email.Text = record.EmailAddress;
                date_DOB.SelectedDate = record.DOB;
                date_Joined.SelectedDate = record.DateJoined;
                ddl_Team.SelectedValue = record.TeamID.Value.ToString();

                for (int i = 0; i < ddl_Roles.Items.Count; i++)
                {
                    if (record.RoleID == Convert.ToInt32(ddl_Roles.Items[i].Value))
                    {
                        ddl_Roles.Items[i].Selected = true;
                        break;
                    }
                }

                chk_IsDeleted.Checked = record.IsDeleted.Value;
                h_timestamp.Value = ToolsBLL.TimestampToString(record.timestamp).ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BallyliffinDataContext db = new BallyliffinDataContext();

                bool? result = false;
                db.sp_Members_Update(new Guid(Request["key"]), txt_FirstName.Text, txt_LastName.Text, txt_Email.Text, txt_Phone.Text, Convert.ToInt32(ddl_Team.SelectedValue), Convert.ToInt32(ddl_Roles.SelectedValue), date_DOB.SelectedDate, date_Joined.SelectedDate, chk_IsDeleted.Checked, ToolsBLL.StringToTimestamp(h_timestamp.Value), ref  result);

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