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


public partial class View_apply : System.Web.UI.Page
{
    public string tmpStr;

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
    public bool IsValid(string emailaddress)
    {
        try
        {
            MailAddress m = new MailAddress(emailaddress);

            return true;
        }
        catch (FormatException)
        {
            return false;
        }
    }


    protected void Submit_Click(object sender, EventArgs e)
    {

        if (txtEmpno.Text == "" || txtName.Text == "" || txtPhone.Text == "" || txtEmail.Text == "" || txtAddress.Text == "" || txtDept.Text == ""  )
        {
            lblError.Text = "All fields are required";
        }
        else if(!IsValid(txtEmail.Text))
        {
            lblError.Text = "Enter Correct Email Address";
        }
        else if (txtPhone.Text.Length  != 10)
        {
            lblError.Text = "Enter Valid Phone Number";
        }
        else
        {
            try
            {
                insertUser(txtName.Text.ToString(), txtPhone.Text.ToString(), txtEmail.Text.ToString(), txtAddress.Text.ToString(), txtDept.Text.ToString().ToUpper() , txtEmpno.Text.ToString(), txtPassword.Text.ToString());
                 
               
            }
            catch(Exception ex){
                lblError.Text = "Error:" + ex.Message.ToString();
            }
        }

    }
   
    protected bool boolExistsUserPackage(string txtEmpno)
    {
        bool bExists = false;
        string sql = "select Count(user_id) from TRAINEE01.EMPLOYEEDB where user_id='" + txtEmpno + "' and flag='Y'";

        DataSet dsconn = new DataSet();
        dsconn = SqlHelper.ExecuteDataset(Resource.ResConnectionString, CommandType.Text, sql);
        int intEmpStatus = int.Parse(dsconn.Tables[0].Rows[0][0].ToString());
        if (intEmpStatus >= 1)
        {
            bExists = true;
        }

        return bExists;
    }

    
    protected void insertUser(string txtName, string txtPhone, string txtEmail, string txtAddress, string txtDept, string txtEmpno, string txtPassword)
    {
        if (! boolExistsUserPackage(txtEmpno))
        {
            tmpStr = "";
            tmpStr = tmpStr + " insert into TRAINEE01.EMPLOYEEDB(NAME, PHONE, EMAIL, ADDRESS, DEPT, USER_ID, PASSWORD) values( '" + txtName + "', '" + txtPhone + "', '" + txtEmail + "', '" + txtAddress + "', '" + txtDept + "','" + txtEmpno + "', '" + txtPassword + "')";

            

            int res =SqlHelper.ExecuteNonQuery(Resource.ResConnectionString,CommandType.Text, tmpStr.ToString());

            if (res <= 0)
            {
                lblError.Text = "Error in data updation. ";
            }
            else
            {
                lblError.Text = "Data Updation Successful.";
            }
            
            // refreshGrid();
        }
        else
        {
            lblError.Text = "User Already Exist";
        }
    }
   
}
