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
using EILDomain;
using System.Data;
using com.eil.DAL;
using System.Text;
using Resources;


public partial class View_remove_user : System.Web.UI.Page
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
    public int NewEditIndex { get; set; }
    protected void RowDataBound(Object sender, GridViewRowEventArgs e)
    {
        
    }

    private void BindGrid()
    {
        try
        {
            string query = "select USER_ID, NAME,DEPT,EMAIL from TRAINEE01.EMPLOYEEDB ";

   
            DataSet myDataSet = SqlHelper.ExecuteDataset(Resource.ResConnectionString,CommandType.Text, query);
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

    protected void RowEdit(object sender, GridViewEditEventArgs e)
    {
        TableList.EditIndex = e.NewEditIndex;
        this.BindGrid();
    }

    protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        TableList.EditIndex = -1;
        this.BindGrid();
    }

    protected void RowUpdate(object sender, GridViewUpdateEventArgs e)
    {
     
         String Empno = TableList.DataKeys[e.RowIndex].Value.ToString();
        GridViewRow row = (GridViewRow)TableList.Rows[e.RowIndex];
      
        string textName = ((TextBox)TableList.Rows[e.RowIndex].FindControl("txtName_edit")).Text;
        string txtDept = ((TextBox)TableList.Rows[e.RowIndex].FindControl("txtdept_edit")).Text;
        string txtEmail = ((TextBox)TableList.Rows[e.RowIndex].FindControl("txtEmail_edit")).Text;
    
        TableList.EditIndex = -1;


        string update = "UPDATE TRAINEE01.EMPLOYEEDB set NAME = '" + textName + "', DEPT = '" + txtDept + "', EMAIL= '" + txtEmail + "' where USER_ID= '" + Empno + "'";



        int result = SqlHelper.ExecuteNonQuery(Resource.ResConnectionString,CommandType.Text, update);

        BindGrid();



    }
   
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        OracleConnection conn = new OracleConnection(Resource.ResConnectionString);

        try
        {
            GridViewRow row = (GridViewRow)TableList.Rows[e.RowIndex];
            String Empno = TableList.DataKeys[e.RowIndex].Value.ToString();


            string qwe = "Delete FROM EMPLOYEEDB where USER_ID= '"+Empno+"' ";
          
            SqlHelper.ExecuteNonQuery(Resource.ResConnectionString.ToString(), CommandType.Text, qwe);



            BindGrid();

     

        }
        catch (Exception ex)
        {
            lblError.Text = "Error:" + ex.Message;
        }
        finally
        {

        }


    }





    protected void TableList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
 