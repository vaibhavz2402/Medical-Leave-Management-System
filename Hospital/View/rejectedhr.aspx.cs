using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using supporting.folder;
using System.Data.OracleClient;
using System.Net.Mail;
using EILDomain;
using System.Data;
using com.eil.DAL;
using System.Text;
using Resources;

public partial class View_rejectedhr : System.Web.UI.Page
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
            string query = "select EMPNO ,MEDICAL_CONDITION, HOSPITAL from TRAINEE01.HR where FLAG='N'";


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
}