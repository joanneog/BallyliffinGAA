using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Ballyliffin_Gaa.Admin
{
    public partial class Admin_ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnBack.PostBackUrl = String.IsNullOrEmpty(Request.QueryString["returnurl"]) ? "Admin/Default.aspx" : HttpUtility.UrlDecode(Request.Url.Query.Substring(Request.Url.Query.IndexOf("returnurl") + 10));
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (txt_newPassword.Text == txt_ConfirmPassword.Text)
                {
                    MembershipUser user = Membership.GetUser(Request["username"].ToString());

                    if (user.ChangePassword(txt_Password.Text, txt_newPassword.Text))
                    {
                        Response.Redirect(btnBack.PostBackUrl);
                    }
                }
            }
        }
    }
}