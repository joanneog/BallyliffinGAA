using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteToolbar : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //if (UserManagementBLL.IsUserInARole(HttpContext.Current.User.Identity.Name, UserManagementBLL.SystemRoles.PMO))
            //{
            //    l_Feedback.NavigateUrl = l_Feedback.NavigateUrl.Replace("~/", "~/PMO/");
            //}
        }
    }

   
}
