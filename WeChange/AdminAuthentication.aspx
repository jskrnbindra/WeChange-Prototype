<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="AdminAuthentication.aspx.cs" Inherits="WeChange.AdminAuthentication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <br /><br />
  <center>  <h1>Admin Login</h1><br /><br />
    <asp:TextBox ID="password" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox>
      <asp:Button ID="Login" OnClick="Login_Click" runat="server" Text="Authenticate"></asp:Button>
      <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
      </center>
</asp:Content>
