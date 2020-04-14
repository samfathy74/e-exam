<%@ Page Title="Materials" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="Subject.aspx.cs" Inherits="Subject" %>
<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            margin-left: 26px;
            margin-bottom: 17.5%;
        }

        .label-rules {
            padding: 15px;
            margin-left: 1080px;
            /* margin-top: 0px; */
            background-color: black;
            border-color: red;
            color: #ece8e1;
            border-style: solid;
            border-width: 5px;
            border-radius: 20px;
            position: absolute;
            font-variant: all-small-caps;
            font-size: medium;
            font-weight: bold;
            width: 250px;
        }

    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<ul class="label-rules">       
    <li style="text-align:center;color: #ffd800;margin-left: 40px;font-size: 20px;margin-bottom: 25px;" class="glyphicon glyphicon-warning-sign"> Attention!!</li>
   <li style="margin-bottom:15px;" class="glyphicon glyphicon-paperclip"> You shouldn't try to do Refresh while you are on the exam page because you'll lose your marks.</li>
   <li class="glyphicon glyphicon-paperclip"> Try to finish your answers before the time runs out because you lose marks.</li>
</ul>


      <asp:DataList ID="DataList1" runat="server" Height="200px" RepeatColumns="3" Width="90%" DataSourceID="SqlDataSource1" Caption="These are the exams currently available for you. Please choose a subject to enter the exam room." CellPadding="1" CellSpacing="1" OnItemCommand="DataList1_ItemCommand" CssClass="auto-style1" Font-Names="Eras Demi ITC" Font-Size="Large" ShowFooter="False">
        <FooterTemplate>
            <br />
            <br /> 
            <br /> 
            <asp:Image ID="Image1" runat="server" CssClass="center-block" Height="150px" ImageUrl="~/ico/notfound.png" Width="490px" />
        </FooterTemplate>
        <ItemTemplate>
            <asp:Button ID="btnSubject" runat="server" Text='<%#Eval("SubjectName") %>' CssClass="btn-info btn-sm" Style="border-radius:15px;padding: 11px;" Font-Names="Segoe UI" ForeColor="White" Height="50px" Font-Size="Medium" Width="200px" OnClientClick = "return confirm('Click (OK) to confirm to go entry the exam page.\nClick (Cancel) to cancel the entry.');" />
            <br /><hr style="border-color:#ff0000; width: 70px; margin-left: 65px; margin-top:0.4px;"/>
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnecting %>" SelectCommand="SELECT Tbl_Subject.SubjectName FROM Tbl_EduLevel INNER JOIN Tbl_Subject ON Tbl_EduLevel.EduLevelID = Tbl_Subject.EduLevelID CROSS JOIN Tbl_User WHERE (Tbl_User.Username = @Username) AND (Tbl_Subject.EduLevelID = @EduLevelID)">
        <SelectParameters>
            <asp:SessionParameter Name="EduLevelID" SessionField="EduLevelID" Type="Int32" />
            <asp:SessionParameter Name="Username" SessionField="Name" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

