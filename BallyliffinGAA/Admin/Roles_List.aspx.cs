using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Ballyliffin_Gaa
{
    public partial class Roles_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnBack.PostBackUrl = String.IsNullOrEmpty(Request.QueryString["returnurl"]) ? "~/Default.aspx" : HttpUtility.UrlDecode(Request.Url.Query.Substring(Request.Url.Query.IndexOf("returnurl") + 10));
                btn_Add.PostBackUrl = "Roles_Add.aspx?returnUrl=Roles_List.aspx" + Request.Url.Query;
            } 
        }

        protected void grid_Roles_Delete(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            int id = Convert.ToInt32((e.Item as GridDataItem).OwnerTableView.DataKeyValues[e.Item.ItemIndex]["RoleID"]);
            BallyliffinDataContext db = new BallyliffinDataContext();
            db.sp_Roles_Delete(id);
            grid_Roles.Rebind();
        }

        protected void btn_Refresh_Click(object sender, EventArgs e)
        {
            grid_Roles.Rebind();
        }
    }
}