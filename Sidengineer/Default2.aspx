<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Table ID="tbl1" runat="server">
            <asp:TableRow>
               <asp:TableCell>

                   <asp:Label ID="lbl1" runat="server" Text="Enter Ur name">

                   </asp:Label>
               </asp:TableCell>
                 <asp:TableCell>
                   <asp:TextBox ID="txt1" runat="server"></asp:TextBox>
                </asp:TableCell>
                
            </asp:TableRow>
            <asp:TableRow>
                 <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                   <asp:Button ID="btn1" runat="server" Text="submit"></asp:Button>
                </asp:TableCell>
            </asp:TableRow>

        </asp:Table>
    </div>
    </form>
</body>
</html>
