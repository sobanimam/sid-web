<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PortfolioHome.aspx.cs" Inherits="PortfolioHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
    .TopBar {
    margin: 4% 0%;
    text-align: right;
    padding: 15px;
}
    a.Add {
    background-color: #0f9cff;
    padding: 2% 7%;
    font-size: 22px;
    text-decoration:  none;
    color: white;
}
    i.icon-plus-sign {padding-left:  15px;}

    span#lblusrname {
    left: 0;
    display: block;
    width: 10%;
    content: "";
    clear: both;
    font-size: 25px;
    color: #1c3647;
    font-family: sans-serif;
    text-shadow: #b3b3b9 2px 2px 9px;
}
    a.export {
    background-color: #4468ee;
    width:  50%;
    padding: 19px 5%;
    font-size:  20px;
    color: white;
    text-decoration:  none;
}
        a:hover {
            color:white;
            text-decoration:none;
        }
.footer {display:  block;text-align:right;margin: 2% 5%;padding: 10px;}

    </style>
    <script src="jquery-3.2.1.min.js"></script>
    <meta name="description" content="Static &amp; Dynamic Tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />  
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />
    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="assets/css/ace-responsive.min.css" />
    <link rel="stylesheet" href="assets/css/ace-skins.min.css" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="TopBar">
            <asp:Label ID="lblusrname" runat="server" CssClass="lbluser"></asp:Label>
            <a href="PortfolioManager.aspx" class="Add">Add<i class="icon-plus-sign"></i></a>
        </div>
    <div class="row-fluid">

                            <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                       
                                        <th>StockName</th>
                                        <th>BuyPrice</th>
                                        <th>BuyDate</th>
                                        <th>SellPrice</th>
                                        <th>SellDate</th>
                                        <th>BuyQ</th>
                                        <th>SellQ</th>
                                        <th>Investment</th>
                                        <th>Recover</th>
                                        <th class="hidden-phone">
                                            <i class="icon-time bigger-110 hidden-phone"></i>
                                            Remaining
                                        </th>
                                        <th>Gain</th>

                                        <th></th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <asp:Repeater ID="rptData" runat="server" OnItemCommand="rptData_ItemCommand">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <%#Eval("StockName") %>
                                                </td>
                                                <td><%#Eval("BuyPrice") %></td>
                                                <td><%#Eval("BuyDate") %></td>
                                                <td><%#Eval("SellPrice") %></td>
                                                <td><%#Eval("SellDate") %></td>
                                                <td><%#Eval("BuyQ") %></td>
                                                <td><%#Eval("SellQ") %></td>
                                                <td><%#Eval("Investment") %></td>
                                                <td><%#Eval("Recover") %></td>
                                                <td><%#Eval("Remaining") %></td>
                                                <td class="hidden-480">
                                                    <%#Eval("Gain") %>
                                                </td>
                                                <td class="td-actions">
                            <div class="hidden-phone visible-desktop action-buttons">
                                <asp:LinkButton CssClass="green" CommandName="Edit" CommandArgument='<%#Eval("StockName") %>' ID="lnkEdit1" runat="server">
                                    <i class="icon-pencil bigger-130"></i>
                                </asp:LinkButton>
                                <asp:LinkButton CssClass="red" CommandName="Delete" CommandArgument='<%#Eval("StockName") %>' ID="lnkDeleteDT" runat="server">
                                                    <i class="icon-trash bigger-120"></i>
                                </asp:LinkButton>
                            </div>

                            <div class="hidden-desktop visible-phone">
                                <div class="inline position-relative">
                                    <button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
                                        <i class="icon-caret-down icon-only bigger-120"></i>
                                    </button>

                                    <ul class="dropdown-menu dropdown-icon-only dropdown-yellow pull-right dropdown-caret dropdown-close">


                                        <li>
                                            <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
                                                <span class="green">
                                                    <i class="icon-edit bigger-120"></i>
                                                </span>
                                            </a>
                                        </li>

                                        <li>
                                            <asp:LinkButton CssClass="tooltip-error" CommandName="Delete" CommandArgument='<%#Eval("StockName") %>' ID="lnkDelete" runat="server">
                                                 <span class="red">
                                                    <i class="icon-trash bigger-120"></i>
                                                </span>
                                            </asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>

        <div class="footer">
            <a href="<%= Convert.ToString(Application["shortpath"]) %>" class="export" >Export</a>
           
            
        </div>
    </div>
    </form>
     <script type="text/javascript">
         window.jQuery || document.write("<script src='../assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
    </script>
   
          <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript">
            $(function () {
                var oTable1 = $('#sample-table-2').dataTable({
                    "aoColumns": [
                      null, null, null, null, null,null, null, null, null, null,null,
                      { "bSortable": false }
                    ]
                });

            })

        </script>
</body>
</html>
