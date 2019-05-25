<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        *
        {
            margin:0px;
            padding:0px;
        }
        .tbl
        {
            display: block;
            border: 1px solid;
            margin: 0px auto;
            width: 550px;
            margin-top: 150px;

        }

        .row1
        {
            display: block;
            /* border: 1px solid red; */
            margin: 0px auto;
            width: 450px;
        }
        .col1
        {
                float: left;
                width: 200px;
                border:1px solid;
                text-align:center;
        }
        .clearfix:after
        {
            clear:both;
            content:"";
            display:block;

        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="tbl">
        <div class="row1 clearfix">
            <div class="col1">
                <p>UserName</p>
            </div>
            <div class="col1">
                <asp:TextBox ID="txt1" runat="server"></asp:TextBox>
            </div>
        </div>
       <div class="row1 clearfix">
         <div class="col1">
                <p>Password</p>
            </div>
            <div class="col1">
                <asp:TextBox ID="txt2" runat="server"></asp:TextBox>
            </div>
        </div>

         <div class="row1 clearfix">
         <div class="col1">
                <asp:Button ID="btn1" runat="server" Text="Login" OnClick="btn1_Click" />
            </div>
          </div>
    </div>
    </form>
</body>
</html>
