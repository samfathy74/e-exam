using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProfStatistic : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["DatabaseConnecting"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Name"] != null && Session.Timeout != 0)
        {
            if (Session["UserType"].ToString() == "professor" && Session["Status"].ToString() == "1")
            {
                Master.lblusername.Text = "Hi " + Session["Name"].ToString();
                Master.logout.Visible = true;
                Master.login.Visible = false;
                Master.signup.Visible = false;
                Master.imgprofile.Visible = true;
                Master.home.PostBackUrl = "ProfessorHome.aspx";

                 LoadGridView();
                GetCountofQuestions();
            }

            else
            {
                Response.Redirect("StudentHome.aspx");
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
            Master.home.Enabled = true;

        }
    }


    private void LoadGridView()
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        string q = "select * from Tbl_User where Username='" + Session["Name"] + "'";
        SqlCommand cmd = new SqlCommand(q, con);
        SqlDataReader read = cmd.ExecuteReader();
        while (read.Read())
        {
            Session["EducationLevel"] = read["EduLevel"].ToString();
        }
           con.Close();

        BoundField NewColumn = new BoundField();
        NewColumn.DataField ="UserName";
        NewColumn.HeaderText = "Students who took my exam";
        GridView1.Columns.Add(NewColumn);

    }

    private void GetCountofQuestions()
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        string Query = "SELECT COUNT(*) AS 'Count' FROM Tbl_Ques_Ans where Username='" + Session["Name"].ToString() + "'";
        string q1 = "select UserName from Tbl_Certification where SubjectID = (select SubjectID from Tbl_Subject where SubjectName = (select Subject from Tbl_User where Username = '" + Session["Name"] + "'))";
        SqlCommand cmd1 = new SqlCommand(Query, con);
        SqlDataReader read = cmd1.ExecuteReader();
        read.Read();
        LabelNoQuestions.Text = read["Count"].ToString();
        con.Close();



        //
        con.Open();
        string QueryTF = "SELECT COUNT(*) AS 'Count' FROM Tbl_Ques_Ans where Username='" + Session["Name"].ToString() + "' and QuestionType='True OR False'";
        SqlCommand cmd2 = new SqlCommand(QueryTF, con);
        SqlDataReader read2 = cmd2.ExecuteReader();
        read2.Read();
        LabelNoQuestionsTf.Text = read2["Count"].ToString();
        con.Close();

        //
        con.Open();
        string QueryMCQ = " SELECT COUNT(*)AS 'Count' FROM Tbl_Ques_Ans where Username = '" + Session["Name"].ToString() + "' and QuestionType = 'MCQ'";
        SqlCommand cmd3 = new SqlCommand(QueryMCQ, con);
        SqlDataReader read3 = cmd3.ExecuteReader();
        read3.Read();
        LabelNoQuestionsMcq.Text = read3["Count"].ToString();
        con.Close();

    }
}