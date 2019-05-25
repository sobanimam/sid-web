using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class logform : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
 protected void btn1_Click(object sender, EventArgs e)
            {
                string st = ("Data Source=184.168.194.53;Integrated Security=False;User ID=sobanimam;Password=soban61161$;Connect Timeout=15;Encrypt=False;Packet Size=4096");
               SqlConnection con = new SqlConnection(st);
                con.Open();
 SqlCommand cmd = new SqlCommand("select * from log where uname=@un", con);
              cmd.Parameters.AddWithValue("@un", txt1.Text);
              DataSet ds = new DataSet();
             SqlDataAdapter da = new SqlDataAdapter(cmd);
             da.Fill(ds);
              if (ds.Tables[0].Rows.Count > 0)
              {
                  if (ds.Tables[0].Rows[0]["pass"].ToString() == txt2.Text)
                  {
                      Response.Redirect("post.aspx");

                  }
                  else
                 {
                      Response.Write("Please Check username or password");

                  }
             }
              else
              {
                  Response.Write("Please Check username or password");
              }

			
            }


}