using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.OracleClient;
using System.Net.Mail;
using supporting.folder;
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



    protected void insertUser(string txtEmpno, string txtName, string txtPhone, string txtEmail, string txtMedical, string txtHospital, string txtRelation)
    {

        tmpStr = "";
        tmpStr = tmpStr + " insert into TRAINEE01.HR(EMPNO, NAME, PHONE, EMAIL,MEDICAL_CONDITION,HOSPITAL, RELATION ) values('" + txtEmpno + "' , '" + txtName + "', '" + txtPhone + "' , '" + txtEmail + "' ,'" + txtMedical + "' , '" + txtHospital + "', '" + txtRelation + "')";

        int res = SqlHelper.ExecuteNonQuery(Resource.ResConnectionString, CommandType.Text, tmpStr.ToString());



        if (res <= 0)
        {
            lblError.Text = "Error in data updation. ";
        }
        else
        {
            lblError.Text = "Data Updation Successful.";
        }
    }
    protected void Submit_Click(object sender, EventArgs e)
    {

        if (txtEmpno.Text == "" || txtName.Text == "" || txtPhone.Text == "" || txtEmail.Text == "" || txtMedical.Text == "" || txtHospital.Text == "" || txtRelation.Text =="")
        {
            lblError.Text = "All fields are required";
        }
        else if (!IsValid(txtEmail.Text))
        {
            lblError.Text = "Enter Correct Email Address";
        }
        else if (txtPhone.Text.Length != 10)
        {
            lblError.Text = "Enter Valid Phone Number";
        }
        else
        {
            try
            {
                insertUser(txtEmpno.Text.ToString(),txtName.Text.ToString(), txtPhone.Text.ToString(), txtEmail.Text.ToString(), txtMedical.Text.ToString(), txtHospital.Text.ToString().ToUpper(), txtRelation.Text.ToString());


            }
            catch (Exception ex)
            {
                lblError.Text = "Error:" + ex.Message.ToString();
            }
        }

    }
   
   
    
}
