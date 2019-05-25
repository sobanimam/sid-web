<%@ Page Title="" Language="C#" MasterPageFile="~/Account.master" AutoEventWireup="true" CodeFile="u_Login.aspx.cs" Inherits="u_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function userValid() {

            var em, fn, ln, pswd, mbno, gn, emexp, drpgen, date1, month1, y1;

            em = document.getElementById('<%=txtEmail.ClientID %>').value;
           pswd = document.getElementById('<%=txtPassword.ClientID %>').value;
           if (em == '' && pswd == '') {
               alert("Enter All Fields");
               return false;
           }
           if (em == '') {
               alert("Please Enter Your Email");
               return false;
           }
           if (pswd == '') {

               alert("Please Enter Your Password");
               return false;
           }
           return true;

       }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPage" Runat="Server">
     <div class="form-vertical">
        <div class="form-group">
            <label>Email</label>
            <asp:TextBox runat="server" requierd ID="txtEmail" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label>Password</label>
            <asp:TextBox TextMode="Password" requierd runat="server" ID="txtPassword" CssClass="form-control" />
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="lbl_error" Style="color:red;font-size:15px" runat="server" Enabled="false" ></asp:Label>
    </div>
    <div class="form-buttuns text-center">
        <asp:Button Text="Sign In" ID="btnSignIn" CssClass="btn btn-block btn-account" runat="server" OnClientClick="return userValid();" OnClick="btnSignIn_Click"/>
        <p>Need An Account?</p>
        <p><a href="Register.aspx">Register Here <i class="fa fa-arrow-right"></i></a></p>
        <p><a href="ResetPassword.aspx">Forgot Password</a></p>
    </div>
</asp:Content>

