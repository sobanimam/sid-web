<%@ Page Language="C#" AutoEventWireup="true" CodeFile="table.aspx.cs" Inherits="table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery-3.2.1.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 1000px;
            height: 93px;
        }

        .auto-style2 {
            height: 19px;
        }

        #TextBox2, #TextBox3, #TextBox4 {
            display: none;
        }
    </style>

    <script type="text/javascript">
        var j = 5;
        var count_txt = 5;
        var t = 5;
        var enter = 1;
        var txtn;
        var btnnum = 2;
        var btnid;
        var first_txt = 5;
        var second_txt = 6;
        var third_txt = 7;
        var fourth_txt = 8;
        var final_txt = 0;
        var chk_1 = 0;//this is for check text box value as regular expression
        var chk2 = 0;
        var chk3=0;
        var chk4=0;
        var val = {
            "name": "",
            "cif": 0,
            "rupee": 0,
            "opdate": 0
        };
        function trcreate() {
            var t1 = "txt" + t;
            if (enter == 1) {
                var tr1 = document.createElement("tr");
                tr1.align = "center";
                tr1.id = "tr1";
                var d2 = document.getElementById("tbl1");
                d2.appendChild(tr1);


                for (var j = count_txt; j <= count_txt + 4; j++) {
                    var td = "td" + j;
                    var td = document.createElement("td");
                    tr1.appendChild(td);
                    if (j == count_txt + 4) {

                        var btn = document.createElement("input");
                        btn.type = "button";
                        btn.id = "btn" + btnnum;
                        btn.name = "btn" + btnnum;
                        btn.name = "btn" + btnnum;
                        btnid = "btn" + btnnum;//after use
                        btn.value = "submit";
                        btnnum = btnnum + 1;
                        td.appendChild(btn);
                       
                    }
                    else {
                        var txt = document.createElement("input");
                        txt.type = "text";
                        txt.name = "txt" + j;
                        txt.id = "txt" + j;
                        txt.onkeyup = check;
                        td.appendChild(txt);
                       
                    }


                }
                enter = enter + 1;
                count_txt = count_txt + 3;
                txtn = "txt" + count_txt;
                count_txt = count_txt + 1;
                final_txt = count_txt - 1;
                t = t + 3;
                var x = document.getElementById(txtn);
                x.onchange = trcreate;

            }//if-end
            else if (this.id == ("txt" + t)) {
                var tr1 = document.createElement("tr");
                tr1.align = "center";
                tr1.id = "tr1";
                var d2 = document.getElementById("tbl1");
                d2.appendChild(tr1);

                for (var j = count_txt; j <= count_txt + 4; j++) {
                    var td = "td" + j;
                    var td = document.createElement("td");
                    tr1.appendChild(td);

                    if (j == count_txt + 4) {

                        var btn = document.createElement("input");
                        btn.type = "button";
                        btn.id = "btn" + btnnum;
                        btn.name = "btn" + btnnum;
                        btnid = "btn" + btnnum;//after use
                        btn.value = "submit";
                        btnnum = btnnum + 1;
                        td.appendChild(btn);
                        //btn work
                    }
                    else {
                        var txt = document.createElement("input");
                        txt.type = "text";
                        txt.name = "txt" + j;
                        txt.id = "txt" + j;
                        txt.onkeyup = check;
                        td.appendChild(txt);
                    }



                }
                enter = enter + 1;
                count_txt = count_txt + 3;
                txtn = "txt" + count_txt;
                count_txt = count_txt + 1;
                final_txt = count_txt - 1;
                t = t + 4;
                var x = document.getElementById(txtn);
                x.onchange = trcreate;
                //alert("txtCount=" + (count_txt - 1));
                var current_click_txt = (count_txt - 5);
                var val = ("txt" + current_click_txt);
                // alert("txt="+val);
                var val1 = document.getElementById(val).value;
                //var val2 = alert("VAL="+val1);



            }

            //btn work
            var btnevent = document.getElementById(btnid);
            btnevent.onclick = btnclick;
        }

        //Validation of txt
        function check() {
            var x1 = 1;
            while (x1 <= (final_txt)) {
                
               
                if (("txt" + first_txt) == this.id || ("txt" + (first_txt + 4*(x1))) == this.id) {
                    var re = new RegExp("^([a-zA-Z]{5,})$");
                    var txt_1 = document.getElementById(this.id);
                    console.log("id=" + this.id);
                    console.log("x1=" + x1);
                    if (re.test(txt_1.value))
                    {
                        console.log("success");
                        txt_1.style.borderColor = "black";
                        chk_1 = 1;
                    }
                    else
                    {
                        //console.log("unvalid");
                        txt_1.style.borderColor = "red";
                        txt_1.style.outline = "none";
                        chk_1 = 0;
                    }

                    // alert("check=" + count_txt);
                    // first_txt = first_txt + 4;

                }


                else if (("txt" + second_txt) == this.id || ("txt" + (second_txt + 4*(x1))) == this.id) {
                   
                    var re2 = new RegExp("^([0-9]{9})$");
                    var txt_2 = document.getElementById(this.id);

                    if (re2.test(txt_2.value)) {
                        console.log("success");
                        txt_2.style.borderColor = "black";
                        console.log("id=" + this.id);
                        console.log("x1=" + x1);
                        chk2 = 1;
                    }
                    else {
                        console.log("unvalid");
                        txt_2.style.borderColor = "red";
                        txt_2.style.outline = "none";
                        console.log("id-u=" + this.id);
                        console.log("x1-u=" + x1);
                        console.log("txtval=" + txt_2.value);
                        txt_2.style.captionSide="sid";
                        chk2 = 0;
                    }
                }

                else if (("txt" + third_txt) == this.id || ("txt" + (third_txt + 4 * (x1))) == this.id) {
                    var re3 = new RegExp("^([0-9]{5})$");
                    var txt_3 = document.getElementById(this.id);

                    if (re3.test(txt_3.value)) {
                        console.log("success");
                        txt_3.style.borderColor = "black";
                        console.log("id=" + this.id);
                        console.log("x1=" + x1);
                        chk3 = 1;
                    }
                    else {
                        console.log("unvalid");
                        txt_3.style.borderColor = "red";
                        txt_3.style.outline = "none";
                        console.log("id-u=" + this.id);
                        console.log("x1-u=" + x1);
                        console.log("txtval=" + txt_3.value);
                        txt_3.style.captionSide = "sid";
                        chk3 = 0;
                    }

                }
                else if (("txt" + fourth_txt) == this.id || ("txt" + (fourth_txt + 4 * (x1))) == this.id) {
                    var re4 = new RegExp("^([0-9]{2}\/[0-9]{2}\/[0-9]{4})$");
                    var txt_4 = document.getElementById(this.id);

                    if (re4.test(txt_4.value)) {
                        console.log("success");
                        var dd=txt_4.value.split("/");
                        
                        if (dd[1] <= 12) {
                            if (dd[1] == 2 || dd[1] == 4 || dd[1] == 6 || dd[1] == 9 || dd[1] == 11) {
                                if (dd[0] <= 30) {
                                    txt_4.style.borderColor = "black";
                                    console.log("id=" + this.id);
                                    console.log("x1=" + x1);
                                    chk4 = 1;
                                }
                            }
                            else
                            {
                                if (dd[0] <= 31) {
                                    txt_4.style.borderColor = "black";
                                    console.log("id=" + this.id);
                                    console.log("x1=" + x1);
                                    chk4=1
                                }
                            }
                           

                        }
                        
                    }
                    else {
                        console.log("unvalid");
                        txt_4.style.borderColor = "red";
                        txt_4.style.outline = "none";
                        console.log("id-u=" + this.id);
                        console.log("x1-u=" + x1);
                        console.log("txtval=" + txt_4.value);
                        txt_4.style.captionSide = "sid";
                        chk4 = 0;
                    }

                }
                else {
                    alert("nothing");
                    beak;
                }
                x1 ++;
            }
        }

        //End-of Validation of txt


        //Button Click Event

        function btnclick() {
            var chk1=0;
            var n = 1;
            //alert("btnid=" + btnid);
            var btnnum = this.id;
            //alert("Btn=" + btnnum);
            var btn_click = btnnum.split('btn');
            var btn_click_num = parseInt(btn_click[1]);
            alert(btn_click_num);
            var last = btn_click_num * 4;
            for (var k = (last - 3) ; k <= last ; k++) {

                var id = document.getElementById("txt" + k);
                // alert("Val=" + id.value);

                if (n == 1 && chk_1==1) {
                    if (id.value.trim()!="") {
                        val.name = id.value;
                        n = n + 1;
                        chk1 = 1;
                    }
                    else {
                        alert("Please Enter the Name");
                        chk = 0;
                        break;
                    }
                }

                else if (n == 2 && chk2==1) {
                    if (id.value.trim() != "") {
                        val.cif = id.value;
                        n++;
                        chk1 = 1;
                    }
                    else {
                        alert("Please Enter CIF");
                        chk1 = 0;
                        break;
                    }
                }
                else if (n == 3 && chk3==1) {
                    if (id.value.trim() != "") {
                        val.rupee = id.value;
                        n++;
                        chk1 = 1;
                    }
                    else {
                        alert("Please Enter Rupee");
                        chk1 = 0;
                        break;
                    }
                }
                else {
                    if (n == 4 && chk4==1) {
                        if (id.value.trim() != "") {
                            val.opdate = id.value;
                            chk1 = 1;
                        }
                        else {
                            alert("Please Enter Valid Date(DD-MM-YYYY)");
                            chk1 = 0;
                            break;
                        }
                    }
                }
                // text.attributes(Text) = id.value;

            }
            //Button Click Event
            if (chk1==1) {
                var dataOBJ = JSON.stringify(val);
                $.ajax({
                    url: "table.aspx/RegInsert",
                    type: 'post',
                    contentType: "application/json;charset=utf-8",
                    dataType: "html or json",
                    data: dataOBJ,
                    success: function (data) {
                        alert("Success");
                        var btnblock = document.getElementById(btnnum);
                        btnblock.style.display = "none";
                    },
                    error: function (data) {
                        alert("error");
                    }

                });

            }
            else {
                alert("Please Enter Data");
            }
 }


        function text1() {

            //  trcreate();
            var txt2 = document.getElementById('txt2');
            txt2.style.display = 'block';

        }
        function text2() {


            if (document.getElementById('txt2').value != "") {

                var txt3 = document.getElementById('txt3');
                txt3.style.display = 'block';
            }
            if (document.getElementById('txt2').value == "") {
                var txt3 = document.getElementById('txt3');
                txt3.style.display = 'none';
            }

        }

        function text3() {
            if (document.getElementById('txt3').value != "") {

                trcreate();

            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center">
            <table align="center" id="tbl1" border="1px solid black" cellpadding="0" cellspacing="0" class="auto-style1">
                <tr>
                    <td align="center" class="auto-style2" width="225px">
                        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td align="center" class="auto-style2" width="225px">
                        <asp:Label ID="Label2" runat="server" Text="CIF"></asp:Label>
                    </td>
                    <td align="center" class="auto-style2" width="225px">
                        <asp:Label ID="Label3" runat="server" Text="Rupee"></asp:Label>
                    </td>
                    <td align="center" class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="opdate"></asp:Label>
                    </td>
                </tr>
                <tr align="center">
                    <td>
                        <asp:TextBox ID="txt1" Style="display: block" runat="server" Width="182px" onClick="text1()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt2" runat="server" Style="display: none" TextMode="Number" Width="154px" onchange="text2()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txt3" runat="server" Style="display: none" TextMode="Number" onchange="text3()"></asp:TextBox>
                    </td>
                    <td>
                        <asp:DropDownList ID="drp1" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>

            </table>
            

            <br />

            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
