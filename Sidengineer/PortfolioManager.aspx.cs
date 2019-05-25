using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
public partial class PortfolioManager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if(!IsPostBack)
        {
            if (Convert.ToString(Session["username"]) == "")
            {
                Response.Redirect("u_Login.aspx");
            }
            if (Convert.ToString(Request.QueryString["count"]) == "sid_key" )
            {
                Response.Write("<script>alert('Thanks For Login First Time Please Enter Your Portfolio Details')</script>");
            }
        }
    }
    
    protected void Add_Portfolio_Click(object sender, EventArgs e)
    {
        String name=Session["name"].ToString();
        String fpath = Convert.ToString(Application["fpath"]);
        String path = Server.MapPath(fpath);
        //String path = Server.MapPath("~/Portfolio_Data/Portfolio_Data.xlsx");
        
      //  Response.Write(path);
       int result = 0;
        OleDbConnection con = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;ReadOnly=False;HDR=Yes;\"");
        
        if(option.Value=="buy")
        {
            
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            String query1 = "select * from [Sheet1$] where [StockName]=@Stockname";
            OleDbCommand cmd1 = new OleDbCommand(query1,con);
            cmd1.Parameters.AddWithValue("Stockname", stockName.Value.ToUpper());
            OleDbDataAdapter da = new OleDbDataAdapter(cmd1);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                double oldbuyp=Convert.ToDouble(ds.Tables[0].Rows[0]["BuyPrice"]);
                double newbuyp = Convert.ToDouble(price.Value);
                long oldbuyq=Convert.ToInt64(ds.Tables[0].Rows[0]["BuyQ"]); //Find BuyQuantity from Database
                long newbuyq=Convert.ToInt64(quantity.Value);   //New Buy Quantity
                
                if (oldbuyp == 0)
               {
                   double investment = Convert.ToDouble(price.Value) * Convert.ToInt64(quantity.Value);
                   double remaining = Convert.ToInt64(ds.Tables[0].Rows[0]["Remaining"])+Convert.ToInt64(quantity.Value); //Here Remaining is present before buy so that Remaining is in minus(-)  
                    //String query = "update [Sheet1$] [BuyPrice],[BuyDate],[SellPrice],[SellDate],[BuyQ],[SellQ]) VALUES(@stockName,@buyPrice,@buyDate,@sellPrice,@sellDate,@buyq,@sellq)";
                   String query = "update [Sheet1$] set [BuyPrice]=?,[BuyDate]=?,[BuyQ]=?,[Investment]=?,[Remaining]=? where [StockName]=?";
                   OleDbCommand cmd = new OleDbCommand(query, con);
                   cmd.Parameters.AddWithValue("?", price.Value);
                   cmd.Parameters.AddWithValue("?", date.Value);               
                   cmd.Parameters.AddWithValue("?", quantity.Value);
                   cmd.Parameters.AddWithValue("?", investment);
                   cmd.Parameters.AddWithValue("?", remaining);
                   cmd.Parameters.AddWithValue("?", stockName.Value.ToUpper());
                    result = cmd.ExecuteNonQuery();
               }
                else if (oldbuyp > 0)
                {

                    double totalbuyq = oldbuyq + newbuyq;
                    double totalbuyp = (newbuyp * newbuyq + oldbuyp * oldbuyq) / totalbuyq;
                    double investment = totalbuyp * totalbuyq;
                    double remaining = Convert.ToInt64(ds.Tables[0].Rows[0]["Remaining"]) + Convert.ToInt64(quantity.Value);
                    String query = "update [Sheet1$] set [BuyPrice]=?,[BuyDate]=?,[BuyQ]=?,[Investment]=?,[Remaining]=? where [StockName]=?";
                    OleDbCommand cmd = new OleDbCommand(query, con);
                    cmd.Parameters.AddWithValue("?", totalbuyp);
                    cmd.Parameters.AddWithValue("?", date.Value);
                    cmd.Parameters.AddWithValue("?", totalbuyq);
                    cmd.Parameters.AddWithValue("?", investment);
                    cmd.Parameters.AddWithValue("?", remaining);
                    cmd.Parameters.AddWithValue("?", stockName.Value.ToUpper());
                    result = cmd.ExecuteNonQuery();
                }
            }
            else
            {
                double investment = Convert.ToDouble(price.Value) * Convert.ToInt64(quantity.Value);
                String query = "Insert into [Sheet1$] ([StockName],[BuyPrice],[BuyDate],[SellPrice],[SellDate],[BuyQ],[SellQ],[Investment],[Recover],[Remaining],[Gain]) VALUES(@stockName,@buyPrice,@buyDate,@sellPrice,@sellDate,@buyq,@sellq,@investment,@recover,@remaining,@gain)";
                OleDbCommand cmd = new OleDbCommand(query, con);
                cmd.Parameters.AddWithValue("stockName", stockName.Value.ToUpper());
                cmd.Parameters.AddWithValue("buyPrice", price.Value);
                cmd.Parameters.AddWithValue("buyDate", date.Value);
                cmd.Parameters.AddWithValue("sellPrice", 0);
                cmd.Parameters.AddWithValue("sellDate", 0);
                cmd.Parameters.AddWithValue("buyq", quantity.Value);
                cmd.Parameters.AddWithValue("sellq", 0);
                cmd.Parameters.AddWithValue("investment", investment);
                cmd.Parameters.AddWithValue("recover", 0);
                cmd.Parameters.AddWithValue("remaining", quantity.Value);
                cmd.Parameters.AddWithValue("gain",0);
                result = cmd.ExecuteNonQuery();
            }
            con.Close();
        }
        //Start To Enter Sell Data
        else 
        {
            
            String query1 = "select * from [Sheet1$] where [StockName]=@Stockname";
            con.Open();
            OleDbCommand cmd1 = new OleDbCommand(query1,con);
            cmd1.Parameters.AddWithValue("Stockname", stockName.Value.ToUpper());
            OleDbDataAdapter da = new OleDbDataAdapter(cmd1);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
               long sellingPrice=Convert.ToInt64(ds.Tables[0].Rows[0]["SellPrice"]);
               if (sellingPrice == 0)
                {
                   long newquantity=Convert.ToInt64(quantity.Value);
                   double recover = Convert.ToDouble(price.Value) * newquantity ;
                   double remaining = Convert.ToInt64(ds.Tables[0].Rows[0]["Remaining"])- newquantity;
                   double gain = (Convert.ToDouble(price.Value)-Convert.ToDouble(ds.Tables[0].Rows[0]["BuyPrice"]))*newquantity;
                   if (con.State == ConnectionState.Closed)
                   {
                        con.Open();
                   }  
                    //String query = "INSERT INTO [Sheet1$] ([SellPrice],[SellDate]) VALUES(@sellPrice,@sellDate) where [StockName]=@stockname";
                    String query = "update [Sheet1$] set [SellPrice]=?,[SellDate]=?,[SellQ]=?,[Recover]=?,[Remaining]=?,[Gain]=? where [StockName]=?";
                    OleDbCommand cmd = new OleDbCommand(query, con);
                    cmd.Parameters.AddWithValue("?", price.Value);
                    cmd.Parameters.AddWithValue("?", date.Value);
                    cmd.Parameters.AddWithValue("?",quantity.Value);
                    cmd.Parameters.AddWithValue("?", recover);
                    cmd.Parameters.AddWithValue("?", remaining);
                    cmd.Parameters.AddWithValue("?", gain); 
                    cmd.Parameters.AddWithValue("?", stockName.Value.ToUpper());
                    result = cmd.ExecuteNonQuery();
                }
               else if (sellingPrice > 0)
               {

                   long oldqauntity = Convert.ToInt64(ds.Tables[0].Rows[0]["SellQ"]);
                   long newqauntity = Convert.ToInt64(quantity.Value);
                   double totalqauntity = oldqauntity + newqauntity;
                   double newSellingPrice = (sellingPrice * oldqauntity + Convert.ToInt64(price.Value) * newqauntity) / totalqauntity;
                   double recover = newSellingPrice * totalqauntity;
                   double oldgain = Convert.ToDouble(ds.Tables[0].Rows[0]["Gain"]);
                   double newgain = ((Convert.ToInt64(price.Value) - (Convert.ToDouble(ds.Tables[0].Rows[0]["BuyPrice"]))) * newqauntity) + oldgain;
                   long remaining=(Convert.ToInt64(ds.Tables[0].Rows[0]["Remaining"])-newqauntity);
                   if (con.State == ConnectionState.Closed)
                   {
                       con.Open();
                   }
                   String query = "update [Sheet1$] set [SellPrice]=?,[SellDate]=?,[SellQ]=?,[Recover]=?,[Remaining]=?,[Gain]=? where [StockName]=?";
                   OleDbCommand cmd = new OleDbCommand(query, con);
                   cmd.Parameters.AddWithValue("?", newSellingPrice);
                   cmd.Parameters.AddWithValue("?", date.Value);
                   cmd.Parameters.AddWithValue("?", totalqauntity);
                   cmd.Parameters.AddWithValue("?",recover);
                   cmd.Parameters.AddWithValue("?", remaining);
                   cmd.Parameters.AddWithValue("?", newgain);
                   cmd.Parameters.AddWithValue("?", stockName.Value.ToUpper());
                   result = cmd.ExecuteNonQuery();
               }
            }
            else
               {
                   double recover = Convert.ToDouble(price.Value) * Convert.ToInt64(quantity.Value);
                   String query = "Insert into [Sheet1$] ([StockName],[BuyPrice],[BuyDate],[SellPrice],[SellDate],[BuyQ],[SellQ],[Investment],[Recover],[Remaining],[Gain]) VALUES(@stockName,@buyPrice,@buyDate,@sellPrice,@sellDate,@buyq,@sellq,@investment,@recover,@remaining,@gain)";
                   OleDbCommand cmd = new OleDbCommand(query, con);
                   cmd.Parameters.AddWithValue("stockName", stockName.Value.ToUpper());   
                    cmd.Parameters.AddWithValue("buyPrice", 0);
                   cmd.Parameters.AddWithValue("buyDate", 0);
                   cmd.Parameters.AddWithValue("sellPrice", price.Value);
                   cmd.Parameters.AddWithValue("sellDate", date.Value);
                   cmd.Parameters.AddWithValue("buyq", 0);
                   cmd.Parameters.AddWithValue("sellq", quantity.Value);
                   cmd.Parameters.AddWithValue("investment", 0);
                   cmd.Parameters.AddWithValue("recover", recover);
                   cmd.Parameters.AddWithValue("remaining",-Convert.ToInt64(quantity.Value));
                   cmd.Parameters.AddWithValue("gain", 0);
                   result = cmd.ExecuteNonQuery();
               }
            con.Close();
            
        }
        
        if (result > 0)
        {
            Response.Redirect("PortfolioHome.aspx");
            //Response.Write("<script>alert('Trading Successfully')</script>");
        }
        else
        {
            Response.Write("<script>alert('Trading Data Failed Please try again')</script>");
        }
        
    }
}