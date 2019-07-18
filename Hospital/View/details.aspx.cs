using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using EILDomain;
using supporting.folder;
using com.eil.DAL;
using System.Text;
using Resources;
using System.Data.OracleClient;
using System.Data;

public partial class View_details : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
           string pempno = Convert.ToString(Session["sUserId"]);
           
            if (!string.IsNullOrEmpty(pempno))
            {
             
            
            string sql = "select * from TRAINEE01.EMPLOYEEDB where user_id= '" + Session["sUserId"] + "'";
                   
                DataSet dsconn = new DataSet();
                dsconn = SqlHelper.ExecuteDataset(Resource.ResConnectionString, CommandType.Text, sql);

                empNo.Text = Convert.ToString(Session["sUserId"]);
                txtname.Text = Convert.ToString(dsconn.Tables[0].Rows[0]["NAME"].ToString());
                empDept.Text = Convert.ToString(dsconn.Tables[0].Rows[0]["DEPT"].ToString());
                empMobile.Text = Convert.ToString(dsconn.Tables[0].Rows[0]["PHONE"].ToString());
                empAddress.Text= Convert.ToString(dsconn.Tables[0].Rows[0]["ADDRESS"].ToString());
                empEmail.Text = Convert.ToString(dsconn.Tables[0].Rows[0]["EMAIL"].ToString());
            }
            else
            {
                lblError.Text = "NO USER LOGGED IN";
            }
       }
          catch (Exception ex)
        {
            lblError.Text = ex.Message.ToString();
        }
        
    }
}