<%@ Page Title="" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="StudentStatistic.aspx.cs" Inherits="StudentStatistic" %>
<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Chart ID="Chart1" runat="server" BackColor="Transparent" BackImageAlignment="Center" DataSourceID="SqlDataSource1" Palette="Berry">
        <series>
            <asp:Series ChartArea="ChartArea1" ChartType="Pie" Name="Series1">
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </chartareas>
        <Titles>
            <asp:Title Name="Rate">
            </asp:Title>
        </Titles>
    </asp:Chart>
</asp:Content>

