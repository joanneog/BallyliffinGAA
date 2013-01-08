using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ballyliffin_Gaa.Admin
{
    public partial class Emails_Reminders : System.Web.UI.Page
    {
        public delegate void delReminders();
        public delegate void delSend(string subject, string body, string to, string from);

        protected void Page_Load(object sender, EventArgs e)
        {
            BallyliffinDataContext db = new BallyliffinDataContext();
            if (db.sp_Email_ReminderLastSent().Count() > 1)
            lbl_lastSent.Text = "The last set of reminders was sent on " + db.sp_Email_ReminderLastSent().SingleOrDefault().SentDate.ToShortDateString();
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            delReminders dr = SendFReminders;
            dr += ShowMessage;
            dr();
        }

        private static void SendFReminders()
        {
            delSend ds = Commagent.SendEmailFromCommAgent;
            ds += Commagent.LogOutgoingEmail;

            BallyliffinDataContext db = new BallyliffinDataContext();
            List<sp_Email_MatchRemindersResult> reminders = db.sp_Email_MatchReminders().ToList();

            string body;

            foreach (sp_Email_MatchRemindersResult r in reminders)
            {
                body = string.Format("Dear {5} {6} \r\n\r\n You have a match on {0:d} at {1:t} \r\n {2} v {3} \r\n at {4}"
                                        , r.MatchDate, r.MatchDate, r.TeamA, r.TeamB, r.VenueDesc, r.FirstName, r.LastName);
                ds("Match Reminder", body, r.EmailAddress, "ballyliffinGAA@gmail.com");
            }
        }

        private void ShowMessage()
        {
            BallyliffinDataContext db = new BallyliffinDataContext();
            divInfo.InnerText = db.sp_Email_MatchReminders().Count().ToString() + " Email Reminders have been sent to members!";
        }
    }
}