using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Ballyliffin_Gaa.Admin
{
    public partial class Administrator_Management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadData();
                btn_Add.PostBackUrl = "Admin_Add.aspx?returnurl=Administrator_Management.aspx" + Request.Url.Query;
                btnBack.PostBackUrl = String.IsNullOrEmpty(Request.QueryString["returnurl"]) ? "/Default.aspx" : HttpUtility.UrlDecode(Request.Url.Query.Substring(Request.Url.Query.IndexOf("returnurl") + 10));
            }
        }

        private void LoadData()
        {
            MembershipUserCollection users = Membership.GetAllUsers();
            grid_admins.DataSource = users; 
        }

        protected void Admin_Delete(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            Membership.DeleteUser(e.CommandArgument.ToString());
            LoadData();
        }

        protected void Admin_Edit(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            Response.Redirect("Admin_Edit.aspx?username="+ e.CommandArgument +"&returnurl=Administrator_Management.aspx" + Request.Url.Query);
        }

        protected void Admin_ChangePassword(object sender, CommandEventArgs e)
        {
            Response.Redirect("Admin_ChangePassword.aspx?username=" + e.CommandArgument + "&returnurl=Administrator_Management.aspx" + Request.Url.Query);
        }
    }
}