<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="WeChange.LandingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style_LandingPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <br /><br /><br />

    <center><h1 class="MostProminent">WeChange</h1>

    <section id="CreatePetition">
        
       <i> <h1 style="font-weight:200">Your Platform for Change</h1></i>
        <br /> <br /> 
        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/NewPetition.aspx"  CssClass="PrimaryButton" runat="server">Start a Petition</asp:HyperLink>
    </section>
   </center>
    <br /><br /><br />
     <section id="PersonalisedPetitionsStatus" class="MyPet" runat="server">
         
           <asp:Repeater ID="rpt_MyPetitions" runat="server">
      <HeaderTemplate> <h2>My petitions </h2></HeaderTemplate>   
        <ItemTemplate>
                <div class="PetitionHolder" style="overflow:hidden">
                    <h6>Petitioned to <%# Eval("DecisionMaker") %></h6> on <%# Eval("DT") %>
               
                    <h3>
           <a href="SignPetition.aspx?PetitionID=<%# Eval("ID") %>"><%# Eval("title") %></a>
                        </h3>
                    <p class="PetitionDescription"><%# Eval("PDescription") %></p>
                    <br />
                    <!-- PLACE A TICK SYMBOL IN TOP RIGHT-->
                    <%# Eval("Signs") %> Signatures
                    <h3>Decision</h3><br />
                    Decision: <%# Eval("Decision") %> &nbsp; &nbsp; announced on: <%# Eval("DecisionDT") %><br />
                    Decision Maker's Comment: <%# Eval("DecisionDesc") %>
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                <hr />
            </SeparatorTemplate>
    </asp:Repeater>

    </section>
    <section id="PetitionViews">
    <div id="TrendingPetitions" class="LeftTrending">
        
         <asp:Repeater ID="rpt_Trending" runat="server" DataSourceID="sds_Trending">
       <HeaderTemplate><h1>Trending Petitions</h1></HeaderTemplate>
           <ItemTemplate>
           <div class="PetitionHolder" style="overflow:hidden">
                <h6>Petitioned to <%# Eval("DecisionMaker") %></h6>
                    <br />
                     <h3>
                    <a href="SignPetition.aspx?PetitionID=<%# Eval("ID") %>"><%# Eval("title") %></a>
                     </h3>
                    <br />
                    <p class="PetitionDescription"><%# Eval("PDescription") %></p>
                    <br />
                    <!-- PLACE A TICK SYMBOL IN TOP RIGHT-->
                    Started on <%# Eval("DT") %><br />
               by <%# Eval("Pname") %> (<%# Eval("PetitionerID") %>)<br />
                    <%# Eval("Signs") %> Signatures
           </div> 
        </ItemTemplate>
        <SeparatorTemplate>
                <br /><br /> 
        </SeparatorTemplate>
        
    </asp:Repeater>
    </div>

    <div id="RightPanelHolder" class="RightPanelHolder">
        <div id="LatestPetitions" class="RightPanels">
            <asp:Repeater ID="rpt_Latest" runat="server" DataSourceID="sds_Latest">
     <HeaderTemplate><h3>Most Recent petitions</h3></HeaderTemplate>
    <ItemTemplate>
           <div class="PetitionHolder" style="overflow:hidden">
                   <h3>
                    <a href="SignPetition.aspx?PetitionID=<%# Eval("ID") %>"><%# Eval("title") %></a>
                     </h3>
           </div> 
        </ItemTemplate>
        <SeparatorTemplate>
                <hr />
        </SeparatorTemplate>
    </asp:Repeater>
        </div>
        <div id="ApprovedPetitions">
              <asp:Repeater ID="rpt_Victories" runat="server"  DataSourceID="sds_Victories">
       <HeaderTemplate><h3>Approved Petitions</h3></HeaderTemplate>
           <ItemTemplate>
                <div class="PetitionHolder" style="overflow:hidden">
                    <h3>
                    <a href="SignPetition.aspx?PetitionID=<%# Eval("ID") %>"><%# Eval("title") %></a>
                     </h3>
                    <%# Eval("Signs") %> Signatures
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                <hr />
            </SeparatorTemplate>
    </asp:Repeater>
        </div>
    </div>
    </section>
    <section id="StatsHere">
        
    </section>
    <asp:SqlDataSource ID="sds_Trending" runat="server" ConnectionString='<%$ ConnectionStrings:WeChangeConnectionString %>' SelectCommand="SELECT TOP 3[Pname], [PetitionerID], [Title], [PDescription], [DecisionMaker], [Signs],[DT],[ID] FROM [Petitions] ORDER BY [Signs] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sds_Latest" runat="server" ConnectionString='<%$ ConnectionStrings:WeChangeConnectionString %>' SelectCommand="SELECT TOP 2[PetitionerID], [Title], [PDescription], [Pname], [DT], [Signs], [DecisionMaker],[ID] FROM [Petitions] ORDER BY [ID] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sds_Victories" runat="server" ConnectionString='<%$ ConnectionStrings:WeChangeConnectionString %>' SelectCommand="SELECT [PetitionerID], [Title], [PDescription], [DecisionMaker], [Decision], [DecisionDT], [Signs], [Pname],[ID] FROM [Petitions] WHERE ([Decision] = @Decision)">
            <SelectParameters>
            <asp:Parameter DefaultValue="a" Name="Decision" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
