using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ThreeTier.BAL;
using ThreeTier.Connector;
using System.Data.SqlClient;
using System.Data;
/// <summary>
/// Summary description for DAL
/// </summary>
namespace ThreeTier.DAL
{
    public class tblDataDAL
    {
        DbConnector dbc = new DbConnector();
        public string tblDataInsertDAL(tblDataBAL tdBAL)
        {
            dbc.mycon();
            dbc.cmd = new SqlCommand("Insert into tier values(@nm,@pswd)",dbc.con);
            dbc.cmd.Parameters.AddWithValue("@nm",tdBAL.uname);
            dbc.cmd.Parameters.AddWithValue("@pswd",tdBAL.pswd);
            dbc.cmd.ExecuteNonQuery();
            dbc.con.Close();
            return "Successfully Stored Data";
        }
        public string tblDataUpdateDAL(tblDataBAL tdBal)
        {
            dbc.mycon();
            dbc.cmd = new SqlCommand("Update tier set password='@pswd' where uname='@nm' ",dbc.con);
            dbc.cmd.Parameters.AddWithValue("@nm",tdBal.uname);
            dbc.cmd.Parameters.AddWithValue("@pswd", tdBal.pswd);
            dbc.cmd.ExecuteNonQuery();
            return "Data Updated Succesfully";
        }
    }

    public class tierDataDAL
    {
        DbConnector dbc = new DbConnector();
        public string tierDataInsertDAL(tierDataBAL tBAL)
        {
            dbc.mycon();
            dbc.cmd = new SqlCommand("Insert into tier values(@nm,@pswd)",dbc.con);
            dbc.cmd.Parameters.AddWithValue("@nm",tBAL.username);
            dbc.cmd.Parameters.AddWithValue("@pswd",tBAL.password);
            dbc.cmd.ExecuteNonQuery();
            return "Data success fully inserted";
        }

        public string tierDataSelectDAL(tierDataBAL tBAL)
        {
            dbc.mycon();
            dbc.cmd = new SqlCommand("select * from tier where uname=@un",dbc.con);
            dbc.cmd.Parameters.AddWithValue("un",tBAL.username);
            SqlDataAdapter da = new SqlDataAdapter(dbc.cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count>0)
            {
                string s1 = ds.Tables[0].Rows[0][0].ToString();
                string s2 = ds.Tables[0].Rows[0]["password"].ToString();
                return s1+"<br>"+s2;
            }
            else
            {
                return "Data is not avaliable";
            }
           
        }
    }

    public class pdataDAL
    {
        
        public string pdataInsertDAL(pdataBAL pBAL)
        {
            DbConnector dbc = new DbConnector();
            dbc.mycon();
            dbc.cmd = new SqlCommand("Insert into pdata values(@nm,@cif,@pr,@od)",dbc.con);
            dbc.cmd.Parameters.AddWithValue("@nm",pBAL.name);
            dbc.cmd.Parameters.AddWithValue("@cif",pBAL.cif);
            dbc.cmd.Parameters.AddWithValue("@pr", pBAL.price);
            dbc.cmd.Parameters.AddWithValue("@od",pBAL.opdate);
            dbc.cmd.ExecuteNonQuery();
            return "Data Inserted Succesffully";
        }
    }

}