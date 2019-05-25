<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        .tbl
        {
            
             width: 800px;
             display: block;
             color: red;
             height: 300px;
             /*border: 1px solid;*/
             float: left;
        }
        .rw1
        {
            display: block;
           /* border: 1px solid black;*/
            height: 50px;
            margin: 1px 1px;
        }
        .rw2
        {
            display: block;
           /* border: 1px solid black;*/
            height: 50px;
            margin: 1px 1px;
        }
        .rw1 .cl1
        {
            display: block;
            border: 1px solid red;
            height: inherit;
            float: left;
            width:263px;
            
        }
        p{
            text-align:center;
        }
        .clearfix:after{

            content:"";
            clear:both;
            display:block;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="main">
    <div id="tbl1" class="tbl clearfix">
        <div id="rw-1" class="rw1 clearfix">
            <div id="cl-1" class="cl1">
                <p>Name</p>
            </div>
            <div id="cl-2" class="cl1">
                <p>Number</p>
            </div>

            <div id="cl-3" class="cl1">
                <p>ID</p>

            </div>
            </div>
           <!-Row-2-->
            <div id="rw-2" class="rw1">
            <div id="cl-1" class="cl1">
                <p>Soban</p>
            </div>
            <div id="cl-2" class="cl1">
                <p>012</p>
            </div>

            <div id="cl-3" class="cl1">
                <p>Sid</p>

            </div>


        

    </div>

    </div>
    </form>
</body>
</html>
