using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using EILDomain;
using com.eil.DAL;
using System.Text;
using Resources;
using supporting.folder;
using System.Data.OracleClient;
using System.Data;

public partial class View_login : System.Web.UI.Page
{

 

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
  
            if (!IsPostBack)
            {

            }

        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message.ToString();
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtLoginID.Text == "")
        {
            lblError.Text = "Please enter USER ID";
        }
        else if (String.IsNullOrEmpty(txtPassword.Text))
        {
            lblError.Text = "Please enter password";
        }
        else
        {
            try
            {

                string sql = "select Count(user_id) from TRAINEE01.EMPLOYEEDB where user_id= '" + txtLoginID.Text.ToUpper() + "'";
              
            
                DataSet dsconn = new DataSet();
                dsconn = SqlHelper.ExecuteDataset(Resource.ResConnectionString, CommandType.Text, sql);

                int intEmpStatus = int.Parse(dsconn.Tables[0].Rows[0][0].ToString());

                if (intEmpStatus == 1)
                {
                    Session["sUserId"] = txtLoginID.Text.ToUpper();

                    string pass = "select Count(user_id) from TRAINEE01.EMPLOYEEDB where user_id=  '" + txtLoginID.Text.ToString().ToUpper() + "' and password=  '" + txtPassword.Text.ToString() + "'    ";
                  
                     dsconn = SqlHelper.ExecuteDataset(Resource.ResConnectionString, CommandType.Text, pass);

                     int intEmpPass = int.Parse(dsconn.Tables[0].Rows[0][0].ToString());
                     if (intEmpPass >=1 )
                     {
                         string status = "select DEPT from TRAINEE01.EMPLOYEEDB where user_id= '" + txtLoginID.Text.ToString().ToUpper() + "'";

                         string value = Convert.ToString(SqlHelper.ExecuteScalar(Resource.ResConnectionString, CommandType.Text, status));
                         
                         if(value == "ADMIN")
                         {
                             Response.Redirect("../Admin/admin_control.aspx");
                         }
                         else if(value == "HR")
                         {
                             Response.Redirect("duehr.aspx");
                         }
                         else
                         {
                             Response.Redirect("empHome.aspx");
                         }
                     }
                     else
                     {
                         lblError.Text = "Incorrect Password";
                     }


                }
                else
                {
                    lblError.Text = "Invalid User ID";
                }

            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }     
        }
    }
    
    private string Upper(string p)
    {
        throw new NotImplementedException();
    }
    
   
}
