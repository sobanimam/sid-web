using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for DbConnector
/// </summary>
/// 
namespace ThreeTier.Connector
{
    public class DbConnector
    {
        public SqlConnection con;
        public SqlCommand cmd;

        public void mycon()
        {
            con=new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\post1.mdf;Integrated Security=True");
            con.Open();
        }
    }
}