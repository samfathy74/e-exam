<%@ Page Title="Professor Register" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="ProfRegistration.aspx.cs" Inherits="ProfRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title></title>
     <link href="Style/CSSstyle.css" rel="stylesheet" />
    <style type="text/css">

        .auto-style1 {
            margin-top:-10px;   
            margin-bottom:-40px;             
            width: 1007px;
            }
        .auto-style30 {
            height: 70px;
            width: 275px;
            text-align: center;
        }

        .auto-style37 {
            height: 51px;
            width: 275px;
        }

        .auto-style49 {
            height: 70px;
            width: 184px;
            text-align: left;
        }

        .auto-style50 {

            height: 70px;
            text-align: left;
        }
        .auto-style65 {
          
            height: 50px;
        }

        .auto-style72 {
            height: 50px;

        }

        .auto-style76 {
            height: 50px;
            text-align: left;
            width: 275px;
        }
        
        .auto-style105 {
            height: 50px;
            text-align: center;
            width: 275px;
        }
        
        .auto-style106 {
        height: 50px;
        margin-left: 80px;
    }
        
        .auto-style107 {
            height: 50px;
            width: 275px;
        }

        .auto-style109 {
            height: 50px;
            width: 184px;
            text-align: left;
        }
        .auto-style111 {
            height: 41px;
            text-align: left;
        }
                .auto-style114 {
            height: 39px;
            text-align: left;
        }
        .auto-style115 {
            height: 39px;
            width: 184px;
            text-align: left;
        }
        .auto-style116 {
            height: 39px;
            text-align: center;
            width: 275px;
        }
                .auto-style117 {
            height: 45px;
            width: 184px;
            text-align: left;
        }
        .auto-style118 {
            height: 45px;
            width: 275px;
            text-align: center;
        }
        .auto-style119 {
            height: 45px;
            text-align: left;
        }
                </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
          <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Always">
            <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnsignup" GroupingText="Hello Professor , Now you can register to join us in the e-exam" HorizontalAlign="Left" CssClass="PanelReg" Font-Bold="True" Font-Names="Bradley Hand ITC" Height="100%" Width="100%" >
            <table class="auto-style1">
                
                <tr>
                    <td class="auto-style109">
                        <asp:Label ID="lblFname" runat="server" Font-Bold="False" Font-Names="Century Gothic" Font-Size="20px" ForeColor="#996600" Text="First Name :"></asp:Label>
                    </td>
                    <td class="auto-style107">
                        <div class="wrap-input100">
                            <asp:TextBox ID="txtFname" runat="server" BorderColor="Red" Font-Bold="False" Font-Names="Bauhaus 93" Font-Size="Large" Height="40px" placeholder="enter first name" Style="border-radius: 0px 10px;" ToolTip="enter your First Name" ValidationGroup="signup1" Width="350px" CssClass="input100" BorderStyle="Solid" BorderWidth="2px" MaxLength="15" TabIndex="1" />
                            <span class="focus-input100"></span>
                            <span class="symbol-input100"><i class="glyphicon glyphicon-pencil"></i></span>
                        </div>
                    </td>
                    <td class="auto-style65">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtFname" CssClass="alert-danger" Display="Dynamic" ErrorMessage="First Name Required." Font-Bold="False" Font-Italic="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" Style="text-align: center" ToolTip="First Name Required." ValidationGroup="signup1"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtFname" CssClass="alert-danger" Display="Dynamic" EnableTheming="True" ErrorMessage="enter correct name!" Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" ValidationExpression="[a-zA-Z\u0621-\u064A\s\-_]{2,}" ValidationGroup="signup1"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style109">
                        <asp:Label ID="lblLname" runat="server" Font-Bold="False" Font-Names="Century Gothic" Font-Size="20px" ForeColor="#996600" Text="Last Name :"></asp:Label>
                    </td>
                    <td class="auto-style107">
                        <div class="wrap-input100">
                            <asp:TextBox ID="txtLname" runat="server" BorderColor="Red" Font-Bold="False" Font-Names="Bauhaus 93" Font-Size="Large" Height="40px" placeholder="enter last name" Style="border-radius: 0px 10px;" ToolTip="enter your Last name" ValidationGroup="signup1" Width="350px" TabIndex="2" CssClass="input100" BorderStyle="Solid" BorderWidth="2px" MaxLength="15" />
                            <span class="focus-input100"></span>
                            <span class="symbol-input100"><i class="glyphicon glyphicon-pencil"></i></span>
                        </div>
                    </td>
                    <td class="auto-style65">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtLname" CssClass="alert-danger" Display="Dynamic" ErrorMessage="LastName Required." Font-Bold="False" Font-Italic="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" Style="text-align: center" ToolTip="LastName Required." ValidationGroup="signup1" Width="173px"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtLname" CssClass="alert-danger" Display="Dynamic" EnableTheming="True" ErrorMessage="enter correct name!" Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" ValidationExpression="[a-zA-Z\u0621-\u064A\s\-_]{2,}" ValidationGroup="signup1"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style109">
                        <asp:Label ID="lblname" runat="server" Font-Bold="False" Font-Names="Century Gothic" Font-Size="20px" ForeColor="#996600" Text="UserName :"></asp:Label>
                        &nbsp;</td>

                    <td class="auto-style107">
                        <div class="wrap-input100">
                            <asp:TextBox ID="txtname" runat="server" AutoPostBack="True" BorderColor="Red" Font-Bold="False" Font-Names="Bauhaus 93" Font-Size="Large" Height="40px" placeholder="enter unique username" Style="border-radius: 0px 10px;" ToolTip="enter your username" ValidationGroup="signup1" Width="350px" TabIndex="3" CssClass="input100" BorderStyle="Solid" BorderWidth="2px" />
                            <span class="focus-input100"></span>
                            <span class="symbol-input100"><i class="glyphicon glyphicon-user"></i></span>
                        </div>
                    </td>
                    <td class="auto-style65">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Username Required." Font-Bold="False" Font-Italic="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" Style="text-align: center" ToolTip="UserName Required." ValidationGroup="signup1" Width="173px"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtname" CssClass="alert-danger" Display="Dynamic" EnableTheming="True" ErrorMessage="Username have a length of at least of 4 digits" Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" ValidationExpression="[a-zA-Z0-9|_|.]{4,}$" ValidationGroup="signup1"></asp:RegularExpressionValidator>
                       
                    </td>
                </tr>
                <tr>
                    <td class="auto-style109">
                        <asp:Label ID="lblemail" runat="server" Text="E-mail :" Font-Names="Century Gothic" Font-Size="20px" ForeColor="#996600" Font-Bold="False" Style="text-align: right"></asp:Label>
                    </td>
                    <td class="auto-style107">
                        <div class="wrap-input100">

                            <asp:TextBox Style="border-radius: 0px 10px;" ID="txtemail" runat="server" Height="40px" Width="350px" Font-Bold="False" Font-Names="Bauhaus 93" TextMode="Email" ValidationGroup="signup1" Font-Size="Large" CssClass="input100" placeholder="enter unique and valid e-mail" ToolTip="enter unique e-mail" AutoPostBack="True" TabIndex="3" BorderColor="Red" BorderStyle="Solid" BorderWidth="2px"></asp:TextBox>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100"><i class="glyphicon glyphicon-envelope"></i></span>
                        </div>
                    </td>
                    <td class="auto-style65">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" Display="Dynamic" EnableTheming="True" ErrorMessage="Please enter a valid email address" Font-Bold="False" Font-Italic="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" ToolTip="Please enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="signup1" CssClass="alert-danger"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail" CssClass="alert-danger" ErrorMessage="Please enter a valid email address" Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="signup1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style111" colspan="3">
                        <asp:Label ID="lblPasswordHint" runat="server" CssClass="mark" Font-Bold="False" Font-Names="Consolas" ForeColor="#CC3300" Style="text-align: right" Text="Hint : Password must contain at least 1 uppercase,1 lowercase,1 digit,1 special character and have a length of at least of 10"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style109">
                        <asp:Label ID="lblpassword" runat="server" Text="Password :" Font-Names="Century Gothic" Font-Size="20px" ForeColor="#996600" Font-Bold="False"></asp:Label>
                    </td>
                    <td class="auto-style107">
                        <div class="wrap-input100">

                            <asp:TextBox Style="border-radius: 0px 10px;" ID="txtpassword" runat="server" Height="40px" Width="350px" Font-Bold="False" Font-Names="Bauhaus 93" TextMode="Password" ValidationGroup="signup1" Font-Size="Large" placeholder="enter strong password" ToolTip="enter unique password" TabIndex="5" CssClass="input100" BorderColor="Red" BorderStyle="Solid" BorderWidth="2px"></asp:TextBox>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100"><i class="glyphicon glyphicon-lock"></i></span>
                        </div>
                    </td>
                    <td class="auto-style106">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtpassword" ErrorMessage="input strong password" Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="signup1" Display="Dynamic" CssClass="alert-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtpassword" EnableTheming="True" ErrorMessage="input strong password" Font-Bold="False" Font-Names="Consolas" ForeColor="Brown" SetFocusOnError="True" ValidationExpression="^(?=.{10,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$" ValidationGroup="signup1" Display="Dynamic" Font-Size="Medium" CssClass="alert-danger"></asp:RegularExpressionValidator>
                    </td>
                </tr>
               
                <tr>
                    <td class="auto-style109">
                        <asp:Label ID="lblcpassword" runat="server" Text="confirm password :" Font-Names="Century Gothic" Font-Size="20px" ForeColor="#996600" Font-Bold="False" Style="text-align: right"></asp:Label>
                    </td>
                    <td class="auto-style37">
                        <div class="wrap-input100">

                            <asp:TextBox Style="border-radius: 0px 10px;" ID="txtcpassword" runat="server" Height="40px" Width="350px" Font-Bold="False" Font-Names="Bauhaus 93" TextMode="Password" ValidationGroup="signup1" Font-Size="Large" placeholder="re-enter password" ToolTip="enter confirm password" TabIndex="6" CssClass="input100" BorderColor="Red" BorderStyle="Solid" BorderWidth="2"></asp:TextBox>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100"><i class="glyphicon glyphicon-lock"></i></span>
                        </div>
                    </td>
                    <td class="auto-style72">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtcpassword" ErrorMessage="Password not match." Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="signup1" Display="Dynamic" CssClass="alert-danger"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtcpassword" CultureInvariantValues="True" ErrorMessage="Password not match." Font-Bold="False" Font-Italic="False" Font-Names="Consolas" ForeColor="Brown" SetFocusOnError="True" ToolTip="Password not match." ValidationGroup="signup1" Display="Dynamic" Font-Size="Medium" CssClass="alert-danger"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style109">
                        <asp:Label ID="lblPhone" runat="server" Font-Bold="False" Font-Names="Century Gothic" Font-Size="20px" ForeColor="#996600" Style="text-align: right" Text="Phone number :"></asp:Label>
                    </td>
                    <td class="auto-style76">
                        <div class="wrap-input100">

                            <asp:TextBox ID="txtPhone" runat="server" Font-Bold="False" Font-Names="Bauhaus 93" Font-Size="Large" Height="40px" placeholder="enter Phone number" Style="border-radius: 0px 10px;" TabIndex="7" TextMode="Phone" ToolTip="enter phone number" ValidationGroup="signup1" Width="350px" MaxLength="11" CssClass="input100" BorderColor="Red" BorderStyle="Solid" BorderWidth="2px" />
                            <span class="focus-input100"></span>
                            <span class="symbol-input100"><i class="glyphicon glyphicon-phone"></i></span>
                        </div>
                    </td>
                    <td class="auto-style72">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPhone" CssClass="alert-danger" Display="Dynamic" EnableTheming="True" ErrorMessage="Phone must contain: 11 Numbers." Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" ValidationExpression="^([0-9]{11})$" ValidationGroup="signup1"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Phone number is required" Font-Bold="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" ValidationGroup="signup1" CssClass="alert-danger"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style109">
                        <asp:Label ID="lblFaculty" runat="server" Font-Bold="False" Font-Names="Century Gothic" Font-Size="18px" ForeColor="#996600" Style="text-align: right" Text="National ID :"></asp:Label>
                    </td>
                    <td class="auto-style105">
                        <div class="wrap-input100">
                            <asp:TextBox ID="txtNationalID" runat="server" BorderColor="Red" BorderStyle="Solid" BorderWidth="2px" CssClass="input100" Font-Names="Bauhaus 93" Font-Size="Large" Height="40px" Width="353px" ToolTip="enter your national id" placeholder="enter national ID" Style="border-radius: 0px 10px;" ValidationGroup="signup1" TabIndex="8" MaxLength="20" Font-Bold="False"></asp:TextBox>
                            <span class="focus-input100"></span>
                            <span class="symbol-input100"><i class="glyphicon glyphicon-credit-card"></i></span>
                        </div>
                    </td>
                    <td class="auto-style100">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtNationalID" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Required." Font-Bold="False" Font-Italic="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" Style="text-align: center" ValidationGroup="signup1"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                     <td class="auto-style109">
                         <asp:Label ID="lblDepartment" runat="server" Font-Bold="False" Font-Names="Century Gothic" Font-Size="19px" ForeColor="#996600" Style="text-align: right" Text="Educational Level :"></asp:Label>
                     </td>
                     <td class="auto-style105">
                               <div class="wrap-input100">
                         <asp:DropDownList ID="ddlEduLevel" runat="server" Height="40px" Width="350px" Font-Bold="True" Font-Names="Corbel" Font-Size="Large" ValidationGroup="signup1" TabIndex="9" AutoPostBack="True" CssClass="DropDown" OnSelectedIndexChanged="ddlEduLevel_SelectedIndexChanged">
                         </asp:DropDownList>
                                    <span class="symbol-input100"><i class="glyphicon glyphicon-education"></i></span>
                                </div>
                     </td>
                     <td class="auto-style100">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlEduLevel" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Required." Font-Bold="False" Font-Italic="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" Style="text-align: center" ValidationGroup="signup1" InitialValue="0"></asp:RequiredFieldValidator>
                     </td>
                 </tr>
                <tr>
                     <td class="auto-style109">
                         <asp:Label ID="lblMaterial" runat="server" Font-Bold="False" Font-Names="Century Gothic" Font-Size="20px" ForeColor="#996600" Style="text-align: right" Text="Select Subject :"></asp:Label>
                     </td>
                     <td class="auto-style105">
                         <div class="wrap-input100">
                         <asp:DropDownList ID="ddlMaterial" runat="server" Height="40px" Width="350px" Font-Bold="True" Font-Names="Corbel" Font-Size="Large" ValidationGroup="signup1" TabIndex="10" CssClass="DropDown" Enabled="False">
                         </asp:DropDownList>
                         <span class="symbol-input100"><i class="glyphicon glyphicon-book"></i></span>
                                </div>
                     </td>
                     <td class="auto-style100">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlMaterial" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Required." Font-Bold="False" Font-Italic="False" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" Style="text-align: center" ValidationGroup="signup1" InitialValue="0"></asp:RequiredFieldValidator>
                     </td>
                 </tr>
                <tr>
                    <td class="auto-style115"></td>
                    <td class="auto-style116">
                        &nbsp;</td>
                    <td class="auto-style114">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style117"></td>
                    <td class="auto-style118">
                        <asp:Button ID="btnsignup" runat="server" CssClass="btn btn-danger btn-lg btn-radius" Font-Bold="True" Font-Names="Microsoft JhengHei UI Light" Font-Size="Medium" Height="50px" OnClick="btnsignup_Click" Style="border-radius: 10px; text-align: center;outline:none;" TabIndex="12" Text="Sign-Up" ValidationGroup="signup1" />
                    </td>
                    <td class="auto-style119">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style49">
                        &nbsp;</td>
                    <td class="auto-style30">&nbsp;</td>
                    <td class="auto-style50">
                        <asp:Label ID="LabelMsgChatsignup" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#3333CC" Text=" Already a member ?"></asp:Label>
                        <asp:HyperLink ID="HyperLink1login" runat="server" CssClass="alert-link " Font-Bold="True" Font-Size="Large" NavigateUrl="~/login.aspx" Style="text-align: right" TabIndex="13" ToolTip="go to login form">Log In</asp:HyperLink>
                    </td>
                </tr>
            </table> 
             <div class="WrapImgReg">
                 <asp:Image ID="ImgReg" runat="server" ImageUrl="~/ico/explain.png" />
             </div>
                
        </asp:Panel>
                </ContentTemplate>
              </asp:UpdatePanel>
    </div>

</asp:Content>

