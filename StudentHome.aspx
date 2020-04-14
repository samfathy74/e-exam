<%@ Page Title="" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="StudentHome.aspx.cs" Inherits="StudentHome" %>
<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Style/CSSstyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row-no-gutters">

        <div class="col-md-6 no-gutters text-left">
           
            <article class="WelcomePage">
                <p>⩥ Dear Student,</p>
                <p>
We hope you are in the best condition, we are glad to be our partner in our success.
We are the E-exam community. We wish you all the best. All you know is that you study hard so that you can succeed in our exams and get the highest results.<br />
</p>

                    <div class="row-no-gutters">

    <div class="col-md-6 no-gutters text-center">
       <p>📌You can go to the exams page from here</p>
        <div class="WelcomBtn">
        <asp:Button ID="ButtonSubject" runat="server" CssClass="btn-dark btn-lg btn-sm" Text="Subjects"  ForeColor="White" Font-Names="Segoe UI" Font-Size="Medium" OnClick="ButtonSubject_Click" />
        </div>
    </div>

            <div class="col-md-6 no-gutters text-center">
    <p>
       📌You can view your previous results from here
    </p>
    <div class="WelcomBtn">
     <asp:Button ID="ButtonStatistics" runat="server" CssClass="btn-dark btn-lg btn-sm" Text="Statistics" ForeColor="White" Font-Names="Segoe UI" Font-Size="Medium"  />
    </div>

           </div>
                        </div>
            </article>
        </div>
        
        <div class="col-md-6 no-gutters text-center">
                <asp:Image ID="Image1" runat="server" Style="margin-top:20px;margin-left:30px" AlternateText="Welcome" ImageUrl="~/ico/stud.png" Height="418px" Width="449px" />
            </div>
    </div>
</asp:Content>

