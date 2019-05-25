using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Excel=Microsoft.Office.Interop.Excel;


public partial class u_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        String fold = Server.MapPath("~/UserManager/");
        String path = Server.MapPath("~/UserData/UserRegistration.xlsx");
        String name="";
        String query1 = "select * from [Sheet1$] where [Email]=? and [Password]=?"; 
        OleDbConnection con = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;ReadOnly=False;HDR=Yes;\"");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        } 
         OleDbCommand cmd = new OleDbCommand(query1,con);
            cmd.Parameters.AddWithValue("?",txtEmail.Text);
            cmd.Parameters.AddWithValue("?",txtPassword.Text);
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                String status = ds.Tables[0].Rows[0]["Status"].ToString();
                Session["username"] = ds.Tables[0].Rows[0]["Email"].ToString();
                name = ds.Tables[0].Rows[0]["FirstName"].ToString();
                String lastname = ds.Tables[0].Rows[0]["LastName"].ToString();
                Session["name"] = name;
                String fullname = name + lastname; //It contain fullname
                Application["fullname"] = fullname; //This is for FullName
               
                if (status == "Deactive")
                {
                    Application["vfcode"] = ds.Tables[0].Rows[0]["VfCode"].ToString();
                    Response.Redirect("verify.aspx");
                }//Status
                else
                {
                    Application["shortpath"]="UserManager/" + fullname + "/" + fullname + ".xlsx";
                    Application["fpath"] = "~/UserManager/" + fullname + "\\" + fullname + ".xlsx";   //heare go path name
                    Response.Redirect("PortfolioHome.aspx");
                }
            }//Rows.count
            else
            {
                lbl_error.Enabled = true;
                lbl_error.Text = "Please Enter Correct UserName/Password";
            }
    }
}