<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WeChange.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <h1>WeChange - Administrator Panel</h1>

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sds_TopPetitions">
       <HeaderTemplate>Petitions which crossed <b>15,000</b> signatures</HeaderTemplate>
           <ItemTemplate>
           <div class="PetitionHolder" style="background:#eecaca;overflow:hidden">
                <h6>Department: <%# Eval("DecisionMaker") %></h6>
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
    <asp:SqlDataSource ID="sds_TopPetitions" runat="server" ConnectionString='<%$ ConnectionStrings:WeChangeConnectionString %>' SelectCommand="SELECT * FROM [Petitions] WHERE ([Signs] > @Signs and Decision='p')">
        <SelectParameters>
            <asp:Parameter DefaultValue="15000" Name="Signs" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
