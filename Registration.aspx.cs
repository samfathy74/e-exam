using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Globalization;

public partial class Registration : System.Web.UI.Page
{
    // read the coonection string from web.config
    string conString = ConfigurationManager.ConnectionStrings["DatabaseConnecting"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        CheckUsername();
        CheckEmail();

        if(!IsPostBack)
        {
            DropListEducationLv();
        }
    }

    protected void DropListEducationLv()
    {
        SqlConnection con = new SqlConnection(conString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [Tbl_EduLevel]", con);
        con.Open();
        //education droplist
        DropEducation.DataSource = cmd.ExecuteReader();
        DropEducation.DataValueField = "EduLevelID";
        DropEducation.DataTextField = "EduLevelName";
        DropEducation.DataBind();
        DropEducation.Items.Insert(0, new ListItem("Select Educational level", "0"));
        con.Close();
    }

    protected void btnsignup_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtname.BackColor == Color.LightCoral || txtname.BackColor == Color.LightCoral) 

            {
                Response.Write("<script> alert('there are name or email are used!'); </script>");
            }

           else if (txtname.BackColor == Color.LightGreen || txtname.BackColor == Color.LightGreen)
            {
                Session["Name"] = txtname.Text;
                SqlConnection con = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand("Insert into Tbl_User (FName,LName,Username,Email,Password,Phone,UserType,EduLevel,Level,Status,DateTime) values (N'" + txtFname.Text.Trim() + "', N'" + txtLname.Text.Trim() + "', '" + txtname.Text.Trim() + "','" + txtemail.Text.Trim() + "',N'" + txtpassword.Text.Trim() + "','" + txtPhone.Text.Trim() + "','student','" + DropEducation.SelectedItem + "','" + DropLevel.SelectedItem+ "','0','" + DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture) + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Login.aspx");

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('Error : there is problem!'); ", true);
            }
        }
        catch(Exception e1)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('Error : " + e1.Message + "'); ", true);
        }
    }
    //*****************************************//costractor to take value in session to display in other page;*************//
    protected void txtname_TextChanged(object sender, EventArgs e)
    {
        CheckUsername();
    }
    protected void txtemail_TextChanged(object sender, EventArgs e)
    {   
        CheckEmail();
    } 


  //*******************method check data******************************//
    protected void CheckUsername()
    {
        SqlConnection con = new SqlConnection(conString);

        //confirm from user on database!!
        SqlCommand cmd = new SqlCommand("select * from Tbl_User where Username='" + txtname.Text.Trim() + "'", con);
        con.Open();
        SqlDataReader read = cmd.ExecuteReader();
        
        if (string.IsNullOrWhiteSpace(txtname.Text))
        {
            txtname.BackColor = Color.Empty;
        }
        else
        {
            if (read.HasRows)
            {
                txtname.BackColor = Color.LightCoral;
                txtname.ToolTip = "Not Available ❌";
                txtname.Focus();
            }
            else
            {
                txtname.BackColor = Color.LightGreen;
                txtname.ToolTip = "Available ✔";               
            }
        }
        con.Close();
    }

//*******************method check data******************************//
    protected void CheckEmail()
    {
        SqlConnection con = new SqlConnection(conString);

        //confirm from email on database!!
        SqlCommand cmd = new SqlCommand("select * from Tbl_User where Email='" + txtemail.Text.Trim() + "'", con);
        con.Open();
        SqlDataReader read = cmd.ExecuteReader();

        if (string.IsNullOrWhiteSpace(txtemail.Text))
        {
            txtemail.BackColor = Color.Empty;
        }
        else
        {
            if (read.HasRows)
            {
             
                txtemail.BackColor = Color.LightCoral;
                txtemail.ToolTip = "Not Available ❌";
                txtemail.Focus();

            }
            else
            {
              
                txtemail.BackColor = Color.LightGreen;
                txtemail.ToolTip = "Available ✔";
            }
        }
        con.Close();
    }

    protected void DropEducation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropEducation.SelectedIndex != 0)
        {
            DropLevel.Enabled = true;
        }

        SqlConnection con = new SqlConnection(conString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [Tbl_Level] WHERE [EduLevelID] = '" + DropEducation.SelectedValue + "'", con);
        con.Open();
        //education droplist
        DropLevel.DataSource = cmd.ExecuteReader();
        DropLevel.DataValueField = "LevelID";
        DropLevel.DataTextField = "LevelNumber";
        DropLevel.DataBind();
        DropLevel.Items.Insert(0, new ListItem("Select Level", "0"));
        con.Close();
    }

    protected override void OnPreRender(EventArgs e) //to keep password in filed
    {
        txtpassword.Attributes.Add("value", txtpassword.Text);
        txtcpassword.Attributes.Add("value", txtcpassword.Text);
        base.OnPreRender(e);
    }
}