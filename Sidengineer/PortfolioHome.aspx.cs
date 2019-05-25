using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
public partial class PortfolioHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["name"]) != "")
        {
            lblusrname.Text="Welcome,Mr."+Session["name"].ToString();
            String fpath = Convert.ToString(Application["fpath"]);
            String path =Server.MapPath(fpath);
            //Response.Write(fpath);
            OleDbConnection con = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;ReadOnly=False;HDR=Yes;\"");
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            String query = "select * from [Sheet1$]";
            OleDbCommand cmd = new OleDbCommand(query, con);
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {

                rptData.DataSource = ds;
                rptData.DataBind();
            }
            else
            {
               
                Response.Redirect("PortfolioManager.aspx?count=sid_key");
            }
            con.Close();
        }
        else
        {
            Response.Redirect("u_Login.aspx");
        }
    }
    protected void rptData_ItemCommand(object source, RepeaterCommandEventArgs e)
    {/*
        if (e.CommandName == "Delete")
        {
           
            cmd = new SqlCommand("Delete From pdata Where Id=@id", con);
            cmd.Parameters.AddWithValue("@id", e.CommandArgument);
            cmd.ExecuteNonQuery();
            con.Close();
            rptDataFun();

        }
        else if (e.CommandName == "Edit")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("post.aspx?mode=Edit&id=" + id);
        }
        */
    }
}