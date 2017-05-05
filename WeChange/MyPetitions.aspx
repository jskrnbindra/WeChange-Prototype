<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderFooter.Master" AutoEventWireup="true" CodeBehind="MyPetitions.aspx.cs" Inherits="WeChange.MyPetitions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBody" runat="server">
    <asp:Repeater ID="rpt_MyPetitions" runat="server">
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

</asp:Content>
