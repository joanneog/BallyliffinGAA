using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Ballyliffin_Gaa.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEmail_Click(object sender, EventArgs e)
        {

        }

        protected void ddl_Roles_ItemsRequested(object sender, Telerik.Web.UI.RadComboBoxItemsRequestedEventArgs e)
        {
            BallyliffinDataContext db = new BallyliffinDataContext();

            List<sp_MembersByRole_ShortViewResult> roles = db.sp_MembersByRole_ShortView().ToList();

            foreach (sp_MembersByRole_ShortViewResult role in roles)
            {
                RadComboBoxItem item = new RadComboBoxItem();

                item.Text = (string)role.RoleDesc;
                item.Value = role.RoleID.ToString();


                item.Attributes.Add("RoleDesc", role.RoleDesc);
                item.Attributes.Add("Total", role.Total.Value.ToString());


                ddl_Roles.Items.Add(item);

                item.DataBind();
            }
        }
        protected void ddl_Roles_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Response.Redirect("~/Admin/Members_List.aspx?RoleID=" + e.Value + "&returnurl=~/Admin/Default.aspx");
        }
    }
}