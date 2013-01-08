using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ballyliffin_Gaa
{
    public partial class Venues_Add : System.Web.UI.Page
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
            BallyliffinDataContext dbbally = new BallyliffinDataContext();
            if (Page.IsValid)
            {
                try
                {
                    dbbally.sp_Venues_Insert(txt_VenueDesc.Text);
                    Response.Redirect(btnBack.PostBackUrl);
                }
                catch (Exception ex)
                {
                   
                }
            }
        }

        
    }
}