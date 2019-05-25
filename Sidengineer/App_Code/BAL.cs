using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BAL
/// </summary>
/// 
namespace ThreeTier.BAL
{
    public class tblDataBAL
    {
        public string uname { get; set; }
        public string pswd { get; set; }
    }
    public class tierDataBAL
    {
        public string username { get; set; }
        public string password { get; set; }
    }

    public class pdataBAL
    {
        public string name { set;get; }
        public string cif { set; get; }
        public string price { set; get; }
        public string opdate { set; get; }
    }
}