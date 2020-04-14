using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Name"] != null && Session.Timeout != 0)
        {
            Master.lblusername.Text = "Hi " + Session["Name"].ToString();
            Master.logout.Visible = true;
            Master.login.Visible = false;
            Master.signup.Visible = false;
            Master.imgprofile.Visible = true;
            Master.home.Enabled = false;

        }
        else
        {
            Master.lblusername.Visible=false;
            Master.logout.Visible = false;
            Master.login.Visible = true;
            Master.signup.Visible = true;
            Master.imgprofile.Visible = false;
            Master.home.Enabled = true;
        }
    }
}