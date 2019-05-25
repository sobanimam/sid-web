<%@ Page Title="" Language="C#" MasterPageFile="~/Account.master" AutoEventWireup="true" CodeFile="verify.aspx.cs" Inherits="verify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPage" Runat="Server">
     <div class="form-vertical">
        <div class="form-group">
            <label>VerificationCode</label>
            <asp:TextBox runat="server" placeholder="Verify" ID="txtverify" CssClass="form-control" />
        </div>
        <div class="form-group">
        <asp:Label ID="lbl_error" Style="color:red;font-size:15px" runat="server" Enabled="false" ></asp:Label>
    </div>
    </div>
    <div class="form-buttuns text-center">
        <asp:Button Text="Verify" ID="btnverify" CssClass="btn btn-block btn-account" runat="server" OnClick="btnverify_Click"  />
        <p>Go To Login</p>
        <p><a href="u_Login.aspx">Login here <i class="fa fa-arrow-right"></i></a></p>
    </div>
</asp:Content>

