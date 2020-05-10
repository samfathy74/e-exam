<%@ Page Title="Exam Page ⏳" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="Exam.aspx.cs" Inherits="Exam" %>
<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            margin-top: -50px;
            /*prevent user from select and copy content of mysite*/
            -webkit-user-select: none;
            user-select: none;
            -webkit-touch-callout: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }

        .auto-style2 {
            width: 79%;
            height: -42px;
            margin-top: 9px;
            margin-bottom: 10px;
        }

        .Label-NOofQuestion {
            background-color: #088c9c;
            color: white;
            text-align: center;
            padding: 5px;
            border-radius: 50px;
            /*width: 200px;*/
            text-shadow: black 0px 0px 6px;
            border-style: solid;
        }

        .Label-Question {
            background-color: #fffbaa;
            border-style: ridge;
            border-width: 5px;
            padding-left: 20px;
            border-radius: 20px;
            border-color: #2e96a2;
            padding: 20px;
        }
    </style>
        <link href="Style/StyleCount.css" rel="stylesheet"  />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Label ID="LabelCounterTime" runat="server" Visible="false"></asp:Label>

    <asp:Panel runat="server" ID="PanelTime">
        <div id="clockdiv" class="center-block">
            <div>
                <span class="hours" id="hour"></span>
                <div class="smalltext">Hours</div>
            </div>
            <div>
                <span class="minutes" id="minute"></span>
                <div class="smalltext">Minutes</div>
            </div>
            <div>
                <span class="seconds" id="second"></span>
                <div class="smalltext">Seconds</div>
            </div>
        </div>
        <p id="demo"></p>
        <br />
    </asp:Panel>

    <asp:DataList ID="DataListExam" runat="server" Height="100%" RepeatColumns="1" Width="90%" CellPadding="5" CellSpacing="5" CssClass="auto-style1 center-block" EnableTheming="True" ShowFooter="False" DataKeyField="QuestionID">
        <FooterTemplate>
            <asp:Image ID="Image1" runat="server" CssClass="center-block" Height="150px" ImageUrl="~/ico/notfound.png" Width="490px" />
        </FooterTemplate>
        <HeaderTemplate>

            <asp:Label ID="LabelEmptyData" CssClass="center-block" runat="server" Font-Bold="True" Font-Names="Bahnschrift Light" Font-Size="Medium" ForeColor="#333300" Text="The exam is not currently available for this course, and we are working on making it available at the earliest time" Visible="false">"></asp:Label>
            <br />
            <br />
        </HeaderTemplate>
        <ItemTemplate>

            <div class="Label-NOofQuestion center-block">
                <asp:Label ID="LabelNoQuestion" CssClass="center-block" runat="server" Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="20px">Quetion (<%# Container.ItemIndex + 1 %>)</asp:Label>
            </div>

            <div class="Label-Question">
                <asp:Label ID="LabelQuestion" runat="server" Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="20px" Text='<%# Eval("QuestionDesc") %>'></asp:Label>
                &nbsp;&nbsp;<br />
                <br />
                <asp:RadioButton ID="RadioAnswerA" runat="server" CssClass="radio icheck-amethyst" Text='<%#Eval("AnswerA") %>' ValidationGroup="RadioGroup" GroupName="RadioGroup" Font-Names="Franklin Gothic Book" Font-Size="20px" Style="left: 14px; top: 0px" />
                <asp:RadioButton ID="RadioAnswerB" runat="server" CssClass="radio icheck-amethyst" Text='<%#Eval("AnswerB") %>' ValidationGroup="RadioGroup" GroupName="RadioGroup" Font-Names="Franklin Gothic Book" Font-Size="20px" Style="left: 13px; top: 0px" />
                <asp:RadioButton ID="RadioAnswerC" runat="server" CssClass="radio icheck-amethyst" Text='<%#Eval("AnswerC") %>' ValidationGroup="RadioGroup" GroupName="RadioGroup" Font-Names="Franklin Gothic Book" Font-Size="20px" Style="left: 13px; top: 0px" />
                <asp:RadioButton ID="RadioAnswerD" runat="server" CssClass="radio icheck-amethyst" Text='<%#Eval("AnswerD") %>' ValidationGroup="RadioGroup" GroupName="RadioGroup" Font-Names="Franklin Gothic Book" Font-Size="20px" Style="left: 13px; top: 0px" />

            </div>
            <hr class="auto-style2" />
        </ItemTemplate>
    </asp:DataList>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Button ID="ButtonFinish" runat="server" Style="margin-top: 20px" CssClass="btn btn-success btn-lg center-block" Text="Finish" OnClick="ButtonFinish_Click"></asp:Button>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script>
        window.onbeforeunload = function() {
            return "you can not refresh the page";
        }


        var h =<%= Convert.ToDouble(LabelCounterTime.Text)%>;
        var s = h * 60 * 60; //convert hour to secound
        var seconds = s;


        function timer() {
            var days = Math.floor(seconds / 24 / 60 / 60);
            var hoursLeft = Math.floor((seconds) - (days * 86400));
            var hours = Math.floor(hoursLeft / 3600);
            var minutesLeft = Math.floor((hoursLeft) - (hours * 3600));
            var minutes = Math.floor(minutesLeft / 60);
            var remainingSeconds = seconds % 60;


            //output
            document.getElementById("hour").innerHTML = hours;
            document.getElementById("minute").innerHTML = minutes;
            document.getElementById("second").innerHTML = remainingSeconds;

           
            //expired
            if (seconds == 0) {
                window.onbeforeunload=null;
                clearInterval(countdownTimer);
                document.getElementById("demo").innerHTML = "Finished";
                document.getElementById("hour").innerHTML = '0';
                document.getElementById("minute").innerHTML = '0';
                document.getElementById("second").innerHTML = '0';

                document.getElementById('<%=ButtonFinish.ClientID%>').click();

               
             }
             else {
                 seconds--;
             }
         }
         var countdownTimer = setInterval('timer()', 1000);

    </script>

</asp:Content>
