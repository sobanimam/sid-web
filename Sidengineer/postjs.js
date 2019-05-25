var j = 5;
var count_txt = 5;
var t = 5;
var enter = 1;
var txtn;
var btnnum = 2;
var btnid;
var val = {
    "name": "",
    "cif": 0,
    "rupee": 0,
    "opdate": 0
};
function trcreate()
{
    var t1 = "txt" + t; 
    if (enter==1) {
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
            else
            {
                var txt = document.createElement("input");
                txt.type = "text";
                txt.name = "txt" + j;
                txt.id = "txt" + j;
                td.appendChild(txt);
            }
                    
                    
        }
        enter=enter+1;
        count_txt = count_txt + 3;
        txtn = "txt" + count_txt;
        count_txt = count_txt + 1;
        t = t + 3;
        var x = document.getElementById(txtn);
        x.onchange = trcreate;

    }//if-end
    else if (this.id == ("txt" + t))
    {
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
            else
            {
                var txt = document.createElement("input");
                txt.type = "text";
                txt.name = "txt" + j;
                txt.id = "txt" + j;
                td.appendChild(txt);
            }
                 
                 

        }
        enter = enter + 1;
        count_txt = count_txt + 3;
        txtn = "txt" + count_txt;
        count_txt = count_txt + 1;
        t = t + 4;
        var x = document.getElementById(txtn);
        x.onchange = trcreate;
        //alert("txtCount=" + (count_txt - 1));
        var current_click_txt = (count_txt - 5);
        var val = ("txt" + current_click_txt);
        // alert("txt="+val);
        var val1=document.getElementById(val).value;
        var val2 = alert("VAL="+val1);

              

    }
        
    //btn work
    var btnevent = document.getElementById(btnid);
    btnevent.onclick = btnclick;

}
        
function btnclick()
{
    var n = 1;
    //alert("btnid=" + btnid);
    var btnnum = this.id;
    //alert("Btn=" + btnnum);
    var btn_click=btnnum.split('btn');
    var btn_click_num = parseInt(btn_click[1]);
    alert(btn_click_num);
    var last = btn_click_num * 4;
    for (var k = (last-3) ; k <= last ; k++) {
        var id = document.getElementById("txt" + k);
        // alert("Val=" + id.value);
                
        if (n==1) {

            val.name = id.value;
            n = n + 1;
        }
        else if (n == 2) {
            val.cif = id.value;
            n++;
        }
        else if (n == 3) {
            val.rupee = id.value;
            n++;
        }
        else
        {
            if (n == 4) {
                val.opdate = id.value;
            }
        }
        // text.attributes(Text) = id.value;

    }
    var dataOBJ = JSON.stringify(val);
    $.ajax({
        url: "table.aspx/RegInsert",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
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
       

function text1()
{

    //  trcreate();
    var txt2=document.getElementById('txt2');
    txt2.style.display = 'block';
            
}
function text2()
{

           
    if (document.getElementById('txt2').value != "")
    {
                
        var txt3 = document.getElementById('txt3');
        txt3.style.display = 'block';
    }
    if (document.getElementById('txt2').value == "")
    {
        var txt3 = document.getElementById('txt3');
        txt3.style.display = 'none';
    }

           
}

function text3()
{
    if (document.getElementById('txt3').value != "") {
               
        trcreate();
                
    }
}
        
