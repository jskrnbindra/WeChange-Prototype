<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="NewPetition.aspx.cs" Inherits="WeChange.NewPetition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Stylinger.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel runat="server" ID="FormHolder" CssClass="FormHolder">

    <h1>Start a new petition</h1>
     <asp:TextBox ValidationGroup="CreatePetitionForm" placeholder="Title"  CssClass="tbox" ID="tb_PetitionTitle" runat="server"></asp:TextBox>
            <br />
    <asp:RequiredFieldValidator ValidationGroup="CreatePetitionForm"  ControlToValidate="tb_PetitionTitle" ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    <br />
     <asp:TextBox ValidationGroup="CreatePetitionForm" placeholder="Description"  CssClass="tbox"  ID="tb_PetitionDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
    <asp:RequiredFieldValidator ValidationGroup="CreatePetitionForm"  ControlToValidate="tb_PetitionDesc" ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    <br />
    <br />
    <small>Decision Maker:</small>
   
   <asp:UpdatePanel ID="CustomCategoryTBloader" runat="server">
       <ContentTemplate>
           
   <asp:DropDownList ID="ddl_DecisionMaker" ValidationGroup="CreatePetitionForm"  runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_DecisionMaker_SelectedIndexChanged">
       <asp:ListItem  Value="1" Text="Administration">Administration</asp:ListItem>
       <asp:ListItem  Value="2" Text="Infrastructure">Infrastructure</asp:ListItem>
       <asp:ListItem Value="3"  Text="Infotech">Infotech</asp:ListItem>
       <asp:ListItem Value="4" Text="Add new...">Add new...</asp:ListItem>
   </asp:DropDownList>
    <asp:TextBox ValidationGroup="CreatePetitionForm"  ID="tb_DecisionMakerCustom" Visible="false" runat="server" placeholder="Add new category"></asp:TextBox>
           <asp:RequiredFieldValidator Enabled="false" ControlToValidate="tb_DecisionMakerCustom"  ValidationGroup="CreatePetitionForm"  ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
       </ContentTemplate>
       <Triggers>
           <asp:AsyncPostBackTrigger ControlID="ddl_DecisionMaker" />
       </Triggers>
   </asp:UpdatePanel>
    <br />
    <br />
    <asp:Button ID="CreateNewPetition" ValidationGroup="CreatePetitionForm" OnClick="CreateNewPetition_Click" runat="server" CssClass="genericButton" Text="Start Petition" />
            </asp:Panel>
    <br />
    <asp:Label runat="server" ID="lbl_PetitionStatus" ForeColor="Orange" Font-Bold="true" Text=""></asp:Label>
    <section id="Victories">
        <asp:SqlDataSource ID="VictoriesSource" runat="server" ConnectionString='<%$ ConnectionStrings:WeChangeConnectionString %>' SelectCommand="SELECT TOP 5 [Title], [PDescription], [DecisionMaker], [DT], [DecisionDT], [Signs], [DecisionDesc] FROM [Petitions] WHERE ([Decision] = @Decision)">
            <SelectParameters>
                <asp:Parameter DefaultValue="a" Name="Decision" Type="String"></asp:Parameter>
            </SelectParameters>
        </asp:SqlDataSource>
        victories here
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="VictoriesSource">
            <ItemTemplate>
                <div class="PetitionHolder" style="background:#eecaca;overflow:hidden">
                    <h6>Petitioned to <%# Eval("DecisionMaker") %></h6>
                    <br />
                    <h3><%# Eval("Title") %></h3>
                    <br />
                    <p class="PetitionDescription"><%# Eval("PDescription") %></p>
                    <br />
                    <!-- PLACE A TICK SYMBOL IN TOP RIGHT-->
                    Accepted on <%# Eval("DecisionDT") %><br />
                    <%# Eval("Signs") %> Signatures
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                <br /><hr /><br /> 
            </SeparatorTemplate>
            <FooterTemplate>
                <a href="BrowsePetitions.aspx">See all Victories</a>
            </FooterTemplate>
        </asp:Repeater>
    </section>
    <asp:Panel runat="server" ID="LoginView" Visible="false">
    <div class="Back"></div>
     <div class="LoginModal">
        <asp:Button ID="btn_Login" OnClick="btn_Login_Click" runat="server" Text="Log in" CssClass="LoginPageDeckButtons" />
        <asp:Button ID="btn_signup" OnClick="btn_signup_Click" runat="server" Text="Sign Up" CssClass="LoginPageDeckButtons" />
        <asp:Panel ID="pnl_login" runat="server">
            log in <br />
            <asp:TextBox ID="tb_UID"  CssClass="tbox"  runat="server" placeholder="Registration Number"></asp:TextBox><br />

            <asp:TextBox ID="tb_pass"  CssClass="tbox"  TextMode="Password" runat="server" placeholder="Password"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="tb_pass" ValidationGroup="LoginGroup" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator  ID="RequiredFieldValidator3" ValidationGroup="LoginGroup" ControlToValidate="tb_UID" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>

            <br />
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember me" /><br />

            <asp:Button ID="btn_LoginUser" CssClass="genericButton" OnClick="btn_LoginUser_Click" runat="server" Text="Log in" ValidationGroup="LoginGroup" /><br />
            <asp:Label ID="lbl_StatusShower" runat="server" Text="" Font-Bold="true"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="pnl_signup" runat="server" Visible="false">
            Sign Up<br />
            <asp:TextBox ID="tb_name" CssClass="tbox"  ValidationGroup="SignUP" runat="server" placeholder="Full Name"></asp:TextBox><br />
            <asp:TextBox ID="tb_regno" CssClass="tbox"   ValidationGroup="SignUP"  runat="server"  placeholder="Registration number"></asp:TextBox><br />
            <asp:TextBox ID="tb_email" CssClass="tbox"   ValidationGroup="SignUP"  runat="server" placeholder="Email"></asp:TextBox><br />
            <asp:TextBox ID="tb_emailConfirm" CssClass="tbox"   ValidationGroup="SignUP"  runat="server" placeholder="Confirm Email"></asp:TextBox><br />
            <asp:TextBox ID="tb_password" CssClass="tbox"  TextMode="Password"  ValidationGroup="SignUP"  runat="server"  placeholder="Password"></asp:TextBox><br />
            <asp:RequiredFieldValidator  ValidationGroup="SignUP"  ControlToValidate="tb_password" ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ControlToValidate="tb_regno"  ValidationGroup="SignUP"  ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator  ValidationGroup="SignUP"  ControlToValidate="tb_emailConfirm" ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>

            <asp:RequiredFieldValidator  ValidationGroup="SignUP"  ControlToValidate="tb_name" ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator  ValidationGroup="SignUP"  ControlToValidate="tb_email" ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>

            <asp:Button ID="btn_SignUpUser" OnClick="btn_SignUpUser_Click"  ValidationGroup="SignUP"  runat="server" Text="Sign Up" CssClass="genericButton" /><br />
            <asp:Label ID="lbl_StatusShower2" runat="server" Text="" Font-Bold="true"></asp:Label>
        </asp:Panel>
    </div>
        </asp:Panel>
</asp:Content>
