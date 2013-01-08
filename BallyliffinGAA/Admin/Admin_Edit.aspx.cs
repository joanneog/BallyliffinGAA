using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Ballyliffin_Gaa.Admin
{
    public partial class Admin_Edit : System.Web.UI.Page
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
            if (!string.IsNullOrEmpty(Request["username"]))
            {
                MembershipUser user = Membership.GetUser(Request["username"]);
                txt_Email.Text = user.Email;
                lbl_Username.Text = user.UserName;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MembershipUser user = Membership.GetUser(Request["username"].ToString());
                user.Email = txt_Email.Text;
                Membership.UpdateUser(user);
                Response.Redirect(btnBack.PostBackUrl);
            }
        }
    }
}