<%@ Page Title="My Statistic" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="ProfStatistic.aspx.cs" Inherits="ProfStatistic" %>
<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            background-color: black;
            padding: 15px 0px;
            color: aqua;
            font-variant: petite-caps;
            border-radius: 20px 0px;
            width: 660px;
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

        .EditButton {
            border-radius: 7px;
            background-color: dodgerblue;
            height: 35px;
            width: 70px;
            color: white;
            cursor: pointer;
            border-color: White;
            border-style: Solid;
            border-width: 2px;
            font-weight: bold;
            font-size: Medium;
            font-family: Corbel;
        }

        .GVHeadStyle{
            text-align-last: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

        <table align="center" class="auto-style1 center-block">
            <tr>
                <td style="padding: 0px 30px;border-right-style: solid;"><h5>Count of Questions</h5></td>
                <td style="padding: 0px 10px;border-right-style: solid;"><h5>Count of MCQ Questions</h5></td>
                <td style="padding: 0px 10px;"><h5>Count of True & False Questions</h5></td>
            </tr>
            <tr style="text-align-last:center;">

                <td style="border-right-style: solid;">
                    <asp:Label ID="LabelNoQuestions" runat="server" CssClass="text-center btn btn-danger" Width="150px"></asp:Label>
                </td>
                <td style="border-right-style: solid;">
                    <asp:Label ID="LabelNoQuestionsMcq" runat="server" CssClass="text-center btn btn-warning" Width="150"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LabelNoQuestionsTf" runat="server" CssClass="text-center btn btn-info" Width="150"></asp:Label>
                </td>
            </tr>
        </table>

        <br /><br /><br /><br />

        

    <div class="center-block" style="width: 100%;">
                <asp:GridView ID="GridView2" runat="server" BorderColor="White" Style="text-align: center;" BorderStyle="Outset" BorderWidth="2px" CellPadding="1" CellSpacing="1" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" Caption="Questions and Answers Details" CaptionAlign="NotSet" Font-Names="Gadugi" ForeColor="White" Width="100%" AutoGenerateColumns="False" PageSize="6" HorizontalAlign="Center" DataKeyNames="QuestionID">

                    <Columns>
                        <asp:BoundField DataField="QuestionID" HeaderText="QuestionID" InsertVisible="False" ReadOnly="True" SortExpression="QuestionID" />
                        <asp:BoundField DataField="QuestionDesc" HeaderText="QuestionDesc" SortExpression="QuestionDesc" />
                        <asp:BoundField DataField="AnswerA" HeaderText="AnswerA" SortExpression="AnswerA" />
                        <asp:BoundField DataField="AnswerB" HeaderText="AnswerB" SortExpression="AnswerB" />
                        <asp:BoundField DataField="AnswerC" HeaderText="AnswerC" SortExpression="AnswerC" />
                        <asp:BoundField DataField="AnswerD" HeaderText="AnswerD" SortExpression="AnswerD" />
                        <asp:BoundField DataField="CorrectAnswer" HeaderText="CorrectAnswer" SortExpression="CorrectAnswer" />
                        <asp:BoundField DataField="QuestionType" HeaderText="QuestionType" SortExpression="QuestionType" />
                        <asp:BoundField DataField="QuestionLevel" HeaderText="QuestionLevel" SortExpression="QuestionLevel" />
                        <asp:BoundField DataField="Chapter" HeaderText="Chapter" SortExpression="Chapter" />
                        <asp:BoundField DataField="SubjectID" HeaderText="SubjectID" SortExpression="SubjectID" />
                    
                    <asp:CommandField ButtonType="Button" ControlStyle-CssClass="EditButton" ControlStyle-BackColor="Red" ShowDeleteButton="True" HeaderText="Delete">
                            <ControlStyle BackColor="Red" CssClass="EditButton"></ControlStyle>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>

                        <asp:CommandField ButtonType="Button" ControlStyle-CssClass="EditButton" ShowEditButton="True" HeaderText="Update">
                            <ControlStyle CssClass="EditButton"></ControlStyle>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>

                    </Columns>
                    <RowStyle BackColor="#2f695c" ForeColor="White" Font-Names="Gadugi" />
                    <AlternatingRowStyle BackColor="#21806a" ForeColor="White" />
                    <EmptyDataRowStyle ForeColor="Black" HorizontalAlign="Center" />
                    <EmptyDataTemplate>no users data here </EmptyDataTemplate>

                    <EditRowStyle Font-Bold="True" ForeColor="Black" />
                    <HeaderStyle BackColor="#0c3129" Font-Bold="True" CssClass="GVHeadStyle" ForeColor="White" Font-Names="Gadugi" Font-Size="13px" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#0c3129" Font-Names="Gadugi" Font-Bold="True" Height="50px" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>


                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnecting %>" DeleteCommand="DELETE FROM [Tbl_Ques_Ans] WHERE [QuestionID] = @QuestionID" InsertCommand="INSERT INTO [Tbl_Ques_Ans] ([QuestionDesc], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [CorrectAnswer], [QuestionType], [QuestionLevel], [Chapter], [SubjectID]) VALUES (@QuestionDesc, @AnswerA, @AnswerB, @AnswerC, @AnswerD, @CorrectAnswer, @QuestionType, @QuestionLevel, @Chapter, @SubjectID)" SelectCommand="SELECT [QuestionID], [QuestionDesc], [AnswerA], [AnswerB], [AnswerC], [AnswerD], [CorrectAnswer], [QuestionType], [QuestionLevel], [Chapter], [SubjectID] FROM [Tbl_Ques_Ans] WHERE ([Username] = @Username)" UpdateCommand="UPDATE [Tbl_Ques_Ans] SET [QuestionDesc] = @QuestionDesc, [AnswerA] = @AnswerA, [AnswerB] = @AnswerB, [AnswerC] = @AnswerC, [AnswerD] = @AnswerD, [CorrectAnswer] = @CorrectAnswer, [QuestionType] = @QuestionType, [QuestionLevel] = @QuestionLevel, [Chapter] = @Chapter, [SubjectID] = @SubjectID WHERE [QuestionID] = @QuestionID">
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
                        <asp:Parameter Name="QuestionLevel" Type="String" />
                        <asp:Parameter Name="Chapter" Type="String" />
                        <asp:Parameter Name="SubjectID" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="Username" SessionField="Name" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="QuestionDesc" Type="String" />
                        <asp:Parameter Name="AnswerA" Type="String" />
                        <asp:Parameter Name="AnswerB" Type="String" />
                        <asp:Parameter Name="AnswerC" Type="String" />
                        <asp:Parameter Name="AnswerD" Type="String" />
                        <asp:Parameter Name="CorrectAnswer" Type="String" />
                        <asp:Parameter Name="QuestionType" Type="String" />
                        <asp:Parameter Name="QuestionLevel" Type="String" />
                        <asp:Parameter Name="Chapter" Type="String" />
                        <asp:Parameter Name="SubjectID" Type="Int32" />
                        <asp:Parameter Name="QuestionID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
            <hr />


        <asp:gridview runat="server" ID="GridView1" Style="text-align: center;" AutoGenerateColumns="False" Height="100px" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" Width="100%" Caption="Details of My Students">
            <Columns>
                <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName" />
                <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="EduLevel" HeaderText="EduLevel" SortExpression="EduLevel" />
                <asp:BoundField DataField="Level" HeaderText="Level" SortExpression="Level" />
            </Columns>

            <RowStyle BackColor="#479ef9" ForeColor="White" Font-Names="Gadugi" />
                    <AlternatingRowStyle BackColor="#087cf5" ForeColor="White" />
                    <EmptyDataRowStyle ForeColor="Black" HorizontalAlign="Center" />
                    <EmptyDataTemplate>no users data here </EmptyDataTemplate>

                    <EditRowStyle Font-Bold="True" ForeColor="Black" />
                    <HeaderStyle BackColor="#265b92" Font-Bold="True" CssClass="GVHeadStyle" ForeColor="White" Font-Names="Gadugi" Font-Size="13px" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#265b92" Font-Names="Gadugi" Font-Bold="True" Height="50px" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:gridview>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnecting2 %>" SelectCommand="SELECT [FName], [LName], [Username], [Email], [Phone], [EduLevel], [Level] FROM [Tbl_User] WHERE (([UserType] &lt;&gt; @UserType) AND ([EduLevel] = @EduLevel))">
            <SelectParameters>
                <asp:SessionParameter Name="UserType" SessionField="UserType" Type="String" />
                <asp:SessionParameter Name="EduLevel" SessionField="EducationLevel" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

            </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <br />


     </asp:Content>

