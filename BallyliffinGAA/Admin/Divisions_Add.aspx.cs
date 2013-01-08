﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ballyliffin_Gaa
{
    public partial class Divisions_Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnBack.PostBackUrl = String.IsNullOrEmpty(Request.QueryString["returnurl"]) ? "/Default.aspx" : HttpUtility.UrlDecode(Request.Url.Query.Substring(Request.Url.Query.IndexOf("returnurl") + 10));
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            BallyliffinDataContext dbbally = new BallyliffinDataContext();
            if (Page.IsValid)
            {
                dbbally.sp_Divisions_Insert(txt_DivisionDesc.Text);
                Response.Redirect(btnBack.PostBackUrl);
            }
        }
    }
}