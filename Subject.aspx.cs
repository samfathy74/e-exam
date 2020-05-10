using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Subject : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["DatabaseConnecting"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Name"] != null && Session.Timeout != 0)
        {
            if (Session["UserType"].ToString() == "student")
            {
                Master.lblusername.Text = "Hi " + Session["Name"].ToString();
                Master.logout.Visible = true;
                Master.login.Visible = false;
                Master.signup.Visible = false;
                Master.imgprofile.Visible = true;
                Master.home.PostBackUrl = "StudentHome.aspx";

                CallEduID();

                if (DataList1.Items.Count <= 0)
                {
                    DataList1.Caption = "no exist exams now.";
                    DataList1.ShowFooter = true;

                }
                else
                {
                    DataList1.ShowFooter = false;
                }
            }
            else
            {
                Response.Redirect("ProfessorHome.aspx");
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
            Master.home.Enabled = true;

        }

    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Button SubjectName = (Button)e.Item.FindControl("btnSubject");
        Session["SubjectName"] = SubjectName.Text;

        if (e.CommandName == null)
        {
            Response.Redirect("Subject.aspx");
        }
        else
        {
            //Session["SecurityExam"] = "1"; //to prevent any enter unAuthenticate
            // Response.Redirect("Exam.aspx");
        }
    }

    private void CallEduID()
    {
        //Call Tbl_User
        SqlConnection con = new SqlConnection(conString);
        SqlCommand cmd = new SqlCommand("select * from Tbl_User where Username ='" + Session["Name"] + "'", con);
        con.Open();
        SqlDataReader read = cmd.ExecuteReader();
        read.Read();
        Session["EduLevelName"] = read["EduLevel"];
        con.Close();

        //call Tbl_Edu
        con.Open();
        SqlCommand cmd1 = new SqlCommand("select * from Tbl_EduLevel where EduLevelName ='" + Session["EduLevelName"] + "'", con);
        read = cmd1.ExecuteReader();
        read.Read();
        Session["EduLevelID"] = read["EduLevelID"];
        con.Close();
    }

    protected void hiddenButton_Click(object sender, EventArgs e)
    {
        Session["TypeofExam"] = hiddenFieldQT.Value;
        Session["SecurityExam"] = "1";

        Response.Redirect("Exam.aspx");
    }
}