using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ControlPanel : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["DatabaseConnecting"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
    }


    private void AuthenticateData()
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT count(*) FROM Tbl_Admin WHERE (Username = @Username) AND Password = @Password", con);
        cmd.Parameters.AddWithValue("@Username", Login1.UserName.Trim());
        cmd.Parameters.AddWithValue("@Password", Login1.Password.Trim());

        bool IsAuthantcat = Convert.ToBoolean(cmd.ExecuteScalar());
        
        if (IsAuthantcat) //true
        {
            UpdatePanel1.Visible = true;

            Login1.Visible = false;
            Login1.Enabled = false;

            Master.lblusername.Text = "Hi " + Login1.UserName;
            Master.logout.Visible = true;
            Master.login.Visible = false;
            Master.signup.Visible = false;
            Master.imgprofile.Visible = true;
            Master.imgprofile.Enabled = false;
        }
        else //false
        {
            Login1.FailureText = "username or password incorrect";
            Login1.FailureTextStyle.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }


    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        AuthenticateData();
    }
}