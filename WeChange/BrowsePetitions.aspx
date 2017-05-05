<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="BrowsePetitions.aspx.cs" Inherits="WeChange.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <h1>Browse Petitions</h1>
    <asp:TextBox ID="tb_search" runat="server" placeholder="Search all petitions"></asp:TextBox>
    <asp:Button ID="btn_search" runat="server" Text="Search" OnClick="btn_search_Click" />
    <div class="ButtonsHolder">
        <asp:Button ID="btn_Trending" runat="server" CssClass="SorterButtons" Text="Trending" OnClick="btn_Trending_Click" />
        <asp:Button ID="btn_Latest" runat="server" CssClass="SorterButtons"  Text="Latest" OnClick="btn_Latest_Click" />
        <asp:Button ID="btn_Victories" runat="server" CssClass="SorterButtons" Text="Victories" OnClick="btn_Victories_Click" />
        <asp:Button ID="btn_MPetitions" runat="server" CssClass="SorterButtons" Text="My Petitions" OnClick="btn_MPetitions_Click" />
    </div>
    <br />
    <br />
    <asp:Repeater ID="rpt_Victories" runat="server" OnItemCommand="rpt_Victories_ItemCommand" DataSourceID="sds_Victories" Visible="false">
       <HeaderTemplate>victories</HeaderTemplate>
           <ItemTemplate>
                <div class="PetitionHolder" style="background:#eecaca;overflow:hidden">
                    <h6>Petitioned to <%# Eval("DecisionMaker") %></h6>
                    <br />
                    <h3>
                    <a href="SignPetition.aspx?PetitionID=<%# Eval("ID") %>"><%# Eval("title") %></a>
                     </h3>
                    <br />
                    <p class="PetitionDescription"><%# Eval("PDescription") %></p>
                    <br />
                    <!-- PLACE A TICK SYMBOL IN TOP RIGHT-->
                    by <%# Eval("Pname") %> (<%# Eval("PetitionerID") %>)<br />
                    Accepted on <%# Eval("DecisionDT") %><br />
                    <%# Eval("Signs") %> Signatures
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                <br /><hr /><br /> 
            </SeparatorTemplate>
    </asp:Repeater>
    <asp:Repeater ID="rpt_Trending" runat="server" DataSourceID="sds_Trending">
       <HeaderTemplate>Trending</HeaderTemplate>
           <ItemTemplate>
           <div class="PetitionHolder" style="background:#eecaca;overflow:hidden">
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
                <br /><hr /><br /> 
        </SeparatorTemplate>
        
    </asp:Repeater>
    <asp:Repeater ID="rpt_Latest" runat="server" DataSourceID="sds_Latest" Visible="false">
     <HeaderTemplate>Latest</HeaderTemplate>
    <ItemTemplate>
           <div class="PetitionHolder" style="background:#eecaca;overflow:hidden">
                <h6>Petitioned to <%# Eval("DecisionMaker") %></h6>
                    <br />
                   <h3>
                    <a href="SignPetition.aspx?PetitionID=<%# Eval("ID") %>"><%# Eval("title") %></a>
                     </h3>
                    <br />
                    <p class="PetitionDescription"><%# Eval("PDescription") %></p>
                    <br />
                   
                    Started on <%# Eval("DT") %><br />
               by <%# Eval("Pname") %> (<%# Eval("PetitionerID") %>)<br />
                    <%# Eval("Signs") %> Signatures
           </div> 
        </ItemTemplate>
        <SeparatorTemplate>
                <br /><hr /><br /> 
        </SeparatorTemplate>
    </asp:Repeater>
    <asp:Repeater ID="rpt_MyPetitions" runat="server" Visible="false">
       <HeaderTemplate>  My petitions</HeaderTemplate>    
        <ItemTemplate>
                <div class="PetitionHolder" style="background:#eecaca;overflow:hidden">
                    <h6>Petitioned to <%# Eval("DecisionMaker") %></h6> on <%# Eval("DT") %>
                    <br />
                    <h3>
                    <a href="SignPetition.aspx?PetitionID=<%# Eval("ID") %>"><%# Eval("title") %></a>
                     </h3>
                    <br />
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
                <br /><hr /><br /> 
            </SeparatorTemplate>
    </asp:Repeater>

    <asp:Repeater ID="SearchResults" runat="server" Visible="false">
       <HeaderTemplate>Search Results</HeaderTemplate>
        <ItemTemplate>
           <div class="PetitionHolder" style="background:#eecaca;overflow:hidden">
                <h6>Petitioned to <%# Eval("DecisionMaker") %></h6>
                    <br />
                      <h3>
                    <a href="SignPetition.aspx?PetitionID=<%# Eval("ID") %>"><%# Eval("title") %></a>
                     </h3>
                    <br />
                    <p class="PetitionDescription"><%# Eval("PDescription") %></p>
                    <br />
                   
                    Started on <%# Eval("DT") %><br />
               by <%# Eval("Pname") %> (<%# Eval("PetitionerID") %>)<br />
                    <%# Eval("Signs") %> Signatures
           </div> 
        </ItemTemplate>
        <SeparatorTemplate>
                <br /><hr /><br /> 
        </SeparatorTemplate>
    </asp:Repeater>
    
    <asp:SqlDataSource ID="sds_Trending" runat="server" ConnectionString='<%$ ConnectionStrings:WeChangeConnectionString %>' SelectCommand="SELECT [Pname], [PetitionerID], [Title], [PDescription], [DecisionMaker], [Signs],[DT],[ID] FROM [Petitions] ORDER BY [Signs] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sds_Latest" runat="server" ConnectionString='<%$ ConnectionStrings:WeChangeConnectionString %>' SelectCommand="SELECT [PetitionerID], [Title], [PDescription], [Pname], [DT], [Signs], [DecisionMaker],[ID] FROM [Petitions] ORDER BY [ID] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sds_Victories" runat="server" ConnectionString='<%$ ConnectionStrings:WeChangeConnectionString %>' SelectCommand="SELECT [PetitionerID], [Title], [PDescription], [DecisionMaker], [Decision], [DecisionDT], [Signs], [Pname],[ID] FROM [Petitions] WHERE ([Decision] = @Decision)">
        <SelectParameters>
            <asp:Parameter DefaultValue="a" Name="Decision" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sds_MPetitions" runat="server" ConnectionString='<%$ ConnectionStrings:WeChangeConnectionString %>' SelectCommand="SELECT [PetitionerID], [Title], [PDescription], [DecisionMaker], [Decision], [DecisionDesc], [DecisionDT], [DT], [Signs], [Pname],[ID] FROM [Petitions] WHERE ([PetitionerID] = <%# RegNo %>">
        <SelectParameters>
            <asp:CookieParameter CookieName="RegNo" Name="PetitionerID2" Type="Int32"></asp:CookieParameter>
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
