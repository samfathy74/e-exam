﻿<%@ Page Title="My Score 🏆" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="Results.aspx.cs" Inherits="Results" %>
<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .lblSuccess {
            background-color: #bbb9b5;
            width: 250px;
            height: 150px;
            border-radius: 20px;
            box-shadow: black 0 0 5px 0px;
            padding: 1px;
            /*margin-left: 100px;*/
            margin-right:100px;
            font: menu;
        }
        .lblWrong {
            background-color: #bbb9b5;
            width: 250px;
            height: 150px;
            border-radius: 20px;
            box-shadow: black 0 0 5px 0px;
            padding: 1px;
            margin-left:100px;
            font: menu;
        }
        .lblObtain{
            background-color: #bbb9b5;
            width: 250px;
            height: 150px;
            border-radius: 20px;
            box-shadow: black 0 0 5px 0px;
            padding: 1px;
            /*margin-left: 200px;*/
            font: menu;
        }
        .lblTotalQuestion {
            background-color: #bbb9b5;
            width: 250px;
            height: 150px;
            border-radius: 20px;
            box-shadow: black 0 0 5px 0px;
            padding: 1px;
            /*margin-left: 100px;
            margin-top: 70px;*/
            margin-right:100px;
            font: menu;
        }
        .lblTotalMarks {
            background-color: #bbb9b5;
            width: 250px;
            height: 150px;
            border-radius: 20px;
            box-shadow: black 0 0 5px 0px;
            padding: 1px;
            /*margin-left: 200px;
            margin-top: 70px;*/
            font: menu;
        }
        .lblNotAnswer {
            background-color: #bbb9b5;
           min-width: 250px;
            height: 150px;
            border-radius: 20px;
            box-shadow: black 0 0 5px 0px;
            padding: 1px;
            margin-left: 100px;
          /*  margin-top: 70px;*/
            font: menu;
        }
        .lblRank {
            background-color: #bbb9b5;
            width: 250px;
            height: 150px;
            border-radius: 20px;
            box-shadow: black 0 0 5px 0px;
            padding: 1px;
            /*margin-left: 555px;
            margin-top: 70px;*/
            font: menu;
            left: 40.5%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="text-center" style="font-family: fantasy;">Result of <%=Session["ResultofExam"].ToString()%></h1>

    <asp:panel runat="server" ID="PanelQuize" Style="padding-top:40px;padding-bottom:250px;">

        <div class="center-block">
         <div class="lblRank col-md-1">
            <h3 class="text-center">Rank</h3>
            <hr class="center-block" style="width:200px;"/>
            <h3 class="text-center">
                        <asp:Label ID="LabelRankQ" runat="server" Font-Names="Bahnschrift" Font-Size="45px" ForeColor="#FFEB3B" Text="NaN"></asp:Label>
</h3>
        </div>
                </div>

        <br /><br /><br /><br /><br /> <br /><br /><br /><br /> <br /><br />
        <div class="center-block" style="max-width: max-content;">
        <div class="lblSuccess col-md-1">
            <h3 class="text-center">Sucessed Marks</h3>
            <hr class="center-block" style="width:200px;"/>
            <h3 class="text-center">
                        <asp:Label ID="LabelSucessQ" runat="server" Font-Names="Bahnschrift" Font-Size="45px" ForeColor="Green" Text="NaN"></asp:Label>
</h3>
        </div>

          <div class="lblObtain col-md-1">
            <h3 class="text-center">Obtained Marks</h3>
            <hr class="center-block" style="width:200px;"/>
            <h3 class="text-center">
                        <asp:Label ID="LabelObtainQ" runat="server" Font-Names="Bahnschrift" Font-Size="45px" ForeColor="#802796" Text="NaN"></asp:Label>
</h3>
        </div>

              <div class="lblWrong col-md-1">
            <h3 class="text-center">Wrong Marks</h3>
            <hr class="center-block" style="width:200px;"/>
            <h3 class="text-center">
                        <asp:Label ID="LabelWrongQ" runat="server" Font-Names="Bahnschrift" Font-Size="45px" ForeColor="Red" Text="NaN"></asp:Label>
</h3>
        </div>
            </div>

                    <br /><br /><br /><br /><br /><br /><br /><br /> <br /><br />
        <div class="center-block" style="max-width: max-content;">
                  <div class="lblTotalQuestion col-md-1">
            <h3 class="text-center">Total Questions No.</h3>
            <hr class="center-block" style="width:200px;"/>
            <h3 class="text-center">
                        <asp:Label ID="LabelTotalQuestionQ" runat="server" Font-Names="Bahnschrift" Font-Size="45px" ForeColor="#2c8884" Text="NaN"></asp:Label>
</h3>
        </div>

                          <div class="lblTotalMarks col-md-1">
            <h3 class="text-center">Total Mark</h3>
            <hr class="center-block" style="width:200px;"/>
            <h3 class="text-center">
                        <asp:Label ID="LabelTotalMarksQ" runat="server" Font-Names="Bahnschrift" Font-Size="45px" ForeColor="#2c8884" Text="NaN"></asp:Label>
</h3>
        </div>

                          <div class="lblNotAnswer col-md-1">
            <h3 class="text-center">Not Answered</h3>
            <hr class="center-block" style="width:200px;"/>
            <h3 class="text-center">
                        <asp:Label ID="LabelNotAnswerQ" runat="server" Font-Names="Bahnschrift" Font-Size="45px" ForeColor="#2c8884" Text="NaN"></asp:Label>
</h3>
        </div>
            </div>
          
    </asp:panel>


        <asp:Button ID="ButtonHome" runat="server" CssClass="btn btn-warning btn-lg center-block"  Text="back to home" PostBackUrl="~/StudentHome.aspx" />

</asp:Content>

