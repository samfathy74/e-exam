using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentHome : System.Web.UI.Page
{
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

                this.Title = "Welcome " + Session["Name"] + "";

            }

            else
            {
                Response.Redirect("ProfessorHome.aspx");
            }

        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void ButtonSubject_Click(object sender, EventArgs e)
    {
        Response.Redirect("Subject.aspx");
    }
}