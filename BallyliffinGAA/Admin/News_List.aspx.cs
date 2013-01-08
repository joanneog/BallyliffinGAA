using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


namespace Ballyliffin_Gaa.Admin
{
    public partial class News_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnBack.PostBackUrl = String.IsNullOrEmpty(Request.QueryString["returnurl"]) ? "/Default.aspx" : HttpUtility.UrlDecode(Request.Url.Query.Substring(Request.Url.Query.IndexOf("returnurl") + 10));
                btn_Add.PostBackUrl = "News_Add.aspx?returnUrl=News_List.aspx" + Request.Url.Query;

            } 

        }
        protected void grid_News_Delete(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            int id = Convert.ToInt32((e.Item as GridDataItem).OwnerTableView.DataKeyValues[e.Item.ItemIndex]["NewsID"]);
            BallyliffinDataContext db = new BallyliffinDataContext();            
            db.sp_News_Delete(id);
            grid_News.Rebind();            
        }

        protected void btn_Refresh_Click(object sender, EventArgs e)
        {
            grid_News.Rebind();
        }
    }
}