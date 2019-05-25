<%@ Page Title="" Language="C#" MasterPageFile="~/Account.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPage" Runat="Server">
    <script type="text/javascript">

        function userValid() {

            var em, fn, ln, pswd, mbno, gn, emexp, drpgen, date1, month1, y1;

            em = document.getElementById('<%=txtEmail.ClientID %>').value;
           fn = document.getElementById('<%=txtFirstName.ClientID %>').value;
           ln = document.getElementById('<%=txtLastName.ClientID %>').value;
           pswd = document.getElementById('<%=txtpasswd.ClientID %>').value;
           mbno = document.getElementById('<%=mobile.ClientID %>').value;
           emexp = /^([a-zA-Z0-9_\.\-])+\@(gmail)(\.com)$/;
           drpgen = document.getElementById('<%=gender.ClientID%>');
           date1 = document.getElementById('<%=txtdate.ClientID%>').value;
           month1 = document.getElementById('<%=month.ClientID%>');
           y1 = document.getElementById('<%=txtyear.ClientID%>').value;


           var d1 = new Date();
           var y2 = d1.getFullYear();
           var pswdexp = /^[a-zA-z]([a-zA-Z0-9!@$%^*]){5,14}$/;
           var mbexp = /^[7-9]\d{9}$/;
           if (em == '' && fn == '' && ln == '' && pswd == '' && mbno == '') {
               alert("Enter All Fields");
               return false;
           }
           if (em == '') {
               alert("Please Enter Your Email");
               return false;
           }
           if (!em.match(emexp)) {

               alert("Please Enter Valid Email");
               return false;
           }

           if (fn == '') {

               alert("Please Enter Your FirstName");
               return false;
           }
           if (ln == '') {

               alert("Please Enter Your LastName");
               return false;
           }
           if (pswd == '') {

               alert("Please Enter Your Password");
               return false;
           }
           if (!pswd.match(pswdexp)) {

               alert("Please Enter Valid Password.First character and beetween 6 and 15 Letter");
               return false;
           }


           if (mbno == '') {

               alert("Please Enter Your Mobile Number");
               return false;
           }
           if (!mbno.match(mbexp)) {
               alert("Please Enter Valid Mobile Number");
               return false;
           }
           if (drpgen.value == '') {
               alert("Please Select Any Gender");
               return false;
           }
           if (date1 == '') {
               alert("Please Select Date");
               return false;
           }
           if (month1.value == '') {
               alert("Please Select Month");
               return false;
           }
           if (y1 == '') {
               alert("Please Select Year");
               return false;

           }
           if (month1.value == 01 || month1.value == 03 || month1.value == 05 || month1.value == 07 || month1.value == 08 || month1.value == 10 || month1.value == 12) {

               if (date1 > 31) {
                   alert("Please Enter Valid Date");
                   return false;
               }
           }
           else {
               if (date1 > 30) {
                   alert("Please Enter Valid Date");
                   return false;
               }
           }
           if (y1 >= y2) {
               alert("Please Enter Valid Year");
               return false;
           }
           return true;
       }



    </script>
     <div class="form-vertical">
         <div class="form-group">
            <asp:Label ID="lbl_error" Style="color:red;font-size:15px" runat="server" Enabled="false" ></asp:Label>
        </div>
        <div class="form-group">
            <label>Email</label>
            <asp:TextBox runat="server" ID="txtEmail"  CssClass="form-control" />
        </div>
        <div class="divider"><span>About U</span></div>
        <div class="form-group">
            <label>First Name</label>
            <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label>Last Name</label>
            <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label>Password</label>
            <asp:TextBox TextMode="Password" runat="server" ID="txtpasswd" CssClass="form-control" />
        </div>

        <div class="form-group">
            <label>MobileNo.</label>
            <asp:TextBox runat="server" ID="mobile" CssClass="form-control" />
        </div>

        <!--Gender-->
        <div class="form-group">
            <label>Gender</label>
            <asp:DropDownList runat="server" ID="gender" CssClass="form-control"> 
                <asp:ListItem Value="" Selected>Gender</asp:ListItem>
                <asp:ListItem Value="Male">Male</asp:ListItem>
                <asp:ListItem Value="Female">Female</asp:ListItem>
                <asp:ListItem Value="Other">Other</asp:ListItem>
            </asp:DropDownList>
           
        </div>
        
        <!--DOB-->
        <div class="form-group">
            <label>Date Of Birth</label>
            <div class="row">
                <div class="col-sm-3">
                        <asp:TextBox runat="server" placeholder="Date" ID="txtdate" CssClass="form-control" />
                        </div>
                <div class="col-sm-5">
                    <asp:DropDownList runat="server" ID="month"  CssClass="form-control">
                        <asp:ListItem Value="" Selected>Month</asp:ListItem>
                        <asp:ListItem Value="01">01</asp:ListItem>
                        <asp:ListItem Value="02">02</asp:ListItem>
                        <asp:ListItem Value="03">03</asp:ListItem>
                        <asp:ListItem Value="04">04</asp:ListItem>
                        <asp:ListItem Value="05">05</asp:ListItem>
                        <asp:ListItem Value="06">06</asp:ListItem>
                        <asp:ListItem Value="07">07</asp:ListItem>
                        <asp:ListItem Value="08">08</asp:ListItem>
                        <asp:ListItem Value="09">09</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>

                    </asp:DropDownList>
                </div>
                <div class="col-sm-4">
                        <asp:TextBox runat="server" placeholder="Year" ID="txtyear" CssClass="form-control" />

                </div>
            </div>
        </div>
         
    </div>
    <div class="form-buttuns text-center">
        <asp:Button Text="Sign Up" ID="btnSignUp" CssClass="btn btn-block btn-account" runat="server" OnClientClick="return userValid();" OnClick="btnSignUp_Click"  />
        <p><a href="u_Login.aspx">Back To Login</a></p>
    </div>
</asp:Content>

