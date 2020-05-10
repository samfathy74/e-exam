<%@ Page Title="Login" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <link href="~/Style/CSSstyle.css" rel="stylesheet" media="all" />
      <style type="text/css" media="all">
    
        .auto-style7 {
            height: 52px;
            text-align: center;
        }
    
        .auto-style9 {
        height: 60px;
    }
    
        .auto-style12 {
            height: 60px;
            width: 107px;
              text-align: center;
          }
            
        .auto-style16 {
            height: 60px;
            width: 251px;
        }
        .auto-style17 {
            height: 52px;
            width: 251px;
        }
            
          .auto-style20 {
              height: 25px;
              text-align: center;
          }
          .auto-style22 {
              text-align: center;
              margin-left: auto;
              margin-right: auto;
              padding-left: 15px;
              padding-right: 15px;
          }
          .auto-style23 {
              height: 52px;
              width: 107px;
          }
          .auto-style24 {
              width: 587px;
              height: 392px;
          }
    
          .auto-style25 {
              position: relative;
              width: 100%;
              z-index: 1;
              text-align: right;
          }
    
          .auto-style26 {
              height: 25px;
              width: 107px;
              text-align: right;
          }
          .auto-style29 {
              height: 24px;
              width: 107px;
          }
          .auto-style30 {
              height: 24px;
              text-align: right;
          }
          .auto-style31 {
              height: 24px;
              width: 251px;
          }
          .auto-style32 {
              height: 25px;
              text-align: right;
          }
          .auto-style33 {
              height: 25px;
              width: 251px;
          }
              
          .auto-style43 {
              height: 25px;
              width: 107px;
          }
    
          .auto-style44 {
              height: 24px;
              text-align: center;
          }
          .auto-style45 {
              height: 33px;
              text-align: center;
          }
    
          </style>

    <script type="text/javascript">
        window.history.forward();
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
       <div class="auto-style22">
        <asp:Panel ID="PanelClicklogin" runat="server" DefaultButton="BtnLogin" GroupingText="Welcome back now you can log-in to join us in the e-exam" HorizontalAlign="Left" CssClass="PanelLogin" Font-Bold="True" Font-Names="Bradley Hand ITC" Font-Size="Medium" >
            <table class="auto-style24">
                <tr>
                    <td class="auto-style23"></td>
                    <td class="auto-style7">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/ico/user1.png" />
                    </td>
                    <td class="auto-style17"></td>
                </tr>
                <tr>
                    <td class="auto-style43"></td>
                    <td class="auto-style20">
                        <asp:Label ID="Labellogin" runat="server" CssClass="alert-danger" Font-Bold="False" Font-Names="Consolas" ForeColor="Brown" Visible="False" Width="285px"></asp:Label>
                    </td>
                    <td class="auto-style33"></td>
                </tr>
                <tr>
                    <td class="auto-style12">
                        <asp:Label ID="lblnamelogin" runat="server" Font-Bold="False" Font-Names="Maiandra GD" Font-Size="Large" ForeColor="#996600" Text="UserName : or  E-mail :"></asp:Label>
                    </td>
                    <td class="auto-style9">
                     <div class="auto-style25">
                         <asp:TextBox ID="txtnamelogin" runat="server" BorderColor="#DC4C3F" BorderStyle="Solid" OnTextChanged="txtnamelogin_TextChanged" placeholder="Enter username or e-mail" ToolTip="Enter your Username or e-mail" ValidationGroup="login" Width="350px" CssClass="input100" BorderWidth="2px" TabIndex="1"></asp:TextBox>
                         <span class="focus-input100">
                         </span>
                    <span class="symbol-input100"><i class="glyphicon glyphicon-user"></i></span>
                     </div> 
                         </td>
                    <td class="auto-style16">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style26"></td>
                    <td class="auto-style32">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnamelogin" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Username is required!" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" ToolTip="Username is required!" ValidationGroup="login" Font-Bold="False"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style33"></td>
                </tr>
                <tr>
                    <td class="auto-style12">
                        <asp:Label ID="lblpasswordlogin" runat="server" Font-Bold="False" Font-Names="Maiandra GD" Font-Size="Large" ForeColor="#996600" Text="Password :"></asp:Label>
                    </td>
                    <td class="auto-style9">
                        <div class="auto-style25">
                            <asp:TextBox ID="txtpasswordlogin" runat="server" BorderColor="#DC4C3F" BorderStyle="Solid" placeholder="Enter your password" TabIndex="2" TextMode="Password" ToolTip="enter password" ValidationGroup="login" Width="350px" BorderWidth="2px" CssClass="input100"></asp:TextBox>

                            <span class="focus-input100"></span>
                    <span class="symbol-input100"><i class="glyphicon glyphicon-lock"></i></span>
                              </div>
                                                 </td>
                    <td class="auto-style16">
                        </td>
                </tr>
                <tr>
                    <td class="auto-style29">
                        &nbsp;</td>
                    <td class="auto-style30">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpasswordlogin" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Password is required!" Font-Names="Consolas" Font-Size="Medium" ForeColor="Brown" SetFocusOnError="True" ToolTip="Password is required!" ValidationGroup="login" Font-Bold="False"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style31">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style44">
                        <asp:Button ID="BtnLogin" runat="server" CssClass="btn btn-danger btn-radius" Font-Bold="True" Font-Names="Microsoft JhengHei UI Light" Font-Size="Medium" ForeColor="White" OnClick="BtnLogin_Click" Style="outline:none; align-content:center;" TabIndex="3" Text="Log In" ValidationGroup="login" Width="162px" />
                    </td>
                    <td class="auto-style31">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style45" colspan="3">
                       <br />
                         <asp:Label ID="LabelMsgChatsignup0" runat="server" Font-Bold="True" Font-Names="Candara Light" Font-Size="Large" ForeColor="#3333CC" Text="Don’t have an account?"></asp:Label>
                        <br />
                        <asp:Label ID="LabelMsgChatsignup1" runat="server" Font-Bold="True" Font-Names="Candara Light" Font-Size="Large" ForeColor="#3333CC" Text="if you are a student "></asp:Label>
                        <asp:HyperLink ID="HyperLink1Signup0" runat="server" CssClass="alert-info" Font-Bold="True" Font-Names="Candara Light" Font-Size="Medium" Font-Underline="True" NavigateUrl="~/Registration.aspx" Style="text-align: right; left: 0px; top: 0px;" TabIndex="4" ToolTip="Student"> Click here  </asp:HyperLink>
                        <asp:Label ID="LabelMsgChatsignup2" runat="server" Font-Bold="True" Font-Names="Candara Light" Font-Size="Large" ForeColor="#3333CC" Text="   or if you are a Professor  "></asp:Label>
                        <asp:HyperLink ID="HyperLink1Signup1" runat="server" CssClass="alert-info" Font-Bold="True" Font-Names="Candara Light" Font-Size="Medium" Font-Underline="True" NavigateUrl="~/ProfRegistration.aspx" Style="text-align: right; left: 0px; top: 0px;" TabIndex="5" ToolTip="Professor">Click here </asp:HyperLink>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
  </asp:Content>
