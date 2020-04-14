using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginLoading : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["DatabaseConnecting"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["UserName&Email"] != null && Session.Timeout != 0)
        {
            Master.logout.Visible = false;
            Master.login.Visible = false;
            Master.signup.Visible = false;
            Master.imgprofile.Visible = false;
            this.Title = "Loading.....";
        }
        else
        {
            Response.Redirect("Login.aspx");
            Master.home.Enabled = true;
        }

        SqlConnection con = new SqlConnection(conString);
        con.Open();
        SqlCommand cmdType = new SqlCommand("SELECT Status , UserType FROM Tbl_User WHERE (Username = '" + Session["UserName&Email"].ToString() + "' OR Email = '" + Session["UserName&Email"].ToString() + "')", con);
        SqlDataReader read = cmdType.ExecuteReader();
        while (read.Read())
        {
            string Type = read["UserType"].ToString();
            Session["UserType"] = Type;

            string Status = read["Status"].ToString();
            Session["Status"] = Status;

            if (Type == "professor" && Status == "1")
            {
                Response.Redirect("ProfessorHome.aspx");
                con.Close();
            }
            else if (Type == "student" && Status == "0")
            {
                Response.Redirect("StudentHome.aspx");
                con.Close();
            }
            else
            {
                Label1.Text = "This account did not get approval from the admin. Please wait and repeat at a later time... ,<br>You will be redirected automatic to the Login page";
                Session.Abandon();
            }
        }
        con.Close();
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}
