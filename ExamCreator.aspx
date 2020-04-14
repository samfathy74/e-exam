<%@ Page Title="" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="ExamCreator.aspx.cs" Inherits="ExamCreator" %>
<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link href="~/Style/CSSstyle.css" rel="stylesheet" media="all" />
    <style type="text/css">
        .auto-style1 {
            width: 102px;
        }
        .auto-style2 {
            width: 360px;
            height: 80px;
           
        }
        .auto-style3 {
            width: 102px;
            height: 45px;
        }
        .auto-style4 {
            height: 35px;
            text-align: left;
        }
        .Head {
            background-color:white;
            padding:20px;
            margin:5% 0% 5% 25%;
            border-radius:15px;
            width:500px
        }
        .ExStyle {
            /*margin: 10% 0% 0% 3%; */
            margin:auto;
            background-color: grey;
            border-radius: 15px;
            padding: 20px;
            width: 95%;
            box-shadow: black 0px 0px 10px 2px;
        }
        .Inline {
            display:inline-block
        }
        .btn {
            position:relative;
            left:70%
        }
        .TableStyle {
            margin:0% 0% 0% 8%;
            width:100%;
        }
        .btnPosition {
            margin-left:-200%
        }
        .auto-style5 {
            width: 199px;
        }
        .auto-style7 {
            height: 81px;
            width: 276px;
            text-align: center;
        }
        .auto-style8 {
            width: 199px;
            height: 81px;
            text-align: center;
        }
        .auto-style9 {
            width: 184px;
            height: 81px;
            text-align: center;
        }
        .auto-style10 {
            background-color: white;
            padding: 20px;
            margin: -30px 0px 100px 29.5%;
            border-radius: 15px;
            width: 500px;
            box-shadow: black 0px 0px 10px 2px;
        }

        .auto-style11 {
            height: 40px;
            width: 276px;
            text-align: center;
        }
        .auto-style12 {
            width: 199px;
            height: 40px;
            text-align: center;
        }
        .auto-style13 {
            width: 184px;
            height: 40px;
            text-align: center;
        }
        .auto-style14 {
            width: 184px;
        }

        .auto-style15 {
            margin: 0%;
            width: 100%;
            height: 400px;
        }
        .auto-style16 {
            height: 45px;
            width: 257px;
        }
        .auto-style18 {
            width: 184px;
            height: 45px;
        }

        .auto-style20 {
            height: 40px;
            width: 257px;
            text-align: center;
        }
        .auto-style21 {
            height: 81px;
            width: 257px;
            padding-left: 35px;
            padding-top: 10px;
        }
        .auto-style22 {
            width: 257px
        }
        .auto-style24 {
            width: 276px;
        }

        .radioButtonList {
            display: inline-table;
            font-size: 12pt;
            color: #12bd8e !important;
            -webkit-text-emphasis-style: triangle;
            text-align-last: center;
            margin-top: 10px;
            box-shadow: inset 1px 1px 20px 20px #000000;
            border-radius: 20px;
            
        }

        </style>
     <script type="text/javascript">
                  window.onbeforeunload = function() {
                      return "you can not refresh the page";
                  } 
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="auto-style10">
    <table class="auto-style2 center-block">
        <tr>
            <th class="auto-style3">
                <asp:Label ID="Label1" runat="server" Text="Professor : " Font-Names="Arial" Font-Size="Large"></asp:Label>
            </th>
            <th class="auto-style4">
                <asp:Label ID="lblFName" runat="server" Font-Names="Arial" Font-Size="Large" Text =" "></asp:Label>
                <asp:Label ID="lblLName" runat="server" Font-Names="Arial" Font-Size="Large" Text=" "></asp:Label>
            </th>
        </tr>
        <tr>
            <th class="auto-style1">
                <asp:Label ID="Label2" runat="server" Text="Subject : " Font-Names="Arial" Font-Size="Large"></asp:Label>
            </th>
           <th class="text-left">
               <asp:Label ID="lblSubject" runat="server" Font-Names="Arial" Font-Size="Large"></asp:Label>
           </th>
        </tr>
    </table>
    </div>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Always">
            <ContentTemplate>
    <asp:Panel ID="QuestionPanal" runat="server" Height="742px">
                <div class="ExStyle">
                    <table class="auto-style15 form-group">
                        <tr>
                            <th colspan="4">
                                <div class="text-center">
                                    <asp:Label ID="Label8" runat="server" Text="Create a Question" Font-Names="Corbel" Font-Size="XX-Large" ForeColor="Black"></asp:Label>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th class="auto-style22">
                                <asp:Label ID="Label9" runat="server" Text="Enter question text" Font-Names="Corbel" Font-Size="Large" ForeColor="White"></asp:Label>
                            </th>
                        </tr>
                        <tr>
                            <th colspan="4" class="text-center">
                                <asp:TextBox ID="txtQuestion" runat="server" BorderStyle="Solid" BorderWidth="2px" Font-Size="Large" ToolTip="Enter a Question" Width="100%" Hint="Enter a question here" placeholder="Enter a Question here...." Font-Names="Leelawadee" Rows="4" Columns="10" CssClass="form-control DisableTextArea" TextMode="MultiLine" ValidationGroup="Exam"></asp:TextBox>
                            </th>
                        </tr>
                        <tr>
                            <th colspan="4">
                                <div style="text-align:center">
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Question Field is Required" ControlToValidate="txtQuestion" ForeColor="Brown" ValidationGroup="Exam" CssClass="alert-danger" Display="Dynamic" Font-Bold="False" Font-Names="Consolas" Font-Size="Medium"></asp:RequiredFieldValidator>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th class="auto-style22">
                                <asp:Label ID="Label10" runat="server" Text="Enter Available Choices" ForeColor="White" Font-Size="Large" Font-Names="Corbel"></asp:Label>
                            </th>
                            <th class="auto-style18">
                                &nbsp;</th>
                            <th class="auto-style18">
                                &nbsp;</th>
                            <th class="auto-style18">
                                &nbsp;</th>
                        </tr>
                        <tr>
                            <th class="auto-style20">
                                <asp:Label ID="Label4" runat="server" Text="A" Font-Names="Segoe UI Semibold" Font-Size="Medium" ForeColor="White"></asp:Label>
                                <asp:TextBox ID="ChoiceA" runat="server" Width="281px" BorderStyle="Solid" BorderWidth="2px" ToolTip="First Choice" Height="65px" TextMode="MultiLine" placeholder="Enter First Answer here...." ValidationGroup="Exam" Font-Size="Medium"></asp:TextBox>
                                
                            </th>
                            <th class="auto-style12">
                                <asp:Label ID="Label5" runat="server" Text="B" Font-Names="Segoe UI Semibold" Font-Size="Medium" ForeColor="White"></asp:Label>
                                <asp:TextBox ID="ChoiceB" runat="server" Width="281px" BorderStyle="Solid" BorderWidth="2px" ToolTip="Secand Choice" Height="65px" TextMode="MultiLine" placeholder="Enter Second Answer here...." ValidationGroup="Exam" Font-Size="Medium" CausesValidation="False"></asp:TextBox>
                            </th>
                            <th class="auto-style11">
                                <asp:Label ID="Label6" runat="server" Text="C" Font-Names="Segoe UI Semibold" Font-Size="Medium" ForeColor="White"></asp:Label>
                                <asp:TextBox ID="ChoiceC" runat="server" Width="281px" BorderStyle="Solid" BorderWidth="2px" ToolTip="Third Choice" Height="65px" TextMode="MultiLine" placeholder="Enter Third Answer here...." ValidationGroup="Exam" Font-Size="Medium" CausesValidation="True"></asp:TextBox>
                            </th>
                            <th class="auto-style13">
                                <asp:Label ID="Label7" runat="server" Text="D" Font-Names="Segoe UI Semibold" Font-Size="Medium" ForeColor="White"></asp:Label>
                                <asp:TextBox ID="ChoiceD" runat="server" Width="281px" BorderStyle="Solid" BorderWidth="2px" ToolTip="Fourth Choice" Height="65px" TextMode="MultiLine" placeholder="Enter Fourth Answer here...." ValidationGroup="Exam" Font-Size="Medium" CausesValidation="True"></asp:TextBox>
                            </th>
                        </tr>
                        <tr>
                            <th class="text-center">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="ChoiceA" ForeColor="Brown" ValidationGroup="Exam" CssClass="alert-danger" Display="Dynamic" Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </th>
                            <th class="text-center">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="ChoiceB" ForeColor="Brown" ValidationGroup="Exam" CssClass="alert-danger" Display="Dynamic" Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </th>
                            <th class="text-center">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ControlToValidate="ChoiceC" ForeColor="Brown" ValidationGroup="Exam" CssClass="alert-danger" Display="Dynamic" Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </th>
                            <th class="text-center">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field" ControlToValidate="ChoiceD" ForeColor="Brown" ValidationGroup="Exam" CssClass="alert-danger" Display="Dynamic" Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </th>
                        </tr>
                        <tr>
                            <th class="auto-style21">
                                <asp:Label ID="Label3" runat="server" Text="Choose the correct answer :" Font-Names="Corbel" Font-Size="20px" ForeColor="White" Font-Bold="True"></asp:Label>
                                <br />
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" CausesValidation="True" Font-Names="Segoe UI Semibold" Font-Size="Large" ForeColor="White" Height="35px" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatColumns="4" Width="225px" CssClass="radioButtonList">
                                    <asp:ListItem>A</asp:ListItem>
                                    <asp:ListItem>B</asp:ListItem>
                                    <asp:ListItem>C</asp:ListItem>
                                    <asp:ListItem>D</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="RadioButtonList1" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Correct Answer is Required" Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="Exam"></asp:RequiredFieldValidator>

                            </th>
                            <th class="auto-style8">
                                    <asp:DropDownList ID="ddlQuestionLevel" runat="server" Font-Names="Corbel" Font-Size="Large" CausesValidation="True" Height="30px" Width="200px">
                                        <asp:ListItem>-- Question Level --</asp:ListItem>
                                        <asp:ListItem>Easy</asp:ListItem>
                                        <asp:ListItem>Mediam</asp:ListItem>
                                        <asp:ListItem>Difficult</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlQuestionLevel" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Level is Required" Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" InitialValue="-- Question Level --" SetFocusOnError="True" ValidationGroup="Exam"></asp:RequiredFieldValidator>
                            </th>
                            <th class="auto-style7">

                                <asp:DropDownList ID="ddlQuestionChapter" runat="server" Font-Names="Corbel" Font-Size="Large" ValidationGroup="Exam" CausesValidation="True" Height="30px" Width="200px">
                                    <asp:ListItem>--Select Chapter--</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlQuestionChapter" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Chapter is Required" Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" InitialValue="--Select Chapter--" SetFocusOnError="True" ValidationGroup="Exam"></asp:RequiredFieldValidator>
                            </th>
                            <th class="auto-style9">
                                <asp:DropDownList ID="ddlQuestionType" runat="server" OnSelectedIndexChanged="ddlQuestionType_SelectedIndexChanged" Font-Names="Corbel" Font-Size="Large" CausesValidation="True" AutoPostBack="True" Height="30px" Width="200px">

                                    <asp:ListItem>MCQ</asp:ListItem>
                                    <asp:ListItem>True OR False</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                            </th>
                        </tr>
                        <tr>
                            <th class="auto-style16">
                                <div style="text-align:center">
                                </div>
                            </th>
                            <th class="auto-style18">
                                <div style="text-align:center">
                                </div>
                            </th>
                            <th class="auto-style18">
                                <div style="text-align:center">
                                </div>
                            </th>
                            <th class="auto-style18">
                                <div style="text-align:center">
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th class="auto-style22">
                            </th>

                            <th class="auto-style5">
                                
                                <asp:Button ID="tbnNextQuestion" runat="server" Text="NEXT QUESTION" CssClass="btn btn-danger btn-radius" OnClick="tbnNextQuestion_Click" style="left: 1%; top: 0px" ToolTip="Go To Next Question" ValidationGroup="Exam" />
                            </th>
                            <th class="auto-style24">
                                <asp:Label ID="lblSuccess" runat="server" Font-Names="Corbel" Font-Size="Large"></asp:Label>
                            </th>
                            <th class="auto-style14">
                                <asp:Button ID="btnSave" runat="server" Text="SAVE EXAM"  CssClass="btn btn-danger btn-radius" style="left: 1%; top: 0px" ToolTip="Save All Changes" ValidationGroup="Exam"/>
                            </th>
                        </tr>
                    </table>
                    <div class="btnPosition">
                        <asp:Button ID="txtCancel" runat="server" Text="GO BACK"  CssClass="btn btn-danger btn-radius" OnClick="txtCancel_Click" />
                        
                    </div>
                </div>
    </asp:Panel>
                </ContentTemplate>
         </asp:UpdatePanel>
    </asp:Content>

