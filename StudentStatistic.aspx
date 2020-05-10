<%@ Page Title="My Statistic" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="StudentStatistic.aspx.cs" Inherits="StudentStatistic" %>
<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .chart1 {
            height: 400px;
            width: 680px;
            border-width: 0px;
            border-radius: 40px;
            vertical-align:inherit;
            padding-right:20px;
        }
        .wrap-space{
            margin-bottom:50px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:Chart ID="ChartRank" runat="server" DataSourceID="SqlDataSource1" CssClass="chart1" Height="400px" Palette="Berry" Width="680px" BackColor="Info" BorderlineColor="WindowText" BorderlineWidth="2">
    <Series>
        <asp:Series ChartType="SplineArea" Name="Series1" XValueMember="DateTime" BackSecondaryColor="Transparent" IsValueShownAsLabel="True" YValueMembers="Rank" YValuesPerPoint="10">
            <EmptyPointStyle BackImageWrapMode="TileFlipX" />
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1" BackColor="Transparent" BackSecondaryColor="Transparent" ShadowColor="Black" ShadowOffset="2" >
            <AxisY TextOrientation="Auto" Title="Rank" TitleAlignment="Far" TitleFont="Myanmar Text, 12pt" TitleForeColor="DodgerBlue">
            </AxisY>
            <AxisX TextOrientation="Auto" LineDashStyle="NotSet" Title="Time" TitleAlignment="Far" TitleFont="Myanmar Text, 12pt" TitleForeColor="DodgerBlue">
            </AxisX>
        </asp:ChartArea>
    </ChartAreas>
        <Titles>
            <asp:Title Font="MS Reference Sans Serif, 20pt" ForeColor="Crimson" Name="Statistics" Text="Statistic of rank so far" TextStyle="Frame">
            </asp:Title>
        </Titles>
</asp:Chart>



    <asp:Chart ID="ChartObtain" runat="server" DataSourceID="SqlDataSource1" CssClass="chart1" Height="400px" Palette="Fire" Width="660px" BackColor="Info" BorderlineWidth="2">
    <Series>
        <asp:Series ChartType="SplineArea" Name="Series1" XValueMember="DateTime" BackSecondaryColor="Transparent" IsValueShownAsLabel="True" YValueMembers="ObtainedMarks" YValuesPerPoint="10">
            <EmptyPointStyle BackImageWrapMode="TileFlipX" />
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1" BackColor="Transparent" BackSecondaryColor="Transparent" ShadowColor="Black" ShadowOffset="2">
            <AxisY TextOrientation="Auto" Title="Final Marks" TitleAlignment="Far" TitleFont="Myanmar Text, 12pt" TitleForeColor="DodgerBlue">
            </AxisY>
            <AxisX TextOrientation="Auto" LineDashStyle="NotSet" Title="Time" TitleAlignment="Far" TitleFont="Myanmar Text, 12pt" TitleForeColor="DodgerBlue">
            </AxisX>
        </asp:ChartArea>
    </ChartAreas>
        <Titles>
            <asp:Title Font="MS Reference Sans Serif, 20pt" ForeColor="Crimson" Name="Statistics" Text="Score stats obtained" TextStyle="Frame">
            </asp:Title>
        </Titles>
</asp:Chart>

                                  <hr class="center-block" style="width:1000px"/>

    <asp:Chart ID="ChartSuccess" runat="server" DataSourceID="SqlDataSource1" Height="400px" Palette="SeaGreen" Width="680px" CssClass="chart1" BackColor="Info" BorderlineWidth="2">
    <Series>
        <asp:Series ChartType="SplineArea" Name="Series1" XValueMember="DateTime" BackSecondaryColor="Transparent" IsValueShownAsLabel="True" YValueMembers="SuccessedMarks" YValuesPerPoint="10">
            <EmptyPointStyle BackImageWrapMode="TileFlipX" />
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1" BackColor="Transparent" BackSecondaryColor="Transparent" ShadowColor="Black" ShadowOffset="2">
            <AxisY Title="Sucess Marks" TitleAlignment="Far" TitleFont="Myanmar Text, 12pt" TitleForeColor="Green">
            </AxisY>
            <AxisX LineColor="" LineDashStyle="NotSet" Title="Time" TitleAlignment="Far" TitleFont="Myanmar Text, 12pt" TitleForeColor="Green">
            </AxisX>
        </asp:ChartArea>
    </ChartAreas>
        <Titles>
            <asp:Title Font="MS Reference Sans Serif, 20pt" ForeColor="Crimson" Name="Statistics" Text="Statistics of the rate success marks so far" TextStyle="Frame">
            </asp:Title>
        </Titles>
</asp:Chart>



    <asp:Chart ID="ChartWrong" runat="server" DataSourceID="SqlDataSource1" CssClass="chart1" BorderlineColor="" Height="400px" Palette="SemiTransparent" Width="660px" BackColor="Info" BorderlineWidth="2">
    <Series>
        <asp:Series ChartType="Area" Name="Series1" XValueMember="DateTime" BackSecondaryColor="Transparent" IsValueShownAsLabel="True" YValueMembers="WrongedMarks" YValuesPerPoint="10">
            <EmptyPointStyle BackImageWrapMode="TileFlipX" />
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1" BackColor="Transparent" BackSecondaryColor="Transparent" ShadowColor="Black" ShadowOffset="2" Area3DStyle-LightStyle="Simplistic">
            <AxisY Title="Wrong Marks" TitleAlignment="Far" TitleFont="Myanmar Text, 12pt" TitleForeColor="Red">
            </AxisY>
            <AxisX LineDashStyle="NotSet" Title="Time" TitleAlignment="Far" TitleFont="Myanmar Text, 12pt" TitleForeColor="Red">
            </AxisX>
        </asp:ChartArea>
    </ChartAreas>
        <Titles>
            <asp:Title Font="MS Reference Sans Serif, 20pt" ForeColor="Crimson" Name="Statistics" Text="Statistics of the rate wrong marks so far" TextStyle="Frame">
            </asp:Title>
        </Titles>
</asp:Chart>

                                      <hr class="center-block" style="width:1000px"/>


        <asp:DataList ID="DataList1" runat="server" CellPadding="0" CellSpacing="2" DataSourceID="SqlDataSource1" style="text-align-last:center;border-radius:30px;margin:60px 0px;padding:20px;display: table;" CssClass="center-block" Caption="My Rate in last Exams" CaptionAlign="Top" Font-Size="Large" RepeatColumns="4" Width="100%" HorizontalAlign="Center" ForeColor="Black" Font-Names="Arial">
            <FooterStyle  />
            <HeaderStyle  />
            <ItemStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <table style="border-style: solid; border-width: 11px;border-left: none;border-bottom: none;">
                    <thead>
                        <tr>
                            <th class="text-center" style="background-color: purple; border-radius: 2px;padding: 3px;">
                           <il class="glyphicon glyphicon-book" style="color:#12dcdc"></il>&nbsp;
                                    <asp:Label ID="LabelSubject" runat="server"  Font-Names="Bauhaus 93" Font-Size="Large"><%#Eval("SubjectName")%></asp:Label>
                            </th>
                        </tr>
                    </thead>
                    <br />
                    <tbody>
                        <tr>
                            <td class="text-center btn btn-warning" style="display: table-cell">
                                            <il class="glyphicon glyphicon-star"></il> &nbsp; Rank (
                                <asp:Label ID="LabelRank" runat="server" Font-Names="Bauhaus 93" Font-Size="Large" ForeColor="Yellow" ToolTip='<%#Eval("Rank")%>'><%#Eval("Rank")%></asp:Label>
                            )</td>
                        </tr>
                        <tr>
                            <td class="text-center btn btn-secondary" style="display: table-cell">
                                 <il class="glyphicon glyphicon-stats"></il> &nbsp; Mark (
                                <asp:Label ID="LabelObtain" runat="server" Font-Names="Bauhaus 93" Font-Size="Large" ForeColor="Black" ToolTip='<%#Eval("ObtainedMarks")%>'><%#Eval("ObtainedMarks")%></asp:Label>
                              / <asp:Label ID="LabelMarks" runat="server" Font-Names="Bauhaus 93" Font-Size="Large" ToolTip='<%#Eval("TotalMarks")%>'><%#Eval("TotalMarks")%></asp:Label>
                                )</td>
                        </tr>
                        <tr><td class="text-center btn btn-success" style="display: table-cell">
                                                       <il class="glyphicon glyphicon-ok" ></il> Sucessed Marks ( 
                            <asp:Label ID="LabelSccess" runat="server" Font-Names="Bauhaus 93" Font-Size="Large" ToolTip='<%#Eval("SuccessedMarks")%>'><%#Eval("SuccessedMarks")%></asp:Label>
                        )</td>
                            </tr>
                        <tr>
                            <td class="text-center btn btn-danger" style="display: table-cell">
                               <il class="glyphicon glyphicon-remove"></il> Wrong Marks (
                            <asp:Label ID="LabelWrong" runat="server" Font-Names="Bauhaus 93" Font-Size="Large" ToolTip='<%#Eval("WrongedMarks")%>'><%#Eval("WrongedMarks")%></asp:Label>
                        )</td>

                        </tr>
                        <tr>
                            <td class="text-center btn btn-secondary" style="display: table-cell">No. Questions (
                            <asp:Label ID="LabelQestionNo" runat="server" Font-Names="Bauhaus 93" Font-Size="Large" ToolTip='<%# Eval("TotalQuestions") %>'><%#Eval("TotalQuestions")%></asp:Label>
                       )</td>

                        </tr>
                    </tbody>
                </table>
            </ItemTemplate>
        </asp:DataList>




<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnecting2 %>" SelectCommand="SELECT Tbl_Subject.SubjectName, Tbl_Certification.* , RANK() over(order by ObtainedMarks DESC) As Rank FROM   Tbl_Subject INNER JOIN Tbl_Certification ON Tbl_Subject.SubjectID = Tbl_Certification.SubjectID WHERE ([UserName] = @UserName)">
    <SelectParameters>
        <asp:SessionParameter Name="UserName" SessionField="Name" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

