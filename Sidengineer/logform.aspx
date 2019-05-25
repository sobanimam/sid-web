<%@ Page Language="C#" AutoEventWireup="true" CodeFile="logform.aspx.cs" Inherits="logform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }

        .pannel {
            border: 1px solid #8fa8de;
        }

        .pannel-header {
            border-bottom: 2px solid #8fa8de;
            background-color: #a0c5e8;
            padding: 10px;
            color: white;
            font-family: Times New Roman;
        }


        .form-group {
            margin-bottom: 10px;
        }

        .pannel-body {
            padding: 20px;
        }

        .form-vertical .form-group span#lbl1 {
            display: block;
            width: auto;
            margin-bottom: 5px;
            text-align: left;
        }


        .form-vertical .form-group .form-control {
            width: 100%;
            box-sizing: border-box;
        }

        .form-group .form-control {
            outline: none;
            border: 1px solid #7a797f75;
            border-radius: 5px;
            padding: 5px;
            transition: 0.5s Box-Shadow;
        }


            .form-group .form-control:focus {
                box-shadow: 0px 0px 0px 2px #f4f6f6;
            }
            .pannel-footer {
    padding: 10px;
    border-top: 2px solid #8fa8de;
    background-color: #a0c5e8;
}

.pannel-footer .btn {
    width: auto;
    padding: 5px 50px;
    font-size: 15px;
    color: white;
    background-color: #3496f2;
    border: 1px solid #323ec3;
    cursor: pointer;
    border-radius: 2px;
    font-family: Times New Roman;
}

.pannel-footer .btn:hover {
    box-shadow: 0px 0px 0px 2px #1a8afd;
}

.pannel-footer span#Label2 {
    text-align: right;
    float: right;
    padding: 5px;
    color: #ee0f9f;
    font-family: Times New Roman;
    padding-top: 15px;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 600px; margin: 50px auto">
            <div class="pannel">
                <div class="pannel-header">
                    <h3>Login</h3>
                </div>

                <div class="pannel-body">
                    <div class="form-vertical">
                        <div class="form-group">
                            <asp:Label ID="lbl1" Text="UserName" runat="server" />
                            <asp:TextBox ID="txt1" CssClass="form-control" runat="server" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="Label1" Text="Password" runat="server" />
                            <asp:TextBox ID="txt2" TextMode="Password" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                </div>

                <div class="pannel-footer">
                    <asp:Button ID="btn1" runat="server" Text="Login" CssClass="btn" OnClick="btn1_Click"/>
                    <asp:Label ID="Label2" Text="Developed By SIDDeveloper" runat="server"/>
                </div>


            </div>
        </div>
    </form>
</body>
</html>
