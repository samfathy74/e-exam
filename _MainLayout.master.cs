using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _MainLayout : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public Image imgprofile 
    {
        get { return this.ImageProfile; }
    }

    public Label lblusername
    {
        get { return this.lbluser; }
    }

    public LinkButton logout
    {
        get { return this.linklogout; }
    }

    public LinkButton signup
    {
        get { return this.linksignup; }
    }

    public LinkButton login
    {
        get { return this.linklogin; }
    }

    public LinkButton home
    {
        get { return this.LinkHome; }
    }

    public ImageButton Imgfeed
    {
        get { return this.ImgFeedback; }
    }

    public ImageButton Imgabout
    {
        get { return this.ImgAbout; }
    }


    protected void linklogout_Click(object sender, EventArgs e)
    {
        Session["Name"] = null; //kill session
        Session.Abandon();
        //  Session.Clear();
        FormsAuthentication.SignOut();

        Session.RemoveAll();
        HttpContext.Current.Session.Abandon();
        Response.Redirect("Login.aspx");

        
    }
}