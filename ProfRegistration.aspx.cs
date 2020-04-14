using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProfRegistration : System.Web.UI.Page
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
        ddlEduLevel.DataSource = cmd.ExecuteReader();
        ddlEduLevel.DataValueField = "EduLevelID";
        ddlEduLevel.DataTextField = "EduLevelName";
        ddlEduLevel.DataBind();
        ddlEduLevel.Items.Insert(0, new ListItem("Select Educational level", "0"));
        con.Close();
    }

    protected void btnsignup_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtname.BackColor == Color.LightCoral || txtname.BackColor == Color.LightCoral)

            {
                Response.Write("<script>alert('there are name or email are used!'); </script");
            }

            else if (Page.IsValid || txtname.BackColor == Color.LightGreen || txtname.BackColor == Color.LightGreen)
            {

                SqlConnection con = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand("Insert into Tbl_User (FName,LName,Username,Email,Password,Phone,NationalID,UserType,EduLevel,Subject,Status,DateTime) values (N'" + txtFname.Text.Trim() + "', N'" + txtLname.Text.Trim() + "', '" + txtname.Text.Trim() + "','" + txtemail.Text.Trim() + "',N'" + txtpassword.Text.Trim() + "','" + txtPhone.Text.Trim() + "','" + txtNationalID.Text.Trim() + "','professor','" + ddlEduLevel.SelectedItem + "','"+ddlMaterial.SelectedItem+"','0','"+ DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt", CultureInfo.InvariantCulture) + "')", con);
                con.Open();
                Session["Name"] = txtname.Text;
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Loading.aspx");


            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Javascript", "alert('Error : there is problems!'); ", true);

            }
        }
        catch (Exception e1)
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

    protected void ddlEduLevel_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlEduLevel.SelectedIndex != 0)
        {
            ddlMaterial.Enabled = true;
        }
        SqlConnection con = new SqlConnection(conString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM [Tbl_Subject] where EduLevelID='" + ddlEduLevel.SelectedValue + "'", con);
        con.Open();
        //education droplist
        ddlMaterial.DataSource = cmd.ExecuteReader();
        ddlMaterial.DataValueField = "SubjectID";
        ddlMaterial.DataTextField = "SubjectName";
        ddlMaterial.DataBind();
        ddlMaterial.Items.Insert(0, new ListItem("Select Subject", "0"));
        con.Close();
    }

    protected override void OnPreRender(EventArgs e) //to keep password in filed
    {
        txtpassword.Attributes.Add("value", txtpassword.Text);
        txtcpassword.Attributes.Add("value", txtcpassword.Text);
        base.OnPreRender(e);
    }
}