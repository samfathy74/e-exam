<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="userProfile" %>
<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Profile</title>
    <link href="Style/CSSstyle.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 97%;
            height:45px;
        }
        .auto-style2 {
             width: 128px;
            text-align: center;
        }
        .auto-style3 {
            width: 116px;
            text-align: center;
        }
        .auto-style4 {
            width: 122px;
            }
        .auto-style6 {
            width: 748px;
            height: 300px;
        }
        .auto-style8 {
            width: 100%;
            height: 368px;
        }
        .auto-style9 {
            width: 923px;
            height: 272px;
        }
                
        .auto-style20 {
            margin-bottom: 0px;
        }
        
        .auto-style25 {
            width: 130px;
            height: 30px;
            text-align: left;
        }
        .auto-style32 {
            width: 159px;
            text-align: center;
        }
        .auto-style42 {
        width: 399px;
    }
        
        .auto-style48 {
            width: 130px;
            height: 35px;
            text-align: left;
        }
        .auto-style51 {
            text-align: center;
            height: 30px;
            width: 291px;
        }
        .auto-style56 {
            width: 337px;
            height: 30px;
            text-align: left;
        }
        .auto-style58 {
            width: 271px;
            height: 35px;
            text-align: left;
        }
        .auto-style60 {
            width: 149px;
            text-align: left;
            height: 30px;
        }
        .auto-style62 {
            width: 124px;
            height: 30px;
            text-align: center;
        }
        .auto-style76 {
            width: 146px;
            height: 35px;
            text-align: left;
        }
        .auto-style77 {
            width: 146px;
            height: 30px;
            text-align: left;
        }
        .auto-style80 {
            text-align: left;
            height: 23px;
            width: 291px;
        }
        .auto-style81 {
            width: 124px;
            height: 23px;
        }
        .auto-style82 {
            width: 337px;
            height: 23px;
        }
        .auto-style83 {
            width: 149px;
            text-align: left;
            height: 23px;
        }
        .auto-style84 {
            width: 146px;
            height: 23px;
            text-align: left;
        }
        .auto-style85 {
            width: 271px;
            height: 23px;
            text-align: left;
        }
        .auto-style86 {
            width: 130px;
            height: 23px;
            text-align: left;
        }
        .auto-style89 {
            width: 124px;
        }
        
        .auto-style104 {
            width: 149px;
        }
        .auto-style108 {
            width: 329px;
        }
        .auto-style121 {
            width: 337px;
            height: 35px;
        }
        .auto-style122 {
            width: 124px;
            height: 35px;
        }
        .auto-style123 {
            text-align: left;
            height: 35px;
            width: 291px;
        }
        .auto-style124 {
            width: 139px;
            height: 69px;
        }
        .auto-style125 {
            height: 69px;
            width: 399px;
        }
        .auto-style126 {
            width: 159px;
            height: 69px;
            text-align: center;
        }
        .auto-style127 {
            height: 69px;
            width: 329px;
        }
        .auto-style128 {
            height: 69px;
            width: 170px;
        }
        .auto-style131 {
            width: 139px;
        }
        .auto-style132 {
            width: 149px;
            text-align: left;
            height: 35px;
        }
        
        .auto-style133 {
            width: 149px;
            text-align: left;
        }
        .auto-style134 {
            text-align: left;
            margin-left: 80px;
        }
        .auto-style135 {
            text-align: left;
            width: 168px;
            margin-left: 80px;
        }
        .auto-style136 {
            width: 168px;
        }
        .auto-style137 {
            width: 139px;
            height: 68px;
        }
        .auto-style138 {
            height: 68px;
            width: 399px;
        }
        .auto-style139 {
            width: 159px;
            height: 68px;
            text-align: center;
        }
        .auto-style140 {
            height: 68px;
            width: 329px;
        }
        .auto-style141 {
            height: 68px;
            width: 170px;
        }
        .auto-style142 {
            width: 139px;
            height: 70px;
        }
        .auto-style143 {
            height: 70px;
            width: 399px;
        }
        .auto-style144 {
            width: 159px;
            height: 70px;
            text-align: center;
        }
        .auto-style145 {
            height: 70px;
            width: 329px;
        }
        .auto-style146 {
            height: 70px;
            width: 170px;
        }
        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:Panel ID="PanelButtons" runat="server" ForeColor="White" Height="40px" Width="100%" Font-Names="Bahnschrift" Font-Size="Medium" CssClass="auto-style20">
        <table class="auto-style1">
            <tr>
                <td >
                    <asp:ImageButton ID="ImgBtnBack" runat="server" Style="padding-left: 20px;margin-top: -20px;" AlternateText="Back" ImageUrl="~/ico/back.ico" OnClick="ImgBtnBack_Click" ToolTip="Back" />
                </td>
                <td class="auto-style4">
                    <asp:Button ID="profilebtn" runat="server" Text="Main Profile" OnClick="profilebtn_Click" CssClass="btn btn-info" Enabled="False" />
                </td>
                <td class="auto-style2">
                    <asp:Button ID="ButtonPersonalInfo" runat="server" Text="Edit My Data" OnClick="ButtonPersonalInfo_Click" CssClass="btn btn-info" />
                </td>
                <td class="auto-style3">
                    <asp:Button ID="ButtonPassword" runat="server" Text="Edit Password" OnClick="ButtonPassword_Click" CssClass="btn btn-info" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="MainProfPanal" runat="server" Height="359px" Width="100%" Font-Names="Bahnschrift" GroupingText="Account Info." CssClass="PanalMargin">
        <table class="auto-style6" align="center">
            <tr>
                <td class="auto-style133">

                    &nbsp;</td>
                <td class="auto-style135">
                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Names="Eras Medium ITC" Font-Size="20px" Text="Name : "></asp:Label>
                </td>
                <td class="auto-style134">
                    <asp:Label ID="lblFName" runat="server" Font-Bold="True" Font-Names="Eras Medium ITC" Font-Size="20px"></asp:Label>
                    &nbsp;<asp:Label ID="lblLName" runat="server" Font-Bold="True" Font-Names="Eras Medium ITC" Font-Size="20px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style104"></td>
                <td class="auto-style136">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Eras Medium ITC" Font-Size="20px" Text="User Name : "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblUserName" runat="server" Font-Bold="True" Font-Names="Eras Medium ITC" Font-Size="20px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style104">

                </td>
                <td class="auto-style136">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Eras Medium ITC" Font-Size="20px" Text="Email : "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Font-Bold="True" Font-Names="Eras Medium ITC" Font-Size="20px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style104">&nbsp;</td>
                <td class="auto-style136">
                    <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Names="Eras Medium ITC" Font-Size="20px" Text="Phone : "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblPhone" runat="server" Font-Bold="True" Font-Names="Eras Medium ITC" Font-Size="20px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style104">

                </td>
                <td class="auto-style136">
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Eras Medium ITC" Font-Size="20px" Text="User Type : "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblType" runat="server" Font-Bold="True" Font-Names="Eras Medium ITC" Font-Size="20px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style104">

                </td>
                <td class="auto-style136">
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Eras Medium ITC" Font-Size="20px" Text="Education Level : "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEduLevel" runat="server" Font-Bold="True" Font-Names="Eras Medium ITC" Font-Size="20px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style104">

                </td>
                <td class="auto-style136">
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Eras Medium ITC" Font-Size="20px" Text="Level : "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblLevel" runat="server" Font-Bold="True" Font-Names="Eras Medium ITC" Font-Size="20px"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="ChangeEmailPanal" runat="server" Height="359px" Visible="False" Width="100%" Font-Names="Bahnschrift" GroupingText="Edit Personal Info" CssClass="PanalMargin">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
            <ContentTemplate >
        <table class ="auto-style8" align="center">
            <tr>
                <td class="auto-style132"></td>
                <td class="auto-style76">
                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Text="First Name : "></asp:Label>
                </td>
                <td class="auto-style123">
                                            <div class="wrap-input100">
                    <asp:TextBox ID="txtFirstName" runat="server" Font-Names="Arial" Font-Size="Large" TabIndex="1" ValidationGroup="EmailGroup" Width="350px" ReadOnly="True" CssClass="input100"></asp:TextBox>
                    <span class="symbol-input100"><i class="glyphicon glyphicon-pencil"></i></span>
                                                </div>
                  </td>
                <td class="auto-style122">
                    <asp:ImageButton runat="server" Height="30px" Width="30px" ID="okbtnFName" ImageUrl="~/ico/ok.png" ToolTip="Accepted" Visible="False" OnClick="okbtnFName_Click" ValidationGroup="EmailGroup" ></asp:ImageButton>
                    <asp:ImageButton runat="server" Width="30px" Height="30px" ID="cancelbtnFName" ImageUrl="~/ico/cancel.png" ToolTip="Cancel" Visible="False" OnClick="cancelbtnFName_Click"></asp:ImageButton>
                    <asp:ImageButton runat="server" ID="editbtnFName" Height="30px" ImageUrl="~/ico/edit.png" ToolTip="Edit" Width="30px" OnClick="editbtnFName_Click"></asp:ImageButton>
                </td>
                <td class="auto-style121">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtFirstName" CssClass="alert-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="EmailGroup">Required</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtFirstName" CssClass="alert-danger" Display="Dynamic" EnableTheming="True" ErrorMessage="enter correct name!" Font-Bold="False" ForeColor="Brown" SetFocusOnError="True" ValidationExpression="[a-zA-Z\u0621-\u064A\s]{2,}" ValidationGroup="EmailGroup"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style58"></td>
                <td class="auto-style48"></td>
            </tr>
            <tr>
                <td class="auto-style83"></td>
                <td class="auto-style84">
                    <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Text="Lat Name : "></asp:Label>
                </td>
                <td class="auto-style80">
                                            <div class="wrap-input100">
                    <asp:TextBox ID="txtLastName" runat="server" Font-Names="Arial" Font-Size="Large" TabIndex="2" ValidationGroup="EmailGroup" Width="350px" ReadOnly="True" CssClass="input100"></asp:TextBox>
                    <span class="symbol-input100"><i class="glyphicon glyphicon-pencil"></i></span>
                                                </div>
                </td>
                <td class="auto-style81">

                    <asp:ImageButton ID="okbtnLName" runat="server" Height="30px" ImageUrl="~/ico/ok.png" ToolTip="Accepted" Visible="False" Width="30px" OnClick="okbtnLName_Click" ValidationGroup="EmailGroup" />
                    <asp:ImageButton ID="cancelbtnLName" runat="server" Height="30px" ImageUrl="~/ico/cancel.png" ToolTip="Cancel" Visible="False" Width="30px" OnClick="cancelbtnLName_Click" />
                    <asp:ImageButton ID="editbtnLName" runat="server" Height="30px" ImageUrl="~/ico/edit.png" ToolTip="Edit" Width="30px" OnClick="editbtnLName_Click" />

                </td>
                <td class="auto-style82">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtLastName" CssClass="alert-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="EmailGroup">Required</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtLastName" CssClass="alert-danger" Display="Dynamic" EnableTheming="True" ErrorMessage="enter correct name!" Font-Bold="False" ForeColor="Brown" SetFocusOnError="True" ValidationExpression="[a-zA-Z\u0621-\u064A\s]{2,}" ValidationGroup="EmailGroup"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style85"></td>
                <td class="auto-style86"></td>
            </tr>
            <tr>
                <td class="auto-style132"></td>
                <td class="auto-style76">
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Text="New Email :"></asp:Label>
                </td>
                <td class="auto-style123">
                                            <div class="wrap-input100">
                    <asp:TextBox ID="txtEmail" runat="server" Font-Names="Arial" Font-Size="Large" TabIndex="3" TextMode="Email" ValidationGroup="EmailGroup" Width="350px" ReadOnly="True" CssClass="input100"></asp:TextBox>
                    <span class="symbol-input100"><i class="glyphicon glyphicon-envelope"></i></span>
                                                </div>
                </td>
                <td class="auto-style122">

                    <asp:ImageButton ID="okbtnEmail" runat="server" Height="30px" ImageUrl="~/ico/ok.png" ToolTip="Accepted" Visible="False" Width="30px" OnClick="okbtnEmail_Click" ValidationGroup="EmailGroup" />
                    <asp:ImageButton ID="cancelbtnEmail" runat="server" Height="30px" ImageUrl="~/ico/cancel.png" ToolTip="Cancel" Visible="False" Width="30px" OnClick="cancelbtnEmail_Click" />
                    <asp:ImageButton ID="editbtnEmail" runat="server" Height="30px" ImageUrl="~/ico/edit.png" ToolTip="Edit" Width="30px" OnClick="editbtnEmail_Click" />

                </td>
                <td class="auto-style121">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" CssClass="alert-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="EmailGroup">Required</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" CssClass="alert-danger" Display="Dynamic" EnableTheming="True" ErrorMessage="Please enter a valid email address" Font-Bold="False" Font-Italic="False" ForeColor="Brown" SetFocusOnError="True" ToolTip="Please enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="EmailGroup"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style58"></td>
                <td class="auto-style48"></td>
            </tr>
            <tr>
                <td class="auto-style132">
                    </td>
                <td class="auto-style76">
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Text="Phone : "></asp:Label>
                </td>
                <td class="auto-style123">
                                            <div class="wrap-input100">
                    <asp:TextBox ID="txtPhone" runat="server" Font-Names="Arial" Font-Size="Large" MaxLength="11" TabIndex="4" TextMode="Phone" ValidationGroup="EmailGroup" Width="350px" ReadOnly="True" CssClass="input100"></asp:TextBox>
                 <span class="symbol-input100"><i class="glyphicon glyphicon-phone"></i></span>
                                                </div>
                </td>
                <td class="auto-style122">

                    <asp:ImageButton ID="okbtnPhone" runat="server" Height="30px" ImageUrl="~/ico/ok.png" ToolTip="Accepted" Visible="False" Width="30px" OnClick="okbtnPhone_Click" ValidationGroup="EmailGroup" />
                    <asp:ImageButton ID="cancelbtnPhone" runat="server" Height="30px" ImageUrl="~/ico/cancel.png" ToolTip="Cancel" Visible="False" Width="30px" OnClick="cancelbtnPhone_Click" />
                    <asp:ImageButton ID="editbtnPhone" runat="server" Height="30px" ImageUrl="~/ico/edit.png" ToolTip="Edit" Width="30px" OnClick="editbtnPhone_Click" />

                </td>
                <td class="auto-style121">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPhone" CssClass="alert-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="EmailGroup">Required</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPhone" CssClass="alert-danger" Display="Dynamic" EnableTheming="True" ErrorMessage="Phone must contain: 11 Numbers." Font-Bold="False" ForeColor="Brown" SetFocusOnError="True" ValidationExpression="^([0-9]{11})$" ValidationGroup="EmailGroup"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style58"></td>
                <td class="auto-style48"></td>
            </tr>
            <tr>
                <td class="auto-style132">
                    &nbsp;</td>
                <td class="auto-style76">
                    <asp:Label ID="LabelPasswordEmail" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Text="Password : "></asp:Label>
                </td>
                <td class="auto-style123">
                                            <div class="wrap-input100">
                    <asp:TextBox ID="txtPassword" runat="server" Font-Names="Arial" Font-Size="Large" TabIndex="5" TextMode="Password" ValidationGroup="EmailGroup" Width="350px" CssClass="input100"></asp:TextBox>
                 <span class="symbol-input100"><i class="glyphicon glyphicon-lock"></i></span>
                                                </div>
                 </td>
                <td class="auto-style89">
                    <asp:ImageButton runat="server" ID="ShowPassbtn" Height="30px" ImageUrl="~/ico/showpass.png" ToolTip="Show Password" Width="30px" OnClick="ShowPassbtn_Click"></asp:ImageButton>
                    <asp:ImageButton runat="server" ID="HidePassbtn" Height="30px" ImageUrl="~/ico/hide.png" ToolTip="Hide Password" Visible="False" Width="30px" OnClick="HidePassbtn_Click"></asp:ImageButton>
                    </td>
                <td class="auto-style121">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPassword" ForeColor="Brown" ValidationGroup="EmailGroup" CssClass="alert-danger" Display="Dynamic" SetFocusOnError="True">Required</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style58">&nbsp;</td>
                <td class="auto-style48">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style60">&nbsp;</td>
                <td class="auto-style77"></td>
                <td class="auto-style51">
                    <asp:Label ID="lblSuccessSave" runat="server" ForeColor ="White" CssClass="label-success" Font-Size="Large"></asp:Label>
                </td>
                <td class="auto-style62">
                    &nbsp;</td>
                <td class="auto-style56">&nbsp;</td>
                <td class="auto-style25">
                    &nbsp;</td>
            </tr>
        </table>
                </ContentTemplate>
            </asp:UpdatePanel>
    </asp:Panel>

     <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Always">
            <ContentTemplate>
    <asp:Panel ID="EditPasswordPanal" runat="server" Height="359px" Visible="False" Width="100%" DefaultButton="SavePassbtn" Font-Names="Bahnschrift" GroupingText="Edit Password" CssClass="PanalMargin">
        <table class="auto-style9" align="center">
            <tr>
                <td class="auto-style124"></td>
                <td class="auto-style125">
                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large" Text="Old Password : "></asp:Label>
                </td>
                <td class="auto-style126">
                                            <div class="wrap-input100">
                    <asp:TextBox ID="txtOldPass" runat="server" Font-Size="Large" TabIndex="1" TextMode="Password" ValidationGroup="PassGroup" CssClass="input100" Width="350px"></asp:TextBox>
                 <span class="symbol-input100"><i class="glyphicon glyphicon-lock"></i></span>
                                                </div>
                </td>
                <td class="auto-style127">
                    <asp:ImageButton runat="server" ID="ShowOldPassbtn" Height="30px" ImageUrl="~/ico/showpass.png" ToolTip="Show Password" Width="30px" OnClick="ShowOldPassbtn_Click" AlternateText="show"></asp:ImageButton>
                    <asp:ImageButton runat="server" ID="HideOldPassbtn" Height="30px" ImageUrl="~/ico/hide.png" ToolTip="Hide Password" Visible="False" Width="30px" OnClick="HideOldPassbtn_Click" AlternateText="hide"></asp:ImageButton>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtOldPass" CssClass="alert-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="PassGroup">Required</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style128">
                </td>
            </tr>
            <tr>
                <td class="auto-style137">

                </td>
                <td class="auto-style138">
                    <asp:Label ID="Label11" runat="server" Text="New Password : " Font-Bold="True" Font-Names="Arial" Font-Size="Large"></asp:Label>
                </td>
                <td class="auto-style139">
                                            <div class="wrap-input100">
                    <asp:TextBox ID="txtNewPass" runat="server" Font-Size="Large" ValidationGroup="PassGroup" TextMode="Password" TabIndex="2" CssClass="input100" Width="350px"></asp:TextBox>
                 <span class="symbol-input100"><i class="glyphicon glyphicon-lock"></i></span>
                                                </div>
                 </td>
                <td class="auto-style140">
                    <asp:ImageButton runat="server" ID="ShowNewPassbtn" Height="30px" ImageUrl="~/ico/showpass.png" ToolTip="Show Password" Width="30px" OnClick="ShowNewPassbtn_Click" AlternateText="show"></asp:ImageButton>
                    <asp:ImageButton runat="server" ID="HideNewPassbtn" Height="30px" ImageUrl="~/ico/hide.png" ToolTip="Hide Password" Visible="False" Width="30px" OnClick="HideNewPassbtn_Click" AlternateText="hide"></asp:ImageButton>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNewPass" CssClass="alert-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="PassGroup">Required</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style141">
                </td>
            </tr>
            <tr>
                <td class="auto-style142">

                </td>
                <td class="auto-style143">
                    <asp:Label ID="Label12" runat="server" Text="Confirm New Password : " Font-Bold="True" Font-Names="Arial" Font-Size="Large"></asp:Label>
                </td>
                <td class="auto-style144">
                                            <div class="wrap-input100">
                    <asp:TextBox ID="txtConfirmPass" runat="server" Font-Size="Large" ValidationGroup="PassGroup" TextMode="Password" TabIndex="3" CssClass="input100" Width="350px"></asp:TextBox>
                 <span class="symbol-input100"><i class="glyphicon glyphicon-lock"></i></span>
                                                </div>
                </td>
                <td class="auto-style145">
                    <asp:ImageButton runat="server" ID="ShowConfrimPassbtn" Height="30px" ImageUrl="~/ico/showpass.png" ToolTip="Show Password" Width="30px" OnClick="ShowConfrimPassbtn_Click" AlternateText="show"></asp:ImageButton>
                    <asp:ImageButton runat="server" ID="HideConfirmPassbtn" Height="30px" ImageUrl="~/ico/hide.png" ToolTip="Hide Password" Visible="False" Width="30px" OnClick="HideConfirmPassbtn_Click" AlternateText="hide"></asp:ImageButton>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtConfirmPass" CssClass="alert-danger" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="PassGroup">Required</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtConfirmPass" CssClass="alert-danger" Display="Dynamic" ErrorMessage="CompareValidator" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="PassGroup">Not Matching New Password</asp:CompareValidator>
                </td>
                <td class="auto-style146">
                </td>
            </tr>
            <tr>
                <td class="auto-style131">

                </td>
                <td class="auto-style42">

                </td>
                <td class="auto-style32">
                    <asp:Label ID="lblSuccessPass" runat="server" Font-Size="Large" ForeColor="White" CssClass="label-success"></asp:Label>
                </td>
                <td class="auto-style108">

                    <asp:Button ID="SavePassbtn" runat="server" CssClass="btn-danger disabled" Font-Size="Medium" OnClick="SavePassbtn_Click" Text="Save Changes" ValidationGroup="PassGroup" Width="164px" TabIndex="4" BorderColor="White" BorderStyle="Solid" BorderWidth="3px" Height="40px" />

                </td>
            </tr>
        </table>
    </asp:Panel>
                </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

