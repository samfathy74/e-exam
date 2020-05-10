<%@ Page Title="Materials 📕" Language="C#" MasterPageFile="~/_MainLayout.master" AutoEventWireup="true" CodeFile="Subject.aspx.cs" Inherits="Subject" %>

<%@ MasterType VirtualPath="~/_MainLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script src="scripts/jquery.min.js"></script>
    <script data-require="jquery@*" data-semver="2.0.3" src="scripts/jQuery_v2.0.3.js"></script>
    <script data-require="bootstrap@3.1.1" data-semver="3.1.1" src="scripts/bootstrap.min.js"></script>
    <script src="scripts/bootbox.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $('.btnSubject').on('click', function (event) {
                var modal = bootbox.dialog({
                    message: $('.FormDiv').html(),
                    title: '<h3>Select what you want ?</h3>',
                    required: true,
                    buttons: [
                      {
                          label: 'OK',
                          className: 'save-btn btn btn-danger pull-center',
                          callback: function () {

                              var GetValue = ($.trim($("select").children("option:selected").text()));
                              $('#hiddenFieldQT').val(GetValue);
                              $(".But").click();
                          },
                      },

                       {
                           label: 'Cancel',
                           className: 'Cancel-btn btn btn-default pull-center',
                           callback: function () {
                               console.log('just do something on close');
                           },
                       },
                    ],

                    show: false,
                    onEscape: function () {
                        modal.modal('hide');
                    },
                });

                modal.modal('show');
                //==========================disabled and enabled button when droup-down empty===============[satrt]=============================//
                $(document).ready(function () {
                    jQuery('.form-group select').on('change', function () {
                        if (jQuery(this).val() == '') {
                            jQuery('.save-btn').attr('disabled', true);
                        } else {
                            jQuery('.save-btn').removeAttr('disabled');
                        }
                    });

                    if (!jQuery('.form-group select').val()) {
                        jQuery('.save-btn').attr('disabled', true);
                    } else {
                        jQuery('.save-btn').removeAttr('disabled');
                    }
                });
            });
        });
    </script>
    <%--//===========================================[end]============================//--%>


    <style type="text/css">
        .modal-content {
            background-color: #282b2b !important;
            color: white !important;
            text-align-last: center !important;
            box-shadow: 0 0 6px 1px #d6ea2a !important;
        }

        .form-control {
            background-color: #ffffff;
            width: 400px;
            border-radius: 40px;
            height: 40px;
            font-size: 18px;
            font-variant: all-petite-caps;
            cursor: pointer;
        }

        .save-btn, .Cancel-btn {
            width: 250px;
            height: 45px;
        }

        button.close {
            padding: 0;
            cursor: pointer;
            background: 0 0;
            border: 0;
            -webkit-appearance: none;
            background-color: white;
            color: red;
            border-radius: 50px;
            -webkit-text-stroke-width: thick;
        }

        .auto-style1 {
            margin-left: 26px;
            margin-bottom: 17.5%;
        }

        .label-rules {
            padding: 10px;
            color: #ece8e1;
            border-radius: 20px;
            font-variant: all-small-caps;
            font-size: larger;
            text-align: center;
            box-shadow: inset 0 0 10px 4px red;
        }

        .FormDiv {
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="FormDiv" role="form" style="display: none;">
        <div class="form-group">
            <ul class="label-rules">
                <li style="text-align: center; color: #ffd800; margin-left: 40px; font-size: 20px; margin-bottom: 25px;" class="glyphicon glyphicon-warning-sign">Attention!!</li>
                <li style="margin-bottom: 15px;" class="glyphicon glyphicon-paperclip">You shouldn't try to do Refresh while you are on the exam page because you'll lose your marks.</li>
                <li class="glyphicon glyphicon-paperclip">Try to finish your answers before the time runs out because you lose marks.</li>
            </ul>
            <br />
            <h4>▶ Select Exam Mode</h4>
            <h5>1.Click (Ok) to confirm to go entry the exam page.</h5>
            <h5>2.Click (Cancel) to cancel the entry.</h5>
            <select id="Exam" class="form-control center-block">
                <option value="" hidden="hidden"></option>
                <option value="1">Final</option>
                <option value="2">Quiz</option>
                <option value="3">Training</option>
            </select>

        </div>
    </div>

    <asp:datalist id="DataList1" runat="server" height="200px" repeatcolumns="3" width="80%" datasourceid="SqlDataSource1" caption="These are the exams currently available for you. Please choose a subject to enter the exam room." cellpadding="1" cellspacing="1" onitemcommand="DataList1_ItemCommand" cssclass="auto-style1" font-names="Eras Demi ITC" font-size="Large" showfooter="False">
        <FooterTemplate>
            <br />
            <br /> 
            <br /> 
            <asp:Image ID="Image1" runat="server" CssClass="center-block" Height="150px" ImageUrl="~/ico/notfound.png" Width="490px" />
        </FooterTemplate>
        <ItemTemplate>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSubject" EventName="Click" />
                </Triggers>

                <ContentTemplate>
                      <asp:Button ID="btnSubject" runat="server" Text='<%#Eval("SubjectName") %>' CssClass="btnSubject btn-info btn-sm" Style="border-radius: 15px; padding: 11px;" Font-Names="Segoe UI" ForeColor="White" Height="50px" Font-Size="Medium" Width="200px" />
                <br />
                <hr style="border-color: #ff0000; width: 70px; margin-left: 65px; margin-top: 0.4px;" />
                </ContentTemplate>
              
            </asp:UpdatePanel>
        </ItemTemplate>
    </asp:datalist>

    <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:DatabaseConnecting %>" selectcommand="SELECT Tbl_Subject.SubjectName FROM Tbl_EduLevel INNER JOIN Tbl_Subject ON Tbl_EduLevel.EduLevelID = Tbl_Subject.EduLevelID CROSS JOIN Tbl_User WHERE (Tbl_User.Username = @Username) AND (Tbl_Subject.EduLevelID = @EduLevelID)">
        <SelectParameters>
            <asp:SessionParameter Name="EduLevelID" SessionField="EduLevelID" Type="Int32" />
            <asp:SessionParameter Name="Username" SessionField="Name" Type="String" />
        </SelectParameters>
        
    </asp:sqldatasource>

    <asp:hiddenfield id="hiddenFieldQT" runat="server" clientidmode="Static" />
    <asp:button id="hiddenButton" runat="server" cssclass="But " style="display: none;" onclick="hiddenButton_Click" />
</asp:Content>

