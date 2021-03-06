﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ballyliffin_Gaa
{
    public partial class Matches_Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnBack.PostBackUrl = String.IsNullOrEmpty(Request.QueryString["returnurl"]) ? "~/Admin/Default.aspx" : HttpUtility.UrlDecode(Request.Url.Query.Substring(Request.Url.Query.IndexOf("returnurl") + 10));
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            BallyliffinDataContext dbbally = new BallyliffinDataContext();
            if (Page.IsValid)
            {
                dbbally.sp_Matches_Insert( Convert.ToInt32(ddl_HomeTeam.SelectedValue), Convert.ToInt32(ddl_AwayTeam.SelectedValue), Convert.ToInt32(ddl_Referee.SelectedValue), (int?)null, (int?)null, false, date_match.SelectedDate, Convert.ToInt32(ddl_Venue.SelectedValue));
                Response.Redirect(btnBack.PostBackUrl);
            }
        }
        
        
    }
}