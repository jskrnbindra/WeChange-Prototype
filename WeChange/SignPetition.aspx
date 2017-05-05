<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="SignPetition.aspx.cs" Inherits="WeChange.SignPetition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <br /><br />
    <asp:HyperLink ID="goBackLink" NavigateUrl="~/BrowsePetitions.aspx" runat="server">See all Petitions</asp:HyperLink>
    <asp:Label ID="lbl_statusShower" Font-Bold="true" runat="server" Text=""></asp:Label>
    <asp:Button ID="SignPeition"  OnClick="SignPeition_Click" runat="server" Text="Sign Petition" />
    <br />
    <br />

    <asp:Panel ID="Adminpanel" runat="server" Visible="false">
    <asp:TextBox ID="tb_DecisionDesc" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox><br />
    <asp:Button ID="btn_Reject" runat="server" Text="Reject" OnClick="btn_Reject_Click" />
    <asp:Button ID="btn_Approve" runat="server" Text="Approve" OnClick="btn_Approve_Click" />
        <asp:Label ID="lbl_DecisionAction" runat="server" Text=""></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="logout" OnClick="Button1_Click" />
        </asp:Panel>

    <h6>
        <asp:Label ID="lbl_DM" runat="server" Text="Label"></asp:Label></h6>
    <h5>
        <asp:Label ID="lbl_decision" runat="server" Text="Label"></asp:Label></h5>
    <h1>
        <asp:Label ID="lbl_Title" runat="server" Text="Label"></asp:Label></h1>
    <p>
        <asp:Label ID="lbl_pdesc" runat="server" Text="Label"></asp:Label>
    </p>
    <h5>
        <asp:Label ID="lbl_pname" runat="server" Text="Label"></asp:Label>(<asp:Label ID="lbl_petID" runat="server" Text="Label"></asp:Label>)</h5> on <asp:Label ID="lbl_DT" runat="server" Text="Label"></asp:Label>
    <h2>
        <asp:Label ID="lbl_signs" runat="server" Text="Label"></asp:Label></h2>
    <br />
    <h5>
        <asp:Label ID="lbl_descDT" runat="server" Text="Label"></asp:Label></h5><br />
    <h3>
        <asp:Label ID="lbl_DecDesc" runat="server" Text="Label"></asp:Label></h3>


    
</asp:Content>
