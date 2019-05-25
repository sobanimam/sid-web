using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ThreeTier.BAL;
using ThreeTier.DAL;
/// <summary>
/// Summary description for BLL
/// </summary>
/// 
namespace ThreeTier.BLL
{
    public class tblDataBLL
    {
        public string tblDataInsertBLL(tblDataBAL tdBal)
        {
            tblDataDAL tdDAL = new tblDataDAL();
            return tdDAL.tblDataInsertDAL(tdBal);
        }
        public string tblDataUpdateBLL(tblDataBAL tdBal)
        {
            tblDataDAL tdDAL = new tblDataDAL();
            return tdDAL.tblDataUpdateDAL(tdBal);
        }
    }

    public class tierDataBLL
    {
        public string tierInsertDataBLL(tierDataBAL tBAL)
        {
            tierDataDAL tDAL = new tierDataDAL();
            return tDAL.tierDataInsertDAL(tBAL);

        }
        public string tierDataSelectBLL(tierDataBAL tBAL)
        {

            tierDataDAL tDAL = new tierDataDAL();
            return tDAL.tierDataSelectDAL(tBAL);

        }

        public string tierDataSelectBLL(tblDataBAL tdBAL)
        {
            throw new NotImplementedException();
        }
    }

    public class pdataBLL
    {
        public string pdataInsertBLL(pdataBAL pBAL)
        {
            pdataDAL pDAL = new pdataDAL();
            return pDAL.pdataInsertDAL(pBAL);
        }
    }
}