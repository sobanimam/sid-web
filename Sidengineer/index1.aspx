<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link href="gridper.css" rel="stylesheet" />
    <link href="FontAwesome/css/font-awesome.css" rel="stylesheet" />
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }

        .clearfix:after {
            clear: both;
            content: "";
            display: block;
        }

        .header {
            background-color: white;
            box-shadow: 0px 0px 20px #a09797;
            position: fixed;
            z-index: 99999;
            top: 0;
            width: 100%;
            display: block;
        }

        .container {
            width: 93%;
            margin: 0px auto;
        }

        .navigation-bar .logo {
            float: left;
            padding: 15px 0px;
            box-shadow: 0px 1px 4px #dedbdb;
            border-radius: 1px;
        }

        img {
            width: 90px;
            display: block;
            padding: 1px 15px;
        }

        ul.menu {
            float: right;
        }

        ul {
            list-style: none;
        }

        .menu li {
            float: left;
        }

            .menu li a {
                text-decoration: none;
                padding: 30px 40px;
                display: block;
                color: #b0b0b0;
                font-size: 15px;
                text-align: center;
                text-transform: uppercase;
                border-top: 5px solid transparent;
                transition: 0.5s;
            }

                .menu li a i {
                    display: block;
                    margin-bottom: 10px;
                }

            .menu li.active a {
                background-color: #f2f1f1;
                border-top-color: #964569;
            }



            .menu li a:hover {
                background-color: #9c416a;
                color: white;
            }



        /*dropdown*/
        .dropdown-content {
            background-color: white;
            padding: 0px 0px;
            position: absolute;
            max-width: 190px;
            text-align: center;
            box-shadow: 0px 3px 9px #b0a7a7;
            display: none;
            margin-top: 1px;
        }

        li.dropdown:hover {
            background-color: #964569;
        }

        li.dropdown .dropdown-content a:hover {
            color: #fff4f4;
            background-color: #54aee6;
        }

        li.dropdown .dropdown-content a {
            padding: 15px 35px;
            color: #6596d0;
            font-size: 12px;
            border-bottom: 2px solid #827b9e;
            font-family: "Times New Roman";
        }

        li.dropdown:hover .dropdown-content {
            display: inline-block;
        }
        /*End-Dropdown*/

        /*Image Control*/
        .cbody {
            background-color: #efefef;
            padding-top: 10%;
            /*min-height: 520px;*/
            padding-bottom: 7%;
        }

        .scroll-img {
            max-width: 80%;
            margin: 0 auto;
        }

            .scroll-img img {
                width: 100%;
            }

        /*Top-Block*/
        .top-block.has-fixed-head {
            padding-top: 20%;
            /* min-height: 430px;*/
        }

        .top-block {
            display: -webkit-flex;
            background: linear-gradient(to right,#8560a9 0%,#6c87c7 50%,#53afe7 60%);
            align-items: center;
        }

        .top-block-inner-container {
            width: 50%;
            margin: 0 auto;
            text-align: center;
        }

        h1.top-block-title {
            font-family: "Times New Roman";
            font-size: 53px;
            font-weight: 300;
            color: white;
        }
        /*Top-Block-Footer*/
        .top-block-footer {
            padding-top: 10%;
            display: block;
            width: 100%;
            position: relative;
            padding-bottom: 5%;
        }

        h3.top-block-footer-container {
            display: block;
            color: white;
            position: relative;
            right: 0;
            text-align: center;
            font-family: "Times New Roman";
            margin-left: 60%;
        }

        /*End-of-Top Block*/

        /*Text-contain-Block*/

        .content-text-area {
            width: 73%;
            margin: 0 auto;
        }

        .text-area-body {
            line-height: 1.7;
            font-family: "Times New Roman";
            margin-top: 15px;
            margin-bottom: 5px;
        }

        p.intro {
            background: linear-gradient(to right bottom,#e3e499 10%,#ffff9c 23%,gray);
            padding: 5px;
            font-size: 17px;
            padding-left: 15px;
            font-family: sans-serif;
        }

        p.text-content-block {
            background: linear-gradient(to bottom left,#abc3e4 5%,#d3ecff 47%,#e4f2f5 10%);
            padding-top: 15px;
            margin-top: 5px;
            font-size: 17px;
            color: #210101;
            font-family: sans-serif;
            padding-left: 15px;
        }

        /*End-of-Text-Contain-Block*/

        /*Footer-Block*/
        .top-footer {
            background: linear-gradient(to left top,#828892 6%,#b189ff 30%,#acc3c2);
            width: 100%;
            display: block;
            min-height: 200px;
            margin-top: 15px;
        }

        .footer-container-area {
            margin: 0px auto;
            width: 90%;
            padding-top: 50px;
            line-height: 1.5;
        }

        .footer-container-left {
            color: #250c17;
            float: left;
            display: block;
        }

        .footer-container-right.clearfix {
            float: right;
            line-height: 1.7;
            font-size: 16px;
            color: #33082a;
        }


        /*End-of-Footer-Block*/
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="header">
            <div class="row">
                <div class="col-12">


                    <div class="container">
                        <div class="navigation-bar clearfix">
                            <a href="#" class="logo">
                                <img src="sobanlogo.jpg" />
                            </a>
                            <ul class="menu clearfix">
                                <li class="active">
                                    <a href="#">
                                        <i class="fa fa-home"></i>
                                        Home
                                    </a>
                                </li>

                                <li class="dropdown">
                                    <a href="#">
                                        <i class="fa fa-list"></i>
                                        Services
                                    </a>

                                    <div class="dropdown-content">
                                        <a href="#">Software</a>
                                        <a href="#">Own Service</a>
                                    </div>

                                </li>

                                <li>
                                    <a href="#">
                                        <i class="fa fa-user"></i>
                                        About Us
                                    </a>
                                </li>

                                <li>
                                    <a href="logform.aspx">
                                        <i class="fa fa-sign-in"></i>
                                        Login
                                    </a>
                                </li>

                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Top-Block-->
        <div class="row">
            <div class="col-12">
                <div class="top-block gradiant has-fixed-head">
                    <div class="top-block-inner-container">
                        <h1 class="top-block-title">Java vs .NET vs Python vs GO vs Ruby vs Node.JS: Who Reigns the Job Market?
                        </h1>
                        <div class="top-block-footer">
                            <h3 class="top-block-footer-container">SIDDEVELOPER</h3>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!--End-of-Top-Block-->


        <!--Container-->
        <div class="row">
            <div class="col-12">
                <!--cbody-->
                <div class="cbody">
                    <div class="scroll-img">
                        <img src="lan2.jpg" />
                    </div>
                </div>
            </div>
        </div>


        <!--Content Text Area-->
        <div class="content-text-area">
            <div class="text-area-body">
                <p class="intro">
                    Sid engineer Limited Software company.Sid engineer into Website Development,Software Development,Managing Solution.
                </p>
                <p class="text-content-block">
                    We believe in keeping pace with ever changing technology there by enabling us to provide our customers with innovative services backed with trust and hence,building a long-term relationship.Our unique services make us stand tall in this highly competitive domain,with the aid of our team of expert professionals. 
                </p>

            </div>

        </div>
        <!--End-of-Content Text Area-->

        <!--Footer-->
        <div class="top-footer">
            <div class="footer-container-area">
                <div class="footer-container-left clearfix">
                    <h4>SID ENGINEER</h4>
                    <p>Pologround</p>
                    <p>Himmatnagar-383001</p>
                    <p>Gujarat, India</p>
                </div>
                <div class="footer-container-right clearfix">
                    <p>Email: soban.imam@gmail.com</p>
                    <p>Contact No: +91-9428961161</p>
                    <p>Website: sobanimam.ml</p>

                </div>
            </div>


        </div>




        <!--End-of-footer-->
    </form>
</body>
</html>
