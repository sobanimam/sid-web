<%@ Page Language="C#" AutoEventWireup="true" CodeFile="3tier.aspx.cs" Inherits="_3tier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .pannel-body {
            max-width: 40%;
            margin: 15px auto;
            border: 1px solid #a1c8d4;
        }

        .form-vertical {
            padding: 10px 15px;
        }

        span#lbl1, span#lbl2 {
            display: block;
            color: #5a39dc;
            margin-bottom: 5px;
            width: auto;
            text-align: left;
            font-size: 17px;
        }

        input#txt1, input#txt2 {
            width: 100%;
            box-sizing: border-box;
            outline: none;
            padding: 5px;
            box-shadow: 2px 2px 4px white;
            border-radius: 4px;
            border: 1px solid #a4badc;
        }

        .from-group {
            margin-bottom: 10px;
        }

        .btn {
            width: 50%;
            padding: 10px;
            border-radius: 1px;
            border: 1px solid #7c8bbf;
            outline: none;
            color: white;
            background-color: #9896fd;
            font-size: 16px;
            font-family: "Times New Roman";
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="pannel-body">
            <div class="form-vertical">
                <div class="from-group">
                    <asp:Label ID="lbl1" runat="server" Text="UserName" />
                    <asp:TextBox ID="txt1" runat="server" />
                </div>

                <div class="from-group">
                    <asp:Label ID="lbl2" runat="server" Text="Password" />
                    <asp:TextBox ID="txt2" runat="server" />
                </div>
                <div class="from-group">
                    <asp:Button ID="Button1" runat="server" CssClass="btn" Text="Login" OnClick="Button1_Click" />
                </div>
            </div>

        </div>
    </form>
</body>
</html>
