<%@ Page Title="Loading....." Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="Loading.aspx.cs" Inherits="Loading" %>
<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            display: block;
            text-align: center;
            padding-top: 20px;
        }
        .auto-style2 {
            margin-bottom: 210px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Panel ID="Panel1" runat="server" CssClass="PanelLoading">
        <asp:Timer ID="Timer1" runat="server" Interval="6000" OnTick="Timer1_Tick">
        </asp:Timer>
    <asp:Image ID="Image1" runat="server" CssClass="center-block" ImageUrl="~/ico/flat.gif" />
    <br />
    <br />
    <br />
    <div class="auto-style1">
        <asp:Label ID="Label1" runat="server" Font-Names="Bauhaus 93" Font-Overline="True" Font-Size="X-Large" Font-Underline="True" style="left: 0px; top: 0px; width: 500px" Text="Please wait for getting acceptance from admin and go to Log-in page....." Width="500px"></asp:Label>
    </div>
        </asp:Panel>
    <div class="auto-style2"></div>
</asp:Content>

