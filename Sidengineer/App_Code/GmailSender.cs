using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;

/// <summary>
/// Summary description for GmailSender
/// </summary>
public class GmailSender
{
	public GmailSender()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static bool SendMail(string gMailAccount, string password, string to, string subject, string message)
    {
        try
        {
            NetworkCredential loginInfo = new NetworkCredential(gMailAccount, password);
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(gMailAccount,"SID Engineer");
            msg.To.Add(new MailAddress(to));
            msg.Subject = subject;
            msg.Body = message;
            msg.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.Port = 25;
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = loginInfo;
            client.Send(msg);

            return true;
        }
        catch (Exception)
        {
            return false;
        }

    }
    public static bool SendMailWithAttachement(string gMailAccount, string password, string to, string subject, string message,string path)
    {
        try
        {
            NetworkCredential loginInfo = new NetworkCredential(gMailAccount, password);
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(gMailAccount,"SobanImam");
            msg.To.Add(new MailAddress(to));
            msg.Subject = subject;
            msg.Body = message;
            msg.IsBodyHtml = true;
            msg.Attachments.Add(new Attachment(path));
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = loginInfo;
            client.Send(msg);

            return true;
        }
        catch (Exception)
        {
            return false;
        }

    }
}
