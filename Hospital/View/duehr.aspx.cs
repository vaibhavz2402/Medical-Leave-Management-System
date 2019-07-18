using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.OracleClient;
using supporting.folder;
using System.Net.Mail;
using supporting.folder;
using EILDomain;
using System.Data;
using com.eil.DAL;
using System.Text;
using Resources;

public partial class View_duehr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (!IsPostBack)
            {
                BindGrid();
            }

        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message.ToString();
        }

    }

    private void BindGrid()
    {
        try
        {
            string query = "select EMPNO,MEDICAL_CONDITION,HOSPITAL from TRAINEE01.HR where FLAG IS NULL";


            DataSet myDataSet = SqlHelper.ExecuteDataset(Resource.ResConnectionString, CommandType.Text, query);
            if (myDataSet.Tables[0].Rows.Count > 0)
            {
                TableList.DataSource = myDataSet;
                TableList.DataBind();
            }
            else
            {
                myDataSet.Tables[0].Rows.Add(myDataSet.Tables[0].NewRow());
                TableList.DataSource = myDataSet;
                TableList.DataBind();

            }
        }
        catch (Exception)
        {
            throw;
        }

    }

    protected void BindGrid(object sender, EventArgs e)
    {
        BindGrid();
    }


    protected void Verify(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Accept")
        {
            GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            String Empno = ((Label)gvr.FindControl("lblEmpno")).Text;

  
            string update = "UPDATE TRAINEE01.HR set FLAG ='Y' where EMPNO='" + Empno + "'";

            int result = SqlHelper.ExecuteNonQuery(Resource.ResConnectionString, CommandType.Text, update);
            BindGrid();
        }

   else if (e.CommandName == "Reject") 
        {
        
            GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            String Empno = ((Label)gvr.FindControl("lblEmpno")).Text;


            string update = "UPDATE TRAINEE01.HR set FLAG ='N' where EMPNO='" + Empno + "'";

            int result = SqlHelper.ExecuteNonQuery(Resource.ResConnectionString, CommandType.Text, update);
            BindGrid();

    }
    
}
}