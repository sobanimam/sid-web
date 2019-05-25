<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PortfolioManager.aspx.cs" Inherits="PortfolioManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PortfolioManager</title>
    <link href="Portfolio%20css/FormControl.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:600px; margin:50px auto;">
        <div class="panel">
            <div class="panel-header">
                <h3>Portfolio Details</h3>
            </div>
            <div class="panel-body">
                <div class="form-vertical">
                    <div class="form-group">
                        <label>Stock Name</label>
                        <input type="text"  runat="server" class="form-control" name="stockName" id="stockName" value="" />
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input type="number" runat="server" class="form-control" placeholder="Please Enter Buying or Selling Price" name="price" id="price" value="" />
                    </div>
                    <div class="form-group">
                        <label>Select Date</label>
                        <input type="date" runat="server" class="form-control" name="date" id="date" value="" />
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <input type="number" runat="server" class="form-control" name="quantity" id="quantity" value="" placeholder="Please Enter Quality" />
                    </div>
                    <div class="form-group">
                        <label>Trading</label>
                        <select name="option" id="option" runat="server" class="form-control">
                            <option value="buy" runat="server" selected>Buy</option>
                            <option value="sell">Sell</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <asp:Button ID="Add_Portfolio" runat="server" Text="Add" class="btn" OnClick="Add_Portfolio_Click" />
            </div>
        </div>

    </div>
    </form>
</body>
</html>
