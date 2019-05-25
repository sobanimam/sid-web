<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cssgrid.aspx.cs" Inherits="cssgrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Css Grid</title>
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }

        .row
        {
            margin-left:-30px;

        }
        .row:before,.row:after
        {
            content:"";
            display:block;
            line-height:0;
        }
        .row:after
        {
            clear:both;
        }

        [class*="col-"]
        {
            margin-left:30px;
            float:left;
            min-height:20px;
        }
        .container {
            width: 1170px;
            margin: 0px auto;
        }

        .col-1 {
            width: 70px;
        }

        .col-2 {
            width: 170px;
        }

        .col-3 {
            width:270px;
        }

        .col-4 {
            width:370px;
            
        }

        .col-5 {
            width:470px;
        }

        .col-6 {
            width:570px;
        }

        .col-7 {
            width:670px;
        }

        .col-8 {
            width:770px;
        }

        .col-9 {
            width:870px;
        }

        .col-10 {
            width:970px;
        }

        .col-11 {
            width:1070px;
        }


        .col-12 {
            width:1170px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-3">HELLO</div>
                <div class="col-3">HI </div>
                <div class="col-3">HOw</div>
                <div class="col-3">U</div>
            </div>

        </div>
    </form>
</body>
</html>
