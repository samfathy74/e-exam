using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Exam : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["DatabaseConnecting"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Name"] != null && Session.Timeout != 0)
        {
            if (Session["UserType"].ToString() == "student")
            {
                Master.lblusername.Text = "Hi " + Session["Name"].ToString();
                Master.logout.Visible = false;
                Master.login.Visible = false;
                Master.signup.Visible = false;
                Master.imgprofile.Visible = true;
                Master.home.Enabled=false;
                Master.Imgfeed.Visible = false;
                Master.Imgabout.Visible = false;
                Master.imgprofile.Enabled = false;
                HtmlGenericControl FooterControl = (HtmlGenericControl)Page.Master.FindControl("ContentFooter");
                FooterControl.Visible = false;

                if (Session["SecurityExam"] != null)
                {
                    if (!IsPostBack)
                    {
                        CallUserID();
                        CallSubjectID();
                        DataListBinding();
                    }
                }
                else
                {
                    Response.Redirect("StudentHome.aspx");
                }
                
                if (DataListExam.Items.Count <= 0)
                {
                    DataListExam.Caption = "no questions for this subject now.";
                    DataListExam.ShowFooter = true;
                    PanelTime.Visible = false;

                }
                else
                {
                    DataListExam.ShowFooter = false;
                    PanelTime.Visible = true;
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
    //call id 
    private void CallUserID()
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from Tbl_User where Username='" + Session["Name"] + "'", con);
        SqlDataReader read = cmd.ExecuteReader();
        while (read.Read())
        {
            Session["UserID"] = read["UserID"];
        }
        con.Close();
    }

    //i want alternative  to session
    private void CallSubjectID()
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT SubjectID FROM Tbl_Subject WHERE SubjectName='" + Session["SubjectName"] + "'", con);
        SqlDataReader read = cmd.ExecuteReader();
        read.Read();
        Session["SubjectID"] = read["SubjectID"];
        con.Close();
    }

    protected void DataListExam_Load(object sender, DataListCommandEventArgs e)
    {
        Label LabelEmptyData = (Label)e.Item.FindControl("LabelEmptyData");

        if (DataListExam.Items.Count == 0)
        {
            LabelEmptyData.Visible = true;

        }
        else
        {
            LabelEmptyData.Visible = false;
        }
    }

    private void DataListBinding()
    {
        if (Session["TypeofExam"].ToString() == "Quiz")//quize
        {
            LabelCounterTime.Text = "0.5"; // 1/2 hour = 30 min
            
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand("select top(15) * from Tbl_Ques_Ans where SubjectID='" + Session["SubjectID"] + "' order by NEWID();", con);
            SqlDataAdapter Adp = new SqlDataAdapter(cmd);
            con.Open();

            DataSet ds = new DataSet();
            Adp.Fill(ds);
            DataListExam.DataSource = ds;
            DataListExam.DataBind();

            Session["ds"] = ds;
            con.Close();
        }
        else if(Session["TypeofExam"].ToString()=="Final")
        {
            LabelCounterTime.Text = "2"; //2 hour = 120 min
            //final
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand("select top(60) * from Tbl_Ques_Ans where SubjectID='" + Session["SubjectID"] + "' order by NEWID();", con);
            SqlDataAdapter Adp = new SqlDataAdapter(cmd);
            con.Open();

            DataSet ds = new DataSet();
            Adp.Fill(ds);
            DataListExam.DataSource = ds;
            DataListExam.DataBind();

            Session["ds"] = ds;
            con.Close();
        }
        else
        {
            LabelCounterTime.Text = "0.3"; // 1/3 hour = 20 min
            //Training
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand("select top(10) * from Tbl_Ques_Ans where SubjectID='" + Session["SubjectID"] + "' order by NEWID();", con);
            SqlDataAdapter Adp = new SqlDataAdapter(cmd);
            con.Open();

            DataSet ds = new DataSet();
            Adp.Fill(ds);
            DataListExam.DataSource = ds;
            DataListExam.DataBind();

            Session["ds"] = ds;
            con.Close();
        }
    }


    protected void ButtonFinish_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("CorrectAnswer", typeof(string));

        foreach (DataListItem item in DataListExam.Items)
        {
            int index = Convert.ToInt32(DataListExam.DataKeys[item.ItemIndex]);

            bool a = (item.FindControl("RadioAnswerA") as RadioButton).Checked;
            bool b = (item.FindControl("RadioAnswerB") as RadioButton).Checked;
            bool c = (item.FindControl("RadioAnswerC") as RadioButton).Checked;
            bool d = (item.FindControl("RadioAnswerD") as RadioButton).Checked;


            string r1 = (item.FindControl("RadioAnswerA") as RadioButton).Text.ToString();
            string r2 = (item.FindControl("RadioAnswerB") as RadioButton).Text.ToString();
            string r3 = (item.FindControl("RadioAnswerC") as RadioButton).Text.ToString();
            string r4 = (item.FindControl("RadioAnswerD") as RadioButton).Text.ToString();

            string answer = null;

            if (a)
            {
                answer = r1;
            }
            else if (b)
            {
                answer = r2;
            }
            else if (c)
            {
                answer = r3;
            }

            else if (d)
            {
                answer = r4;
            }

            dt.Rows.Add(answer);
        }

        DataSet ds = new DataSet();
        ds.Tables.Add(dt);
        DataSet question = (DataSet)Session["ds"];
        int correctCount = 0;
        int wrongCount = 0;

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            if (ds.Tables[0].Rows[i]["CorrectAnswer"].ToString() == question.Tables[0].Rows[i]["CorrectAnswer"].ToString())
            {
                correctCount++;
            }
            else
            {
                wrongCount++;
            }
        }

        try
        {
            double TotalQuestion = 0, TotalMark = 0; string ExamType = null;
            if (Session["TypeofExam"].ToString() == "Quiz") //Quiz
            {
                TotalMark = 30; TotalQuestion = 15; ExamType = "Quiz";
            }
            if (Session["TypeofExam"].ToString() == "Training") //Training
            {
                TotalMark = 20; TotalQuestion = 10; ExamType = "Training";
            }
            if (Session["TypeofExam"].ToString() == "Final") //Final
            {
                TotalMark = 120; TotalQuestion = 60; ExamType = "Final";
            }

            if (DataListExam.Items.Count != 0)
            {

                SqlConnection con = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand("insert into Tbl_Certification (TotalQuestions,TotalMarks,SuccessedMarks,WrongedMarks,ObtainedMarks,ExamType,UserName,SubjectID,DateTime,UserID) values ('" + TotalQuestion + "','" + TotalMark + "','" + correctCount + "','" + wrongCount + "','" + correctCount * 2 + "','" + ExamType + "','" + Session["Name"] + "','" + Session["SubjectID"] + "','" + DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture) + "','" + Session["UserID"] + "');", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Session["SecurityResult"] = "1"; //to prevent any enter unAuthenticate
                Response.Redirect("Results.aspx");
                ResetRadioButton();
            }
            else
            {
                //Response.Redirect("StudentHome.aspx");
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('" + ex.ToString() + "');", true);
        }
    }

    void ResetRadioButton()
    {
        foreach (DataListItem item in DataListExam.Items)
        {
            int index = Convert.ToInt32(DataListExam.DataKeys[item.ItemIndex]);
            (item.FindControl("RadioAnswerA") as RadioButton).Checked = false;
            (item.FindControl("RadioAnswerB") as RadioButton).Checked = false;
            (item.FindControl("RadioAnswerC") as RadioButton).Checked = false;
            (item.FindControl("RadioAnswerD") as RadioButton).Checked = false;
        }
    }

}
