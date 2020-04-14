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
                Master.home.Enabled = false;

                Session["15"] = "15";  //editable
                SwitchPanel();
                CallingData();
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
    
    protected void SwitchPanel()
    {
        if(Session["15"].ToString()=="15") //quize
        {
            PanelFinal.Visible = false;
            PanelQuize.Visible = true;
        }
        else //final
        {
            PanelFinal.Visible = true;
            PanelQuize.Visible = false;
        }
    }

    private void CallingData()
    {
        SqlConnection con = new SqlConnection(conString);
        SqlCommand cmd = new SqlCommand("SELECT top(1) RANK() over(order by ObtainedMarks DESC) As Rank, * FROM Tbl_Certification ORDER BY CertificationID DESC ;", con);

        con.Open();
        SqlDataReader read = cmd.ExecuteReader();

        if (Session["15"].ToString()=="15") //quize
        {
            while (read.Read())
            {
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
        else //final
        {
            while (read.Read())
            {
                LabelRankF.Text = read["Rank"].ToString();

                LabelSuccessF.Text = read["SuccessedMarks"].ToString() + "/60";
                LabelWrongMarkF.Text = read["WrongedMarks"].ToString() + "/60";
                LabelNotAnswerF.Text = read["NotAnswered"].ToString() + "/60";

                LabelObtainF.Text = read["ObtainedMarks"].ToString() + "/120";
                LabelTotalQuetionF.Text = read["TotalQuestions"].ToString(); //60
                LabelTotalMarksF.Text = read["TotalMarks"].ToString();  //120
            }
            con.Close();
        }

    }

}