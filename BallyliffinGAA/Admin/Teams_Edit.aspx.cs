using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ballyliffin_Gaa
{
    public partial class Teams_Edit : System.Web.UI.Page
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
                Page.Form.DefaultFocus = txt_TeamDesc.ClientID;
                Page.Form.DefaultButton = btnSave.UniqueID;
            }
        }

        private void LoadData()
        {
            if (!string.IsNullOrEmpty(Request["key"]))
            {
                BallyliffinDataContext dbbally = new BallyliffinDataContext();
                sp_Teams_SignleRecordResult record = dbbally.sp_Teams_SignleRecord(new Guid(Request["key"])).SingleOrDefault(); // sp_Venues_SignleRecord(new Guid(Request["key"])).SingleOrDefault();
                txt_TeamDesc.Text = record.TeamDesc;
                ddl_Division.SelectedValue = record.DivisionID.ToString();
                chk_IsOurs.Checked = record.IsOurs;
                chk_IsDeleted.Checked = record.IsDeleted;
                h_timestamp.Value = ToolsBLL.TimestampToString(record.timestamp).ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BallyliffinDataContext db = new BallyliffinDataContext();

                bool? result = false;
                db.sp_Teams_Update(new Guid(Request["key"]), txt_TeamDesc.Text, Convert.ToInt32(ddl_Division.SelectedValue) , chk_IsOurs.Checked, chk_IsDeleted.Checked, ToolsBLL.StringToTimestamp(h_timestamp.Value), ref  result);

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