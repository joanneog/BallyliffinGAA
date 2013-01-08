using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Ballyliffin_Gaa.Admin
{
    public partial class NewsLetter : System.Web.UI.Page
    {
        public delegate void delGenerate();
        public delegate void delSend(string subject, string body, string to, string from);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            delSend ds = Commagent.SendEmailFromCommAgent;
            ds += Commagent.LogOutgoingEmail;

            BallyliffinDataContext db = new BallyliffinDataContext();
            List<sp_email_getAddressesResult> emailAddresses = db.sp_email_getAddresses().ToList();
            foreach (var email in emailAddresses)
            {
                ds("Ballyliffin GAA NeswLetter " + DateTime.Now.ToShortDateString(), txt_Body.Content, email.EmailAddress, "ballyliffinGAA@gmail.com");
            }
            Response.Redirect("Emails_List.aspx?returnurl=Default.aspx");
            
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            delGenerate dg = GenerateNewsLetter;
            dg += VisibleOnGenerate;
            dg();

        }

        private void GenerateNewsLetter()
        {
            BallyliffinDataContext db = new BallyliffinDataContext();
            List<sp_NewsLetter_ContentsResult> stories = db.sp_NewsLetter_Contents().ToList();

            foreach (var i in stories)
            {
                string newsletter = string.Format("{0}{1}{2}{3:d}{4}{5}{6}{7}",
                                                    "<div style='padding:30px;font-family:Arial;'><p style='color: #1b5d04;font-size:16px;font-weight:bold;'>", //0
                                                    i.NewsHeadLine, //1 
                                                    "</p><hr/>", //2
                                                    i.NewsDate, //3
                                                    "<br/><br/>",//4
                                                    "<div>",//5
                                                    i.NewsContent,//6
                                                    "</div></div>" //7

                                                    );
                txt_Body.Content += newsletter;
            }
        }

        private void VisibleOnGenerate()
        {
            divInfo.Visible = false;
            txt_Body.Visible = true;
            btnSend.Visible = true;
        }

        
    }
}