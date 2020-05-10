using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Login : System.Web.UI.Page
{
    // read the coonection string from web.config
    string conString = ConfigurationManager.ConnectionStrings["DatabaseConnecting"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    //******************************************************button login***************************************************************//

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        //Check emai , password or username
        SqlCommand cmd = new SqlCommand("SELECT count(*) FROM Tbl_User WHERE (Username = @Username OR Email = @Email) AND Password = @Password", con);
        cmd.Parameters.AddWithValue("@Username", txtnamelogin.Text.Trim());
        cmd.Parameters.AddWithValue("@Email", txtnamelogin.Text.Trim());
        cmd.Parameters.AddWithValue("@Password", txtpasswordlogin.Text.Trim());


        bool IsAuthantcat = Convert.ToBoolean(cmd.ExecuteScalar());

        if (IsAuthantcat)
        {
            Session["UserName&Email"] = txtnamelogin.Text.Trim();

            SqlCommand cmd1 = new SqlCommand("SELECT Username FROM Tbl_User WHERE (Username = @Username OR Email = @Email)", con);
            cmd1.Parameters.AddWithValue("@Username", Session["UserName&Email"]);
            cmd1.Parameters.AddWithValue("@Email", Session["UserName&Email"]);
            SqlDataReader read = cmd1.ExecuteReader();
            read.Read();
            Session["Name"] = read["Username"];

            Response.Redirect("LoginLoading.aspx");
        }
        else
        {
            Labellogin.Visible = true;
            Labellogin.Text = "Username or Password Incorrect";
        }
        con.Close();  

    }
    //*****************************************************TextBox****************************************************************//
    protected void txtnamelogin_TextChanged(object sender, EventArgs e)
    {
         // Application["Name"]=txtnamelogin.Text;
    }

}