using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ballyliffin_Gaa.Admin;

namespace Ballyliffin_Gaa
{
    public partial class Emails_Compose : System.Web.UI.Page
    {
        public delegate void delSend(string subject, string body, string to, string from);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Send_Click(object sender, EventArgs e)
        {
            delSend ds = Commagent.SendEmailFromCommAgent;
            ds += Commagent.LogOutgoingEmail;

            ds(txt_Subject.Text, txt_Body.Content, txt_To.Text, "ballyliffinGAA@gmail.com");
            
            Response.Redirect("Emails_List.aspx?returnurl=Default.aspx");
        }
    }
}