using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class empMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Session.Abandon();
            Response.Redirect("login.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
}
