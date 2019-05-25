using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        String path = Server.MapPath("~/UserData/UserRegistration.xlsx");
        int result = 0;
        String dob=txtdate.Text+"/"+month.SelectedValue+"/"+txtyear.Text;
        OleDbConnection con = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;ReadOnly=False;HDR=Yes;\"");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        String vcode = Guid.NewGuid().ToString();
        string[] vcode1 = vcode.Split('-');
        
        String query = "Insert into [Sheet1$] ([Email],[FirstName],[LastName],[Password],[MobileNo],[Gender],[Dob],[VfCode],[Status]) VALUES(@email,@firstname,@lastname,@pswd,@mobile,@gender,@dob,@vf,status)";
        OleDbCommand cmd = new OleDbCommand(query, con);
        cmd.Parameters.AddWithValue("email", txtEmail.Text);
        cmd.Parameters.AddWithValue("firstname", txtFirstName.Text);
        cmd.Parameters.AddWithValue("lastname",txtLastName.Text);
        cmd.Parameters.AddWithValue("pswd",txtpasswd.Text);
        cmd.Parameters.AddWithValue("mobile", mobile.Text);
        cmd.Parameters.AddWithValue("gender",gender.SelectedValue);
        cmd.Parameters.AddWithValue("dob",dob);
        cmd.Parameters.AddWithValue("vf", vcode1[1]);
        cmd.Parameters.AddWithValue("status", "Deactive");
        String msg1 = "Thank you for joining us<br>Your Email Id/Username=" + txtEmail.Text + "<br>" + "Your Verify Code=" + vcode1[1] + "<br>Good Luck";
        MailMessage msg =new MailMessage();
        msg.From = new MailAddress("sid@sidengineer.in");
        msg.To.Add(txtEmail.Text);
        msg.Subject = "Thank You For Registration";
        msg.Body = "Thank you for joining us<br>Your Email Id/Username=" + txtEmail.Text + "<br>" + "Your Verify Code=" +vcode1[1] + "<br>Good Luck";
        msg.IsBodyHtml = true;
        // MailMessage instance to a specified SMTP server
        SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
        smtp.Credentials = new System.Net.NetworkCredential("sid@sidengineer.in", "Soban61161$");
        smtp.EnableSsl = false;
     
        // Sending the email
        smtp.Send(msg);
{
		result = cmd.ExecuteNonQuery();
        con.Close();

}// destroy the message after sent
        msg.Dispose();
		if(result>0)
		{
			lbl_error.Enabled = true;
            lbl_error.Text = "Registration Successfully Your verify code and account detail have been sent on your email account...";
		}
        else
        {
            
            lbl_error.Enabled = true;
            lbl_error.Text = "Message sending failed pls check your network connection";
            con.Close();
        }

        if (result > 0)
        {

            //Response.Write("<script>alert('Registration Successfully')</script>");
        }
        else
        {
            //Response.Write("<script>alert('Registration Faild Please Try Again')</script>");
        }
    }
}