using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

public partial class ExamCreator : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["DatabaseConnecting"].ConnectionString;

    protected override void OnPreRenderComplete(EventArgs e)
    {
        txtQuestion.Attributes.Add("value", txtQuestion.Text);
        if (ddlQuestionType.SelectedValue == "MCQ")
        {
            ChoiceA.Attributes.Add("value", ChoiceA.Text);
            ChoiceB.Attributes.Add("value", ChoiceB.Text);
            ChoiceC.Attributes.Add("value", ChoiceC.Text);
            ChoiceD.Attributes.Add("value", ChoiceD.Text);
        }
        else if (ddlQuestionType.SelectedValue == "True OR False")
        {
            ChoiceA.Text = "True";
            ChoiceB.Text = "False";
            ChoiceC.Text = null;
            ChoiceD.Text = null;

            ChoiceC.Enabled = false;
            ChoiceC.BackColor = System.Drawing.Color.Gray;
            ChoiceD.Enabled = false;
            ChoiceD.BackColor = System.Drawing.Color.Gray;
        }
        base.OnPreRenderComplete(e);
    }

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

                fillData();
                GetSubjectID();
                txtQuestion.Focus();
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

    private void fillData()
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Tbl_User WHERE Username = '" + Session["Name"].ToString() + "'", con);
        SqlDataReader read = cmd.ExecuteReader();
        while(read.Read())
        {
            lblFName.Text = read["FName"].ToString();
            lblLName.Text = read["LName"].ToString();
 //sessions
            Session["Subject"] =  lblSubject.Text = read["Subject"].ToString();
            Session["EduLevel"] = read["EduLevel"];
        }
        con.Close();
    }


    protected void txtCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProfessorHome.aspx");
    }

    protected void tbnNextQuestion_Click(object sender, EventArgs e)
    {
        NewRecord();
        Reset();
    }

   protected void Reset()
    {
        if (txtQuestion.Text != string.Empty && ChoiceA.Text != string.Empty && ChoiceB.Text != string.Empty && RadioButtonList1.SelectedValue != string.Empty && ddlQuestionChapter.SelectedValue != "0" && ddlQuestionLevel.SelectedValue != "0")
        {
            // Design And Validation
            txtQuestion.Text = null;
            ChoiceA.Text = null;
            ChoiceB.Text = null;
            ChoiceC.Text = null;
            ChoiceD.Text = null;

            lblSuccess.Text = "A NEW QUESTION ADDED";
            lblSuccess.ForeColor = System.Drawing.Color.Green;
        }
        else
        { 
            // PROCESS IS NOT COMPLETED YET...!!
            lblSuccess.Text = "PLEASE FILL ALL DATA..!";
            lblSuccess.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void ddlQuestionType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlQuestionType.SelectedIndex == 1)
        {
            ChoiceA.Text = "True";
            ChoiceB.Text = "False";
            ChoiceC.Text = null;
            ChoiceD.Text = null;
         RequiredFieldValidator3.ValidationGroup = "NULL";
         RequiredFieldValidator4.ValidationGroup = "NULL";

            ChoiceC.Enabled = false;
            ChoiceD.Enabled = false;

        }
        else if(ddlQuestionType.SelectedIndex == 0)
        {
            ChoiceA.Text = null;
            ChoiceB.Text = null;
            ChoiceC.Text = null;
            ChoiceD.Text = null;

            RequiredFieldValidator3.ValidationGroup = "Exam";
            RequiredFieldValidator4.ValidationGroup = "Exam";

            ChoiceC.Enabled = true;
            ChoiceC.BackColor = System.Drawing.Color.White;
            ChoiceD.Enabled = true;
            ChoiceD.BackColor = System.Drawing.Color.White;

            ChoiceA.Attributes.Add("value", ChoiceA.Text);
            ChoiceB.Attributes.Add("value", ChoiceB.Text);
            ChoiceC.Attributes.Add("value", ChoiceC.Text);
            ChoiceD.Attributes.Add("value", ChoiceD.Text);
        }

    }

    //important call subject id
    private void GetSubjectID()
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select EduLevelID  from Tbl_EduLevel where EduLevelName = '" + Session["EduLevel"].ToString() + "'", con);
        SqlDataReader read2 = cmd.ExecuteReader();
        while (read2.Read())
        {
            Session["EduLevelID"] = read2["EduLevelID"];

        }
        con.Close();



        con.Open();
        cmd = new SqlCommand("select SubjectID from Tbl_Subject where SubjectName = '" + Session["Subject"] + "' and EduLevelID = '" + Session["EduLevelID"] + "'", con);
        SqlDataReader read3 = cmd.ExecuteReader();
        while (read3.Read())
        {
             Session["SubjectID"] = read3["SubjectID"].ToString() ;
        }
        con.Close();
    }

    //important         insert questions and answers
    private void NewRecord()
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO [Tbl_Ques_Ans](QuestionDesc,AnswerA,AnswerB,AnswerC,AnswerD,CorrectAnswer,QuestionType,Username,SubjectID,QuestionLevel,Chapter,DateTime) VALUES (N'" + txtQuestion.Text + "',N'" + ChoiceA.Text + "',N'" + ChoiceB.Text + "',N'" + ChoiceC.Text + "',N'" + ChoiceD.Text + "',N'" + RadioButtonList1.SelectedValue.ToString() + "','" + ddlQuestionType.SelectedValue.ToString() + "','" + Session["Name"].ToString() + "','" + Session["SubjectID"].ToString() + "','" + ddlQuestionLevel.SelectedValue.ToString() + "', '" + ddlQuestionChapter.SelectedValue.ToString() + "','" + DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture) + "')", con);
         cmd.ExecuteNonQuery();
        con.Close();
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('Questions and Answers : success insert!'); ", true);

    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(RadioButtonList1.SelectedIndex==0)
        {
           RadioButtonList1.SelectedItem.Value = ChoiceA.Text;

        }
        else if (RadioButtonList1.SelectedIndex == 1)
        {
            RadioButtonList1.SelectedItem.Value = ChoiceB.Text;

        }
        else if (RadioButtonList1.SelectedIndex == 2)
        {
            RadioButtonList1.SelectedItem.Value = ChoiceC.Text;

        }
        else if (RadioButtonList1.SelectedIndex == 3)
        {
            RadioButtonList1.SelectedItem.Value = ChoiceD.Text;

        }
    }
}