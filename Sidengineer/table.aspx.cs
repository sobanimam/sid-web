using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
public partial class table : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }


    [WebMethod]
    public static string RegInsert(string name, string cif,string rupee,string opdate)
    {
        using (SqlConnection con = new SqlConnection("Data Source=184.168.194.53;Integrated Security=False;User ID=sobanimam;Password=soban61161$;Connect Timeout=15;Encrypt=False;Packet Size=4096"))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into pdata values(@nm,@cif,@rs,@dt)", con);
            cmd.Parameters.AddWithValue("@nm", name);
            cmd.Parameters.AddWithValue("@cif", cif);
            cmd.Parameters.AddWithValue("@rs", rupee);
            cmd.Parameters.AddWithValue("@dt", opdate);
            cmd.ExecuteNonQuery();
        }
        return "Successfully Store Your Data.";
    }

   

}