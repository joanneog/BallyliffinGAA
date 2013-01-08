using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace Ballyliffin_Gaa.Admin
{
    public static class Commagent
    {

        public static void SendEmailFromCommAgent(string subject, string body, string to, string from)
        {
            try
            {
                SmtpClient mc = new SmtpClient("smtp.gmail.com", 587);
                MailMessage msg = new MailMessage(from, to, subject, body);
                mc.EnableSsl = true;
                mc.UseDefaultCredentials = false;
                mc.Credentials = new System.Net.NetworkCredential(from, "ballyliffingaa2012");
                msg.From = new MailAddress(from);
                mc.DeliveryMethod = SmtpDeliveryMethod.Network;
                mc.Timeout = 50000;
                msg.IsBodyHtml = true;

                mc.Send(msg);
            }
            catch (Exception ex)
            {
                
            }
        }

        public static void LogOutgoingEmail(string subject, string body, string to, string from)
        {

            BallyliffinDataContext db = new BallyliffinDataContext();
            db.sp_Emails_Insert(to, from, subject, body, DateTime.Now);
        }
    }
}