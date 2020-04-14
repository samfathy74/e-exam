<%@ Page Title="" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="ProfessorHome.aspx.cs" Inherits="ProfessorHome" %>
<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="Style/CSSstyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row-no-gutters">

        <div class="col-md-6 no-gutters text-left">
           
            <article class="WelcomePage">
                <p>⩥ Dear Professor,</p>
                <p>
                    We hope you are in the best condition, and we are glad to be your partner in our success.
                     We are an e-exam community. We wish you all the best in your work in helping us to build a successful, 
                    complete, and helpful community for our students to get an exclusive experience to take exams.
                </p>

                    <div class="row-no-gutters">

    <div class="col-md-6 no-gutters text-center">
       <p>📌You can go to exam questions page from here</p>
        <div class="WelcomBtn">
        <asp:Button ID="ButtonQuestion" runat="server" CssClass="btn-dark btn-lg btn-sm" Text="Create Question"  ForeColor="White" Font-Names="Segoe UI" Font-Size="Medium" PostBackUrl="~/ExamCreator.aspx" />
        </div>
    </div>

            <div class="col-md-6 no-gutters text-center">
    <p>
       📌You can view your previous question and some statistics from here
    </p>
    <div class="WelcomBtn">
     <asp:Button ID="ButtonStatistics" runat="server" CssClass="btn-dark btn-lg btn-sm" Text="Statistics" ForeColor="White" Font-Names="Segoe UI" Font-Size="Medium"  />
    </div>

           </div>
                        </div>
            </article>
        </div>
        
        <div class="col-md-6 no-gutters text-center">
                <asp:Image ID="Image1" Style="margin-top:30px;margin-left:30px" runat="server" AlternateText="Welcome" ImageUrl="~/ico/prof33.png" Height="400px" Width="420px" />
            </div>
    </div>
</asp:Content>

