using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ThreeTier.BAL;
using ThreeTier.BLL;

public partial class _3tier : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        tblDataBAL tdBAL = new tblDataBAL();
        tdBAL.uname = txt1.Text;
        tdBAL.pswd = txt2.Text;
        tblDataBLL tdBLL = new tblDataBLL();
        string val = tdBLL.tblDataInsertBLL(tdBAL);
        
        Response.Write(val);

    }
}