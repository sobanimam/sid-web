using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using System.Data.OleDb;

namespace WebApplication
{
    public partial class post : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        void mycon()
        {
            con = new SqlConnection(@"Data Source=SQL5025.site4now.net;Initial Catalog=DB_A3E5EB_sobanimam;User Id=DB_A3E5EB_sobanimam_admin;Password=Soban61161");
            con.Open();
        }
        void rptDataFun()
        {
            /* mycon();
            cmd = new SqlCommand("select * from pdata", con);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            rptData.DataSource = ds;
            rptData.DataBind();
        
             */

            //Read Data from ExcelSheet
	//G:\PleskVhosts\sidengineer.in\sample.aspx\post1.xlsx
            string path = Server.MapPath("post1.xlsx");
//Response.Write(path);
OleDbConnection DbCon = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;ReadOnly=False;HDR=Yes;\"");
            //making query    
            //Providing connection    
            //checking that connection state is closed or not if closed the     
            //open the connection    
            int i = 0;
            string query = "select * from [Sheet1$]";
            DbCon.Open();
            OleDbCommand cmd = new OleDbCommand(query, DbCon);
            // Create new OleDbDataAdapter
            OleDbDataAdapter oleda = new OleDbDataAdapter(cmd);
            // Create a DataSet which will hold the data extracted from the worksheet.
            DataSet ds = new DataSet();
            // Fill the DataSet from the data extracted from the worksheet.
            oleda.Fill(ds);
            rptData.DataSource = ds;
            rptData.DataBind();
            DbCon.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Server.ScriptTimeout = 300;

            try
            {
                rptDataFun();
            }
            catch (Exception e1)
            {

                Response.Write(e1);
            }

            finally
            {
				//con.Close();
            }

        }

        /* protected void Button1_Click(object sender, EventArgs e)
         {
             pdataBAL pBAL = new pdataBAL();
             pBAL.name = txt1.Text;
             pBAL.cif = txt2.Text;
             pBAL.price = txt3.Text;
             pBAL.opdate = txt4.Text;
             pdataBLL pBLL = new pdataBLL();
             string val=pBLL.pdataInsertBLL(pBAL);
             Response.Write(val);
         }
         */


        /*
        protected void Button2_Click(object sender, EventArgs e)
        {
        
            GridView1.Visible = true;
        }
         */


        protected void rptData_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                mycon();
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

        }

        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string RegInsert(string name, string cif, string rupee, string opdate)
        {

string path = "G:\\PleskVhosts\\sidengineer.in\\sample.aspx\\post1.xlsx";
            OleDbConnection DbCon = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;ReadOnly=False;HDR=Yes;\"");
            string query = "INSERT INTO [Sheet1$] ([ID], [Name],[CIF],[Amount],[Opendate]) VALUES(@id,@name,@cif,@amount,@opendate)";
            string select_query = "select * from [Sheet1$]";
            DbCon.Open();
            OleDbCommand cmd = new OleDbCommand(query, DbCon);
            OleDbCommand cmd_select = new OleDbCommand(select_query, DbCon);

            // Create new OleDbDataAdapter
            OleDbDataAdapter oleda = new OleDbDataAdapter(cmd_select);
            // Create a DataSet which will hold the data extracted from the worksheet.
            DataSet ds = new DataSet();
            // Fill the DataSet from the data extracted from the worksheet.
            oleda.Fill(ds);
            //


            cmd.Parameters.AddWithValue("id", ds.Tables[0].Rows.Count+1);
            cmd.Parameters.AddWithValue("name", name);
            cmd.Parameters.AddWithValue("cif", cif);
            cmd.Parameters.AddWithValue("amount", rupee);
            cmd.Parameters.AddWithValue("opendate", opdate);
            int i = cmd.ExecuteNonQuery();
            DbCon.Close();

            return "Successfully Store Your Data.";

        }

    }
}
