<%@ Page Title="Control Panel" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="ControlPanel.aspx.cs" Inherits="ControlPanel" %>

<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .EditButton {
            border-radius: 7px;
            background-color: dodgerblue;
            height: 35px;
            width: 100px;
            color: white;
            cursor: pointer;
            border-color: White;
            border-style: Solid;
            border-width: 2px;
            font-weight: bold;
            font-size: Medium;
            font-family: Corbel;
        }

        caption {
            padding-top: 8px;
            padding-bottom: 8px;
            color: #fff;
            background-color: #003d67;
            text-align: center;
            font-variant: small-caps;
            font-size: large;
        }
        .auto-style1 {
            display: block;
            margin-right: auto;
            margin-left: auto;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />

    <div style="text-align: -webkit-center;text-align: -moz-center;">
        <asp:Login ID="Login1" runat="server" Style="background-color: #009999; border-collapse: collapse; min-width: 40%; border-radius: 20px;" BackColor="#009999" Font-Names="Bahnschrift Light,Medium" Font-Size="Medium" ForeColor="#FFFFCC" Height="330px" InstructionText="this page is specific for only admins" LoginButtonImageUrl="~/ico/login_48.png" LoginButtonType="Image" OnAuthenticate="Login1_Authenticate" PasswordLabelText="Password :" UserNameLabelText="User Name :" Width="470px" LoginButtonStyle-Height="30px" LoginButtonStyle-Width="30px">
            <CheckBoxStyle CssClass="checkbox icheck-warning" Font-Names="Bahnschrift Light" Font-Size="Medium" VerticalAlign="Bottom" HorizontalAlign="Center" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LabelStyle HorizontalAlign="Right" />
            <LoginButtonStyle Font-Names="Verdana" Height="48px" Width="48px" />
            <TextBoxStyle Font-Size="Medium" ForeColor="Black" Font-Names="bahnschrift light, medium" Height="30px" Width="200px" />
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="Medium" ForeColor="White" VerticalAlign="Middle" Font-Names="Bauhaus 93" />
            <ValidatorTextStyle Font-Size="Large" />
        </asp:Login>
    </div>

    <br />
    <br />
    <br />


    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" Visible="False">
        <ContentTemplate>

            <div class="auto-style1" style="width: 100%;">
                <asp:GridView ID="GridView1" runat="server" BorderColor="White" BorderStyle="Outset" BorderWidth="2px" CellPadding="1" CellSpacing="1" DataKeyNames="UserID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" Caption="Users Details" Font-Names="Gadugi" ForeColor="White" Width="100%" AutoGenerateColumns="False" PageSize="5" HorizontalAlign="Center">
                    <Columns>
                        <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID"></asp:BoundField>
                        <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName"></asp:BoundField>
                        <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName"></asp:BoundField>
                        <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username"></asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"></asp:BoundField>
                        <asp:BoundField DataField="UserType" HeaderText="UserType" SortExpression="UserType"></asp:BoundField>
                        <asp:BoundField DataField="NationalID" HeaderText="NationalID" SortExpression="NationalID"></asp:BoundField>
                        <asp:BoundField DataField="EduLevel" HeaderText="EduLevel" SortExpression="EduLevel"></asp:BoundField>
                        <asp:BoundField DataField="Level" HeaderText="Level" SortExpression="Level"></asp:BoundField>
                        <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject"></asp:BoundField>
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                        <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime"></asp:BoundField>


                        <asp:CommandField ButtonType="Button" ControlStyle-CssClass="EditButton" ControlStyle-BackColor="Red" ShowDeleteButton="True" HeaderText="Delete">
                            <ControlStyle BackColor="Red" CssClass="EditButton"></ControlStyle>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>

                        <asp:CommandField ButtonType="Button" ControlStyle-CssClass="EditButton" ShowEditButton="True" HeaderText="Update">
                            <ControlStyle CssClass="EditButton"></ControlStyle>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Columns>
                    <RowStyle BackColor="#53d457" ForeColor="White" Font-Names="Gadugi" />
                    <AlternatingRowStyle BackColor="#4caf4f" ForeColor="White" />
                    <EmptyDataRowStyle ForeColor="Black" HorizontalAlign="Center" />
                    <EmptyDataTemplate>no users data here</EmptyDataTemplate>
                    <EditRowStyle Font-Bold="True" ForeColor="Black" />
                    <HeaderStyle BackColor="#285629" Font-Bold="True" ForeColor="White" Font-Names="Gadugi" Font-Size="Medium" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#285629" Font-Names="Gadugi" Font-Bold="True" Height="50px" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnecting2 %>" DeleteCommand="DELETE FROM [Tbl_User] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [Tbl_User] ([FName], [LName], [Username], [Email], [Password], [Phone], [UserType], [NationalID], [EduLevel], [Level], [Subject], [Status], [DateTime]) VALUES (@FName, @LName, @Username, @Email, @Password, @Phone, @UserType, @NationalID, @EduLevel, @Level, @Subject, @Status, @DateTime)" SelectCommand="SELECT * from Tbl_User" UpdateCommand="UPDATE [Tbl_User] SET [FName] = @FName, [LName] = @LName, [Username] = @Username, [Email] = @Email, [Password] = @Password, [Phone] = @Phone, [UserType] = @UserType, [NationalID] = @NationalID, [EduLevel] = @EduLevel, [Level] = @Level, [Subject] = @Subject, [Status] = @Status, [DateTime] = @DateTime WHERE [UserID] = @UserID">
                <DeleteParameters>
                    <asp:Parameter Name="UserID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="UserType" Type="String" />
                    <asp:Parameter Name="NationalID" Type="String" />
                    <asp:Parameter Name="EduLevel" Type="String" />
                    <asp:Parameter Name="Level" Type="String" />
                    <asp:Parameter Name="Subject" Type="String" />
                    <asp:Parameter Name="Status" Type="Int32" />
                    <asp:Parameter Name="DateTime" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="UserType" Type="String" />
                    <asp:Parameter Name="NationalID" Type="String" />
                    <asp:Parameter Name="EduLevel" Type="String" />
                    <asp:Parameter Name="Level" Type="String" />
                    <asp:Parameter Name="Subject" Type="String" />
                    <asp:Parameter Name="Status" Type="Int32" />
                    <asp:Parameter Name="DateTime" Type="String" />
                    <asp:Parameter Name="UserID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <hr />

            <div class="center-block" style="width: 100%;">
                <div class="text-center">
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BorderColor="White" BorderStyle="Outset" BorderWidth="2px" Caption="Collage Details" CellPadding="1" CellSpacing="1" DataKeyNames="SubjectID" DataSourceID="SqlDataSource2" Font-Names="Gadugi" ForeColor="White" HorizontalAlign="Center" PageSize="6" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="SubjectID" HeaderText="SubjectID" InsertVisible="False" ReadOnly="True" SortExpression="SubjectID" />
                            <asp:BoundField DataField="SubjectName" HeaderText="SubjectName" SortExpression="SubjectName" />
                            <asp:BoundField DataField="EduLevelID" HeaderText="EduLevelID" SortExpression="EduLevelID" />
                            <asp:BoundField DataField="EduLevelName" HeaderText="EduLevelName" SortExpression="EduLevelName" />
                            <asp:CommandField ButtonType="Button" ControlStyle-BackColor="Red" ControlStyle-CssClass="EditButton" HeaderText="Delete" ShowDeleteButton="True">
                            <ControlStyle BackColor="Red" CssClass="EditButton" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                            <asp:CommandField ButtonType="Button" ControlStyle-CssClass="EditButton" HeaderText="Update" ShowEditButton="True">
                            <ControlStyle CssClass="EditButton" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <RowStyle BackColor="#057ece" Font-Names="Gadugi" ForeColor="White" />
                        <AlternatingRowStyle BackColor="#165e8e" ForeColor="White" />
                        <EmptyDataRowStyle ForeColor="Black" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            no users data here
                        </EmptyDataTemplate>
                        <EditRowStyle Font-Bold="True" ForeColor="Black" />
                        <HeaderStyle BackColor="#003d67" Font-Bold="True" Font-Names="Gadugi" Font-Size="Medium" ForeColor="White" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="#003d67" Font-Bold="True" Font-Names="Gadugi" ForeColor="White" Height="50px" HorizontalAlign="Center" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                </div>




                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnecting2 %>" DeleteCommand="DELETE FROM [Tbl_Subject] WHERE [SubjectID] = @SubjectID" InsertCommand="INSERT INTO [Tbl_Subject] ([SubjectName], [EduLevelID]) VALUES (@SubjectName, @EduLevelID)" SelectCommand="SELECT Tbl_Subject.*, Tbl_EduLevel.EduLevelName FROM Tbl_Subject INNER JOIN Tbl_EduLevel ON Tbl_Subject.EduLevelID = Tbl_EduLevel.EduLevelID" UpdateCommand="UPDATE [Tbl_Subject] SET [SubjectName] = @SubjectName, [EduLevelID] = @EduLevelID WHERE [SubjectID] = @SubjectID">
                    <DeleteParameters>
                        <asp:Parameter Name="SubjectID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SubjectName" Type="String" />
                        <asp:Parameter Name="EduLevelID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SubjectName" Type="String" />
                        <asp:Parameter Name="EduLevelID" Type="Int32" />
                        <asp:Parameter Name="SubjectID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
            <hr />

            <div class="center-block" style="width: 100%;">
                <div class="text-center">
                    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BorderColor="White" BorderStyle="Outset" BorderWidth="2px" Caption="Questions and Answers Details" CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSource3" Font-Names="Gadugi" ForeColor="White" HorizontalAlign="Center" PageSize="6" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="QuestionID" HeaderText="QuestionID" InsertVisible="False" ReadOnly="True" SortExpression="QuestionID" />
                            <asp:BoundField DataField="QuestionDesc" HeaderText="QuestionDesc" SortExpression="QuestionDesc" />
                            <asp:BoundField DataField="AnswerA" HeaderText="AnswerA" SortExpression="AnswerA" />
                            <asp:BoundField DataField="AnswerB" HeaderText="AnswerB" SortExpression="AnswerB" />
                            <asp:BoundField DataField="AnswerC" HeaderText="AnswerC" SortExpression="AnswerC" />
                            <asp:BoundField DataField="AnswerD" HeaderText="AnswerD" SortExpression="AnswerD" />
                            <asp:BoundField DataField="CorrectAnswer" HeaderText="CorrectAnswer" SortExpression="CorrectAnswer" />
                            <asp:BoundField DataField="QuestionType" HeaderText="QuestionType" SortExpression="QuestionType" />
                            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                            <asp:BoundField DataField="SubjectID" HeaderText="SubjectID" SortExpression="SubjectID" />
                            <asp:BoundField DataField="QuestionLevel" HeaderText="QuestionLevel" SortExpression="QuestionLevel" />
                            <asp:BoundField DataField="Chapter" HeaderText="Chapter" SortExpression="Chapter" />
                            <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime" />
                            <asp:CommandField ButtonType="Button" ControlStyle-BackColor="Red" ControlStyle-CssClass="EditButton" HeaderText="Delete" ShowDeleteButton="True">
                            <ControlStyle BackColor="Red" CssClass="EditButton" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                            <asp:CommandField ButtonType="Button" ControlStyle-CssClass="EditButton" HeaderText="Update" ShowEditButton="True">
                            <ControlStyle CssClass="EditButton" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <RowStyle BackColor="#ff5f5f" Font-Names="Gadugi" ForeColor="White" />
                        <AlternatingRowStyle BackColor="#ff2525" ForeColor="White" />
                        <EmptyDataRowStyle ForeColor="Black" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            no users data here
                        </EmptyDataTemplate>
                        <EditRowStyle Font-Bold="True" ForeColor="Black" />
                        <HeaderStyle BackColor="#920e0e" Font-Bold="True" Font-Names="Gadugi" Font-Size="Medium" ForeColor="White" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="#920e0e" Font-Bold="True" Font-Names="Gadugi" ForeColor="White" Height="50px" HorizontalAlign="Center" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                </div>




                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnecting2 %>" DeleteCommand="DELETE FROM [Tbl_Ques_Ans] WHERE [QuestionID] = @QuestionID" InsertCommand="INSERT INTO [Tbl_Ques_Ans] ([QuestionDesc], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [CorrectAnswer], [QuestionType], [Username], [SubjectID], [QuestionLevel], [Chapter], [DateTime]) VALUES (@QuestionDesc, @AnswerA, @AnswerB, @AnswerC, @AnswerD, @CorrectAnswer, @QuestionType, @Username, @SubjectID, @QuestionLevel, @Chapter, @DateTime)" UpdateCommand="UPDATE [Tbl_Ques_Ans] SET [QuestionDesc] = @QuestionDesc, [AnswerA] = @AnswerA, [AnswerB] = @AnswerB, [AnswerC] = @AnswerC, [AnswerD] = @AnswerD, [CorrectAnswer] = @CorrectAnswer, [QuestionType] = @QuestionType, [Username] = @Username, [SubjectID] = @SubjectID, [QuestionLevel] = @QuestionLevel, [Chapter] = @Chapter, [DateTime] = @DateTime WHERE [QuestionID] = @QuestionID" SelectCommand="SELECT * FROM [Tbl_Ques_Ans]">
                    <DeleteParameters>
                        <asp:Parameter Name="QuestionID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="QuestionDesc" Type="String" />
                        <asp:Parameter Name="AnswerA" Type="String" />
                        <asp:Parameter Name="AnswerB" Type="String" />
                        <asp:Parameter Name="AnswerC" Type="String" />
                        <asp:Parameter Name="AnswerD" Type="String" />
                        <asp:Parameter Name="CorrectAnswer" Type="String" />
                        <asp:Parameter Name="QuestionType" Type="String" />
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="SubjectID" Type="Int32" />
                        <asp:Parameter Name="QuestionLevel" Type="String" />
                        <asp:Parameter Name="Chapter" Type="String" />
                        <asp:Parameter Name="DateTime" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="QuestionDesc" Type="String" />
                        <asp:Parameter Name="AnswerA" Type="String" />
                        <asp:Parameter Name="AnswerB" Type="String" />
                        <asp:Parameter Name="AnswerC" Type="String" />
                        <asp:Parameter Name="AnswerD" Type="String" />
                        <asp:Parameter Name="CorrectAnswer" Type="String" />
                        <asp:Parameter Name="QuestionType" Type="String" />
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="SubjectID" Type="Int32" />
                        <asp:Parameter Name="QuestionLevel" Type="String" />
                        <asp:Parameter Name="Chapter" Type="String" />
                        <asp:Parameter Name="DateTime" Type="String" />
                        <asp:Parameter Name="QuestionID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
            <hr />

            <div class="center-block" style="width: 100%;">
                <div class="text-center">
                    <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BorderColor="White" BorderStyle="Outset" BorderWidth="2px" Caption="Marks Details" CellPadding="1" CellSpacing="1" DataKeyNames="CertificationID" DataSourceID="SqlDataSource4" Font-Names="Gadugi" ForeColor="White" HorizontalAlign="Center" PageSize="6" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="CertificationID" HeaderText="CertificationID" InsertVisible="False" ReadOnly="True" SortExpression="CertificationID" />
                            <asp:BoundField DataField="SuccessedMarks" HeaderText="SuccessedMarks" SortExpression="SuccessedMarks" />
                            <asp:BoundField DataField="WrongedMarks" HeaderText="WrongedMarks" SortExpression="WrongedMarks" />
                            <asp:BoundField DataField="NotAnswered" HeaderText="NotAnswered" SortExpression="NotAnswered" />
                            <asp:BoundField DataField="ObtainedMarks" HeaderText="ObtainedMarks" SortExpression="ObtainedMarks" />
                            <asp:BoundField DataField="TotalMarks" HeaderText="TotalMarks" SortExpression="TotalMarks" />
                            <asp:BoundField DataField="TotalQuestions" HeaderText="TotalQuestions" SortExpression="TotalQuestions" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="SubjectID" HeaderText="SubjectID" SortExpression="SubjectID" />
                            <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime" />
                            <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                            <asp:CommandField ButtonType="Button" ControlStyle-BackColor="Red" ControlStyle-CssClass="EditButton" HeaderText="Delete" ShowDeleteButton="True">
                            <ControlStyle BackColor="Red" CssClass="EditButton" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                            <asp:CommandField ButtonType="Button" ControlStyle-CssClass="EditButton" HeaderText="Update" ShowEditButton="True">
                            <ControlStyle CssClass="EditButton" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <RowStyle BackColor="#31b187" Font-Names="Gadugi" ForeColor="White" />
                        <AlternatingRowStyle BackColor="#118268" ForeColor="White" />
                        <EmptyDataRowStyle ForeColor="Black" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            no users data here
                        </EmptyDataTemplate>
                        <EditRowStyle Font-Bold="True" ForeColor="Black" />
                        <HeaderStyle BackColor="#105a49" Font-Bold="True" Font-Names="Gadugi" Font-Size="Medium" ForeColor="White" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="#105a49" Font-Bold="True" Font-Names="Gadugi" ForeColor="White" Height="50px" HorizontalAlign="Center" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                </div>




                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnecting2 %>" DeleteCommand="DELETE FROM [Tbl_Certification] WHERE [CertificationID] = @CertificationID" InsertCommand="INSERT INTO [Tbl_Certification] ([SuccessedMarks], [WrongedMarks], [NotAnswered], [ObtainedMarks], [TotalMarks], [TotalQuestions], [UserName], [SubjectID], [DateTime], [UserID]) VALUES (@SuccessedMarks, @WrongedMarks, @NotAnswered, @ObtainedMarks, @TotalMarks, @TotalQuestions, @UserName, @SubjectID, @DateTime, @UserID)" UpdateCommand="UPDATE [Tbl_Certification] SET [SuccessedMarks] = @SuccessedMarks, [WrongedMarks] = @WrongedMarks, [NotAnswered] = @NotAnswered, [ObtainedMarks] = @ObtainedMarks, [TotalMarks] = @TotalMarks, [TotalQuestions] = @TotalQuestions, [UserName] = @UserName, [SubjectID] = @SubjectID, [DateTime] = @DateTime, [UserID] = @UserID WHERE [CertificationID] = @CertificationID" SelectCommand="SELECT * FROM [Tbl_Certification]">
                    <DeleteParameters>
                        <asp:Parameter Name="CertificationID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SuccessedMarks" Type="Double" />
                        <asp:Parameter Name="WrongedMarks" Type="Double" />
                        <asp:Parameter Name="NotAnswered" Type="Double" />
                        <asp:Parameter Name="ObtainedMarks" Type="Double" />
                        <asp:Parameter Name="TotalMarks" Type="Double" />
                        <asp:Parameter Name="TotalQuestions" Type="Double" />
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="SubjectID" Type="Int32" />
                        <asp:Parameter Name="DateTime" Type="String" />
                        <asp:Parameter Name="UserID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SuccessedMarks" Type="Double" />
                        <asp:Parameter Name="WrongedMarks" Type="Double" />
                        <asp:Parameter Name="NotAnswered" Type="Double" />
                        <asp:Parameter Name="ObtainedMarks" Type="Double" />
                        <asp:Parameter Name="TotalMarks" Type="Double" />
                        <asp:Parameter Name="TotalQuestions" Type="Double" />
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="SubjectID" Type="Int32" />
                        <asp:Parameter Name="DateTime" Type="String" />
                        <asp:Parameter Name="UserID" Type="Int32" />
                        <asp:Parameter Name="CertificationID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
            <hr />


            <div class="center-block" style="min-width: 100%;">
                <div class="text-center">
                    <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BorderColor="White" BorderStyle="Outset" BorderWidth="2px" Caption="Admin Details" CellPadding="1" CellSpacing="1" DataKeyNames="AdminId" DataSourceID="SqlDataSource5" Font-Names="Gadugi" ForeColor="White" HorizontalAlign="Center" PageSize="6" Width="100%">
                        <RowStyle BackColor="#057ece" Font-Names="Gadugi" ForeColor="White" />
                        <AlternatingRowStyle BackColor="#165e8e" ForeColor="White" />
                        <EmptyDataRowStyle ForeColor="Black" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            no data here
                        </EmptyDataTemplate>
                        <Columns>
                            <asp:BoundField DataField="AdminId" HeaderText="AdminId" InsertVisible="False" ReadOnly="True" SortExpression="AdminId" />
                            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                            <asp:CommandField ButtonType="Button" ControlStyle-BackColor="Red" ControlStyle-CssClass="EditButton" HeaderText="Delete" ShowDeleteButton="True">
                            <ControlStyle BackColor="Red" CssClass="EditButton" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                            <asp:CommandField ButtonType="Button" ControlStyle-CssClass="EditButton" HeaderText="Update" ShowEditButton="True">
                            <ControlStyle CssClass="EditButton" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <EditRowStyle Font-Bold="True" ForeColor="Black" />
                        <HeaderStyle BackColor="#003d67" Font-Bold="True" Font-Names="Gadugi" Font-Size="Medium" ForeColor="White" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="#003d67" Font-Bold="True" Font-Names="Gadugi" ForeColor="White" Height="50px" HorizontalAlign="Center" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                </div>




                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnecting2 %>" DeleteCommand="DELETE FROM [Tbl_Admin] WHERE [AdminId] = @AdminId" InsertCommand="INSERT INTO [Tbl_Admin] ([Username], [Password]) VALUES (@Username, @Password)" SelectCommand="SELECT * FROM [Tbl_Admin]" UpdateCommand="UPDATE [Tbl_Admin] SET [Username] = @Username, [Password] = @Password WHERE [AdminId] = @AdminId">
                    <DeleteParameters>
                        <asp:Parameter Name="AdminId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="AdminId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

