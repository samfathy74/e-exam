using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Loading : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.logout.Visible = false;
        Master.login.Visible = false;
        Master.signup.Visible = false;
        Master.imgprofile.Visible = false;
   
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
            Response.Redirect("Login.aspx");
    }
}