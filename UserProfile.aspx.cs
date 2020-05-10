using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class userProfile : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["DatabaseConnecting"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(conString);
        lblSuccessSave.Visible = false;
        lblSuccessPass.Visible = false;

        if (Session["Name"] != null && Session.Timeout != 0)
        {
            Master.lblusername.Text = "Hi " + Session["Name"].ToString();
            Master.logout.Visible = true;
            Master.login.Visible = false;
            Master.signup.Visible = false;
            Master.imgprofile.Visible = true;
            Master.home.Enabled = false;

            this.Title = "Profile";
            FillData();

        }
        else
        {
            Response.Redirect("Login.aspx");
            Master.home.Enabled = true;

        }
    }

    //========================= main panal ===============================================================================================//
    protected void profilebtn_Click(object sender, EventArgs e)
    {
        // Display Panal data.. 
        MainProfPanal.Visible = true;
        ChangeEmailPanal.Visible = false;
        EditPasswordPanal.Visible = false;

        profilebtn.Enabled = false;
        ButtonPersonalInfo.Enabled = true;
        ButtonPassword.Enabled = true;

        FillData();
    }
    /// 
    /// 
    /// 
    void FillData()
    {
        SqlConnection con = new SqlConnection(conString);

        // View Selected Data Using Session
        string query = "SELECT * FROM Tbl_User WHERE Username = '" + Session["Name"].ToString() + "'";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            lblFName.Text = reader["FName"].ToString();
            lblLName.Text = reader["LName"].ToString();
            lblUserName.Text = reader["Username"].ToString();
            lblEmail.Text = reader["Email"].ToString();
            lblPhone.Text = reader["Phone"].ToString();
            lblType.Text = reader["UserType"].ToString();
            //
            //sessions
            //
            Session["FName"] = reader["FName"].ToString();
            Session["LName"] = reader["LName"].ToString();
            Session["Email"] = reader["Email"].ToString();
            Session["Pass"] = reader["Password"].ToString();
            Session["Phone"] = reader["Phone"].ToString();
            Session["UserType"] = reader["UserType"].ToString();


            if (lblType.Text == "professor")
            {
                Label6.Text = "National ID: ";
                lblEduLevel.Text = reader["NationalID"].ToString();
                Label7.Visible = false;
                lblLevel.Visible = false;
            }
            else
            {
                lblEduLevel.Text = reader["EduLevel"].ToString();
                lblLevel.Text = reader["Level"].ToString();
            }
        }
        con.Close();
    }
 //======================================================= My data panal ================================================================//
    protected void ButtonPersonalInfo_Click(object sender, EventArgs e)
    {
        // Display Panal...
        MainProfPanal.Visible = false;
        EditPasswordPanal.Visible = false;
        ChangeEmailPanal.Visible = true;

        profilebtn.Enabled = true;
        ButtonPersonalInfo.Enabled = false;
        ButtonPassword.Enabled = true;

        txtFirstName.BackColor = System.Drawing.Color.Gray;
        txtLastName.BackColor = System.Drawing.Color.Gray;
        txtEmail.BackColor = System.Drawing.Color.Gray;
        txtPhone.BackColor = System.Drawing.Color.Gray;

        // Configue textboxs with User data
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        string query = "SELECT * FROM Tbl_User WHERE Username = '" + Session["Name"].ToString() + "'";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader reader = cmd.ExecuteReader();
        while(reader.Read())
        {
            txtFirstName.Text = reader["FName"].ToString();
            txtLastName.Text = reader["LName"].ToString();
            txtEmail.Text = reader["Email"].ToString();
            txtPhone.Text = reader["Phone"].ToString();
        }
        con.Close();
    }
    protected void ClearPersonalData()
    {
                //reset textbox
            txtPassword.Text = null;
    }
   
    /// 
    /// F.name
    /// 
    protected void editbtnFName_Click(object sender, ImageClickEventArgs e)
    {
        txtFirstName.ReadOnly = false;
        txtFirstName.BackColor = System.Drawing.Color.White;
        okbtnFName.Visible = true;
        cancelbtnFName.Visible = true;
        editbtnFName.Visible = false;
    }
    /// 
    /// L.name
    /// 
    protected void editbtnLName_Click(object sender, ImageClickEventArgs e)
    {
        txtLastName.ReadOnly = false;
        txtLastName.BackColor = System.Drawing.Color.White;
        okbtnLName.Visible = true;
        cancelbtnLName.Visible = true;
        editbtnLName.Visible = false;
    }
    /// 
    /// F.name
    /// 
    protected void editbtnEmail_Click(object sender, ImageClickEventArgs e)
    {
        txtEmail.ReadOnly = false;
        txtEmail.BackColor = System.Drawing.Color.White;
        okbtnEmail.Visible = true;
        cancelbtnEmail.Visible = true;
        editbtnEmail.Visible = false;
    }
    /// 
    /// e-mail
    /// 
    protected void editbtnPhone_Click(object sender, ImageClickEventArgs e)
    {
        txtPhone.ReadOnly = false;
        txtPhone.BackColor = System.Drawing.Color.White;
        okbtnPhone.Visible = true;
        cancelbtnPhone.Visible = true;
        editbtnPhone.Visible = false;
    }
    /// 
    /// password
    /// 

    protected void ShowPassbtn_Click(object sender, ImageClickEventArgs e)
    {
        txtPassword.TextMode = TextBoxMode.SingleLine;
        ShowPassbtn.Visible = false;
        HidePassbtn.Visible = true;
    }

    protected void HidePassbtn_Click(object sender, ImageClickEventArgs e)
    {
        txtPassword.TextMode = TextBoxMode.Password;
        ShowPassbtn.Visible = true;
        HidePassbtn.Visible = false;
    }

    //================================[ make confirm changes ]===========================================//
    /// 
    /// F.name
    /// 
    protected void okbtnFName_Click(object sender, ImageClickEventArgs e)
    {
        // Display design..
        txtFirstName.ReadOnly = true;
        txtFirstName.BackColor = System.Drawing.Color.Gray;
        okbtnFName.Visible = false;
        cancelbtnFName.Visible = false;
        editbtnFName.Visible = true;

        //Confirm Changes
        SqlConnection con = new SqlConnection(conString);
        if (Session["Pass"].ToString() == txtPassword.Text)
        {
            if (Session["FName"].ToString() != txtFirstName.Text)
            {
                SqlCommand cmd = new SqlCommand("UPDATE Tbl_User SET FName = '" + txtFirstName.Text.Trim() + "' WHERE Username = '" + Session["Name"].ToString() + "'", con);
                con.Open();
                cmd.ExecuteScalar();
                con.Close();
                lblSuccessSave.Visible = true;
                lblSuccessSave.Text = "Successfully Changed..";
                lblSuccessSave.BackColor = System.Drawing.Color.LightGreen;

                ClearPersonalData();
            }
            else
            {
                lblSuccessSave.Visible = true;
                lblSuccessSave.Text = "First Name not changed..!";
                lblSuccessSave.BackColor = System.Drawing.Color.LightCoral;
            }
        }
        else
        {
            lblSuccessSave.Visible = true;
            lblSuccessSave.Text = "Incorrect Password..!";
            lblSuccessSave.BackColor = System.Drawing.Color.LightCoral;
            okbtnFName.Visible = true;
            cancelbtnFName.Visible = true;
            editbtnFName.Visible = false;
            txtFirstName.ReadOnly = false;
            txtFirstName.BackColor = System.Drawing.Color.White;
        }
    }
    /// 
    /// L.name
    /// 
    protected void okbtnLName_Click(object sender, ImageClickEventArgs e)
    {
        txtLastName.ReadOnly = true;
        txtLastName.BackColor = System.Drawing.Color.Gray;
        okbtnLName.Visible = false;
        cancelbtnLName.Visible = false;
        editbtnLName.Visible = true;

        //Confirm Changes
        SqlConnection con = new SqlConnection(conString);
        if (Session["Pass"].ToString() == txtPassword.Text)
        {
            if (Session["LName"].ToString() != txtLastName.Text)
            {
            SqlCommand cmd = new SqlCommand("UPDATE Tbl_User SET LName = '" + txtLastName.Text.Trim() + "' WHERE Username = '" + Session["Name"].ToString() + "'", con);
            con.Open();
            cmd.ExecuteScalar();
            con.Close();
            lblSuccessSave.Visible = true;
            lblSuccessSave.Text = "Successfully Changed..";
            lblSuccessSave.BackColor = System.Drawing.Color.LightGreen;

            ClearPersonalData();
        }
        else
        {
                lblSuccessSave.Visible = true;
                lblSuccessSave.Text = "Last Name not changed..!";
                lblSuccessSave.BackColor = System.Drawing.Color.LightCoral;
        }

    }
        else
        {
            lblSuccessSave.Visible = true;
            lblSuccessSave.Text = "Incorrect Password..!";
            lblSuccessSave.BackColor = System.Drawing.Color.LightCoral;
            okbtnLName.Visible = true;
            cancelbtnLName.Visible = true;
            editbtnLName.Visible = false;
            txtLastName.ReadOnly = false;
            txtLastName.BackColor = System.Drawing.Color.White;
        }
    }
    /// 
    /// e-mail
    /// 
    protected void okbtnEmail_Click(object sender, ImageClickEventArgs e)
    {
        txtEmail.ReadOnly = true;
        txtEmail.BackColor = System.Drawing.Color.Gray;
        okbtnEmail.Visible = false;
        cancelbtnEmail.Visible = false;
        editbtnEmail.Visible = true;

        //Confirm Changes
        SqlConnection con = new SqlConnection(conString);
        if (Session["Pass"].ToString() == txtPassword.Text)
        {
            if (Session["Email"].ToString() != txtEmail.Text)
            {
                SqlCommand cmd = new SqlCommand("UPDATE Tbl_User SET Email = '" + txtEmail.Text.Trim() + "' WHERE Username = '" + Session["Name"].ToString() + "'", con);
                con.Open();
                cmd.ExecuteScalar();
                con.Close();
                lblSuccessSave.Visible = true;
                lblSuccessSave.Text = "Successfully Changed..";
                lblSuccessSave.BackColor = System.Drawing.Color.LightGreen;

                ClearPersonalData();
            }
            else
            {
                lblSuccessSave.Visible = true;
                lblSuccessSave.Text = "E-mail not changed..!";
                lblSuccessSave.BackColor = System.Drawing.Color.LightCoral;
            }
        }
        else
        {
            lblSuccessSave.Visible = true;
            lblSuccessSave.Text = "Incorrect Password..!";
            lblSuccessSave.BackColor = System.Drawing.Color.LightCoral;
            okbtnEmail.Visible = true;
            cancelbtnEmail.Visible = true;
            editbtnEmail.Visible = false;
            txtEmail.ReadOnly = false;
            txtEmail.BackColor = System.Drawing.Color.White;
        }
    }
    /// 
    /// phone
    /// 
    protected void okbtnPhone_Click(object sender, ImageClickEventArgs e)
    {
        txtPhone.ReadOnly = true;
        txtPhone.BackColor = System.Drawing.Color.Gray;
        okbtnPhone.Visible = false;
        cancelbtnPhone.Visible = false;
        editbtnPhone.Visible = true;

        //Confirm Changes
        SqlConnection con = new SqlConnection(conString);
        if (Session["Pass"].ToString() == txtPassword.Text)
        {
            if (Session["Phone"].ToString() != txtPhone.Text)
            {
                SqlCommand cmd = new SqlCommand("UPDATE Tbl_User SET Phone = '" + txtPhone.Text.Trim() + "' WHERE Username = '" + Session["Name"].ToString() + "'", con);
                con.Open();
                cmd.ExecuteScalar();
                con.Close();
                lblSuccessSave.Visible = true;
                lblSuccessSave.Text = "Successfully Changed..";
                lblSuccessSave.BackColor = System.Drawing.Color.LightGreen;

                ClearPersonalData();
            }
            else
            {
                lblSuccessSave.Visible = true;
                lblSuccessSave.Text = "Phone number not changed..!";
                lblSuccessSave.BackColor = System.Drawing.Color.LightCoral;
            }

        }
        else
        {
            lblSuccessSave.Visible = true;
            lblSuccessSave.Text = "Incorrect Password..!";
            lblSuccessSave.BackColor = System.Drawing.Color.LightCoral;
            okbtnPhone.Visible = true;
            cancelbtnPhone.Visible = true;
            editbtnPhone.Visible = false;
            txtPhone.ReadOnly = false;
            txtPhone.BackColor = System.Drawing.Color.White;
        }
    }
    //================================[ cancel for changes ]==================================================//
    /// 
    /// F.name
    /// 
    protected void cancelbtnFName_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        string FName = "SELECT FName FROM Tbl_User WHERE Username = '" + Session["Name"] + "'";
        SqlCommand cmd = new SqlCommand(FName, con);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            txtFirstName.Text = reader["FName"].ToString();
        }
        con.Close();
        txtFirstName.ReadOnly = true;
        txtFirstName.BackColor = System.Drawing.Color.Gray;
        okbtnFName.Visible = false;
        cancelbtnFName.Visible = false;
        editbtnFName.Visible = true;
        txtPassword.Text = null;
    }
    /// 
    /// L.name
    /// 
    protected void cancelbtnLName_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        string LName = "SELECT LName FROM Tbl_User WHERE Username = '" + Session["Name"] + "'";
        SqlCommand cmd = new SqlCommand(LName, con);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            txtLastName.Text = reader["LName"].ToString();
        }
        con.Close();
        txtLastName.ReadOnly = true;
        txtLastName.BackColor = System.Drawing.Color.Gray;
        okbtnLName.Visible = false;
        cancelbtnLName.Visible = false;
        editbtnLName.Visible = true;
        txtPassword.Text = null;
    }
    /// 
    /// e-mail
    /// 
    protected void cancelbtnEmail_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        string Email = "SELECT Email FROM Tbl_User WHERE Username = '" + Session["Name"] + "'";
        SqlCommand cmd = new SqlCommand(Email, con);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            txtEmail.Text = reader["Email"].ToString();
        }
        con.Close();
        txtEmail.ReadOnly = true;
        txtEmail.BackColor = System.Drawing.Color.Gray;
        okbtnEmail.Visible = false;
        cancelbtnEmail.Visible = false;
        editbtnEmail.Visible = true;
        txtPassword.Text = null;

    }
    /// 
    /// phone
    /// 
    protected void cancelbtnPhone_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection con = new SqlConnection(conString);
        con.Open();
        string Phone = "SELECT Phone FROM Tbl_User WHERE Username = '" + Session["Name"] + "'";
        SqlCommand cmd = new SqlCommand(Phone, con);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            txtPhone.Text = reader["Phone"].ToString();
        }
        con.Close();
        txtPhone.ReadOnly = true;
        txtPhone.BackColor = System.Drawing.Color.Gray;
        okbtnPhone.Visible = false;
        cancelbtnPhone.Visible = false;
        editbtnPhone.Visible = true;
        txtPassword.Text = null;
    }
    //========================= password panal ==========================================================================================//
    protected void ButtonPassword_Click(object sender, EventArgs e)
    {
        MainProfPanal.Visible = false;
        ChangeEmailPanal.Visible = false;
        EditPasswordPanal.Visible = true;

        profilebtn.Enabled = true;
        ButtonPersonalInfo.Enabled = true;
        ButtonPassword.Enabled = false;
    }

    protected void SavePassbtn_Click(object sender, EventArgs e)
    {
        //Check Old Password And Confirm Changes...
        SqlConnection con = new SqlConnection(conString);
        if (Session["Pass"].ToString() == txtOldPass.Text)
        {
            if (Session["Pass"].ToString() != txtNewPass.Text)
            {
                SqlCommand cmd = new SqlCommand("UPDATE Tbl_User SET Password = '" + txtNewPass.Text + "' WHERE Username = '" + Session["Name"].ToString() + "'", con);
                con.Open();
                cmd.ExecuteScalar();
                con.Close();
                lblSuccessPass.Visible = true;
                lblSuccessPass.Text = "Successfully Changed..";
                lblSuccessPass.BackColor = System.Drawing.Color.LightGreen;

                //reset textbox
                txtConfirmPass.Text = null;
                txtOldPass.Text = null;
                txtNewPass.Text = null;
            }
            else
            {
                lblSuccessPass.Visible = true;
                lblSuccessPass.Text = "Password not changed..!";
                lblSuccessPass.BackColor = System.Drawing.Color.LightCoral;
            }
        }
        else
        {
            lblSuccessPass.Visible = true;
            lblSuccessPass.Text = "Incoorect Password..!";
            lblSuccessPass.BackColor = System.Drawing.Color.LightCoral;
        }
    }
   
   
    //hide and show password
    protected void ShowOldPassbtn_Click(object sender, ImageClickEventArgs e)
    {
        txtOldPass.TextMode = TextBoxMode.SingleLine;
        ShowOldPassbtn.Visible = false;
        HideOldPassbtn.Visible = true;
    }

    protected void HideOldPassbtn_Click(object sender, ImageClickEventArgs e)
    {
        txtOldPass.TextMode = TextBoxMode.Password;
        HideOldPassbtn.Visible = false;
        ShowOldPassbtn.Visible = true;
    }
    //
    //
    //
    protected void ShowNewPassbtn_Click(object sender, ImageClickEventArgs e)
    {
        txtNewPass.TextMode = TextBoxMode.SingleLine;
        ShowNewPassbtn.Visible = false;
        HideNewPassbtn.Visible = true;
    }

    protected void HideNewPassbtn_Click(object sender, ImageClickEventArgs e)
    {
        txtNewPass.TextMode = TextBoxMode.Password;
        HideNewPassbtn.Visible = false;
        ShowNewPassbtn.Visible = true;
    }
    //
    //
    //
    protected void ShowConfrimPassbtn_Click(object sender, ImageClickEventArgs e)
    {
        txtConfirmPass.TextMode = TextBoxMode.SingleLine;
        ShowConfrimPassbtn.Visible = false;
        HideConfirmPassbtn.Visible = true;
    }

    protected void HideConfirmPassbtn_Click(object sender, ImageClickEventArgs e)
    {
        txtConfirmPass.TextMode = TextBoxMode.Password;
        HideConfirmPassbtn.Visible = false;
        ShowConfrimPassbtn.Visible = true;
    }
    /// 
    /// to keep password in fields
    /// 
    protected override void OnPreRenderComplete(EventArgs e)
    {
        txtPassword.Attributes.Add("value", txtPassword.Text);
        txtOldPass.Attributes.Add("value", txtOldPass.Text);
        txtNewPass.Attributes.Add("value", txtNewPass.Text);
        txtConfirmPass.Attributes.Add("value", txtConfirmPass.Text);
        base.OnPreRenderComplete(e);
    }
    /// <summary>
    /// back button
    /// </summary>
    protected void ImgBtnBack_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["UserType"].ToString() == "professor")
        {
            Response.Redirect("ProfessorHome.aspx");
        }
        else if (Session["UserType"].ToString() == "student")
        {
            Response.Redirect("StudentHome.aspx");
        }

    }

}