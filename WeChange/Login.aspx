<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WeChange.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <div class="MainBody">
        <asp:Panel runat="server" ID="FormHolder" CssClass="FormHolder">
        <asp:Button ID="btn_Login" OnClick="btn_Login_Click" runat="server" Text="Log in" CssClass="LoginPageDeckButtons" />
        <asp:Button ID="btn_signup" OnClick="btn_signup_Click" runat="server" Text="Sign Up" CssClass="LoginPageDeckButtons" />
        <asp:Panel ID="pnl_login" runat="server">
            <br />
            <asp:TextBox ID="tb_UID" CssClass="tbox" runat="server" placeholder="Registration Number"></asp:TextBox><br />

            <asp:TextBox ID="tb_pass" CssClass="tbox" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox><br />
            <br />
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember me" /><br />

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tb_pass" ValidationGroup="LoginGroup" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="LoginGroup" ControlToValidate="tb_UID" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="btn_LoginUser" CssClass="genericButton" OnClick="btn_LoginUser_Click" runat="server" Text="Log in" ValidationGroup="LoginGroup" /><br />
            <asp:Label ID="lbl_StatusShower" runat="server" Text="" Font-Bold="true"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="pnl_signup" runat="server" Visible="false">
            <br />
            <asp:TextBox ID="tb_name" CssClass="tbox"  ValidationGroup="SignUP" runat="server" placeholder="Full Name"></asp:TextBox><br />
            <asp:RequiredFieldValidator  ValidationGroup="SignUP"  ControlToValidate="tb_name" ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tb_regno"  CssClass="tbox"  ValidationGroup="SignUP"  runat="server"  placeholder="Registration number"></asp:TextBox><br />
            <asp:RequiredFieldValidator ControlToValidate="tb_regno"  ValidationGroup="SignUP"  ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tb_email"  CssClass="tbox"  ValidationGroup="SignUP"  runat="server" placeholder="Email"></asp:TextBox><br />
            <asp:RequiredFieldValidator  ValidationGroup="SignUP"  ControlToValidate="tb_email" ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tb_emailConfirm"  CssClass="tbox"  ValidationGroup="SignUP"  runat="server" placeholder="Confirm Email"></asp:TextBox><br />
            <asp:RequiredFieldValidator  ValidationGroup="SignUP"  ControlToValidate="tb_emailConfirm" ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <asp:TextBox ID="tb_password" TextMode="Password"  CssClass="tbox"  ValidationGroup="SignUP"  runat="server"  placeholder="Password"></asp:TextBox><br />
            <asp:RequiredFieldValidator  ValidationGroup="SignUP"  ControlToValidate="tb_password" ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <br /><br /><asp:Button ID="btn_SignUpUser"  CssClass="genericButton" OnClick="btn_SignUpUser_Click"  ValidationGroup="SignUP"  runat="server" Text="Sign Up" /><br />
            <asp:Label ID="lbl_StatusShower2" runat="server" Text="" Font-Bold="true"></asp:Label>
        </asp:Panel>
            </asp:Panel>
    </div>
</asp:Content>
