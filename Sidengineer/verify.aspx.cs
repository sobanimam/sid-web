using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Excel = Microsoft.Office.Interop.Excel;

public partial class verify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["username"]) == "" || Convert.ToString(Application["vfcode"]) == "")
        {
            Response.Redirect("u_Login.aspx");
        }
    }
    protected void btnverify_Click(object sender, EventArgs e)
    {
        String fold = Server.MapPath("~/UserManager/");
        String path = Server.MapPath("~/UserData/UserRegistration.xlsx");
        OleDbConnection con = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;ReadOnly=False;HDR=Yes;\"");
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        OleDbCommand cmd;
        string vf = Convert.ToString(Application["vfcode"]);
        if (vf == txtverify.Text)
        {
            String fullname = Convert.ToString(Application["fullname"]);

            //Perform Update In Status in database
            cmd = new OleDbCommand("update [Sheet1$] set status=@st where Email=@em", con);
            cmd.Parameters.AddWithValue("st", "active");
            cmd.Parameters.AddWithValue("em", Convert.ToString(Session["username"]));
            cmd.ExecuteNonQuery();
            //Update over
            Application["shortpath"] = "UserManager/" + fullname + "/" + fullname + ".xlsx";
            Application["fpath"] = "~/UserManager/" + fullname + "\\" + fullname + ".xlsx";   //heare go path name
            //Create Directory name with user
            DirectoryInfo di = new DirectoryInfo(fold + "\\" + fullname);
            if (di.Exists == false)
            {
                di.Create();
                String fpath = "~/UserManager/" + fullname;
                String expath = Server.MapPath(fpath) + "\\" + fullname + ".xlsx";

                if (File.Exists(expath))
                {
                    File.Delete(expath);
                }

                //Make Excel Sheet

                Excel.Application oApp;
                Excel.Worksheet oSheet;
                Excel.Workbook oBook;
                oApp = new Excel.Application();
                oBook = oApp.Workbooks.Add();
                oSheet = (Excel.Worksheet)oBook.Worksheets.get_Item(1);
                oSheet.Cells[1, 1] = "StockName";
                oSheet.Cells[1, 2] = "BuyPrice";
                oSheet.Cells[1, 3] = "BuyDate";
                oSheet.Cells[1, 4] = "SellPrice";
                oSheet.Cells[1, 5] = "SellDate";
                oSheet.Cells[1, 6] = "BuyQ";
                oSheet.Cells[1, 7] = "SellQ";
                oSheet.Cells[1, 8] = "Investment";
                oSheet.Cells[1, 9] = "Recover";
                oSheet.Cells[1, 10] = "Remaining";
                oSheet.Cells[1, 11] = "Gain";
                oBook.SaveAs(expath);
                oBook.Close();
                oApp.Quit();
                con.Close();
                Response.Redirect("PortfolioManager.aspx?count=sid_key");
            }
            else
            {
                con.Close();
                Response.Redirect("PortfolioHome.aspx");
            }




        }
        else
        {
            lbl_error.Enabled = true;
            lbl_error.Text = "Enter Valid Verification Code";

        }
    }
}
