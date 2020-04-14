<%@ Page Title="Loading..." Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="LoginLoading.aspx.cs" Inherits="LoginLoading" %>
<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .auto-style1 {
            display: block;
            text-align: center;
            padding-top: 10px;

        }
        .auto-style2 {
            margin-bottom: 210px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br />
    <asp:Panel ID="Panel1" runat="server" CssClass="PanelLoading">
        <asp:Timer ID="Timer1" runat="server" Interval="9000" OnTick="Timer1_Tick" Enabled="True">
        </asp:Timer>
    <asp:Image ID="Image1" runat="server" CssClass="center-block" ImageUrl="~/ico/flat.gif" />
    <br />
    <br />
    <br />
    <div class="auto-style1">
        <asp:Label ID="Label1" runat="server" Font-Names="Bauhaus 93" Font-Overline="True" Font-Size="20px" Font-Underline="True" style="left: 0px; top: 0px; width: 500px" Width="500px"></asp:Label>
    </div>
        </asp:Panel>
    <div class="auto-style2"></div>
</asp:Content>