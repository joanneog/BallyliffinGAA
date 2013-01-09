using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Ballyliffin_Gaa
{
    public partial class ContactUs_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnBack.PostBackUrl = String.IsNullOrEmpty(Request.QueryString["returnurl"]) ? "Admin/DashBoard.aspx" : HttpUtility.UrlDecode(Request.Url.Query.Substring(Request.Url.Query.IndexOf("returnurl") + 10));
            }

        }

        protected void grid_VisitorContacts_Delete(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            int id = Convert.ToInt32((e.Item as GridDataItem).OwnerTableView.DataKeyValues[e.Item.ItemIndex]["VisitorContactID"]);
            BallyliffinDataContext db = new BallyliffinDataContext();
            db.sp_visitorContacts_Delete(id);
            grid_VisitorContacts.Rebind();
        }

        protected void btn_Refresh_Click(object sender, EventArgs e)
        {
            grid_VisitorContacts.Rebind();
        }

    }
}