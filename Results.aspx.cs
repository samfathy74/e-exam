using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Results : System.Web.UI.Page
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

                //Session["SecurityResult"] = "1"; //to prevent any enter unAuthenticate

                if (Session["SecurityResult"] != null)
                {
                    Session["SecurityExam"] = null;
                    CallingData();
                }
                else
                {
                    Response.Redirect("StudentHome.aspx");
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
    

    private void CallingData()
    {
        SqlConnection con = new SqlConnection(conString);
        SqlCommand cmd = new SqlCommand("SELECT top(1) RANK() over(order by ObtainedMarks DESC) As Rank, * FROM Tbl_Certification ORDER BY CertificationID DESC ;", con);

        con.Open();
        SqlDataReader read = cmd.ExecuteReader();

        if (Session["TypeofExam"].ToString() == "Quiz") //quize
        {
            while (read.Read())
            {
                Session["ResultofExam"] = read["ExamType"].ToString();

                LabelRankQ.Text = read["Rank"].ToString();

                LabelSucessQ.Text = read["SuccessedMarks"].ToString() + "/15";
                LabelWrongQ.Text = read["WrongedMarks"].ToString() + "/15";
                LabelNotAnswerQ.Text = read["NotAnswered"].ToString() + "/15";

                LabelObtainQ.Text = read["ObtainedMarks"].ToString() + "/30";
                LabelTotalQuestionQ.Text = read["TotalQuestions"].ToString(); //30
                LabelTotalMarksQ.Text = read["TotalMarks"].ToString();  //60
            }
            con.Close();
        }

        else if (Session["TypeofExam"].ToString() == "Final")  //final
        {
            while (read.Read())
            {
                Session["ResultofExam"] = read["ExamType"].ToString();

                LabelRankQ.Text = read["Rank"].ToString();

                LabelSucessQ.Text = read["SuccessedMarks"].ToString() + "/60";
                LabelWrongQ.Text = read["WrongedMarks"].ToString() + "/60";
                LabelNotAnswerQ.Text = read["NotAnswered"].ToString() + "/60";

                LabelObtainQ.Text = read["ObtainedMarks"].ToString() + "/120";
                LabelTotalQuestionQ.Text = read["TotalQuestions"].ToString(); //60
                LabelTotalMarksQ.Text = read["TotalMarks"].ToString();  //120
            }
            con.Close();
        }


        else if(Session["TypeofExam"].ToString() == "Training") //Training
        {
            while (read.Read())
            {
                Session["ResultofExam"] = read["ExamType"].ToString();

                LabelRankQ.Text = read["Rank"].ToString();

                LabelSucessQ.Text = read["SuccessedMarks"].ToString() + "/10";
                LabelWrongQ.Text = read["WrongedMarks"].ToString() + "/10";
                LabelNotAnswerQ.Text = read["NotAnswered"].ToString() + "/10";

                LabelObtainQ.Text = read["ObtainedMarks"].ToString() + "/20";
                LabelTotalQuestionQ.Text = read["TotalQuestions"].ToString(); //10
                LabelTotalMarksQ.Text = read["TotalMarks"].ToString();  //20
            }
            con.Close();
        }

    }

}