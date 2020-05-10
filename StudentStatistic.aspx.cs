using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentStatistic : System.Web.UI.Page
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
}