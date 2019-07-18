<%@ Page Title="ADMIN" Language="C#" MasterPageFile="~/adminMaster.master" AutoEventWireup="true" CodeFile="admin_control.aspx.cs" Inherits="View_apply" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Admin</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" />
    <link rel="stylesheet" href="admin_control.css" />
   
     <script>
        document.getElementById('<%=lblError.ClientID%>').value = "";
        document.getElementById('<%=txtEmpno.ClientID%>').disabled = false;
        document.getElementById('<%=txtName.ClientID%>').disabled = false;
        document.getElementById('<%=txtPhone.ClientID%>').disabled = false;
        document.getElementById('<%=txtEmail.ClientID%>').disabled = false;
        document.getElementById('<%=txtAddress.ClientID%>').disabled = false;
        document.getElementById('<%=txtDept.ClientID%>').disabled = false;
        document.getElementById('<%=txtPassword.ClientID%>').disabled = false;
        document.getElementById('<%=submitbtn.ClientID%>').disabled = false;

    </script>



  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Form -->

    <div class="container edit" runat="server">
        <div class="col-md-5" runat="server">
            <div class="form-area" runat="server">
                <form name="form1" runat="server" class="form-01">
                    <br style="clear: both" />
                    <h3 style="margin-bottom: 25px; text-align: center;">Admin Form</h3>
                    <div class="form-group">
                      <span class="fontawesome" ><i class="fas fa-id-card"></i></span><label class="size"> Employee No.</label><asp:TextBox ID="txtEmpno"  runat="server" Cssclass="input-01"></asp:TextBox>
                    
                    </div>
                    <div class="form-group">
                     <span class="fontawesome"><span><i class="fas fa-user"></i></span></span><label class="size"> Name</label><asp:TextBox ID="txtName"  runat="server" Cssclass="input-01"></asp:TextBox>

                    </div>
                    <div class="form-group">
                       <span class="fontawesome"><i class="fas fa-phone"></i></span><label class="size"> Phone No.</label> <asp:TextBox ID="txtPhone" TextMode="Phone"  runat="server" Cssclass="input-01"></asp:TextBox>

                    </div>
                    <div class="form-group">
                     <span class="fontawesome"><i class="fas fa-envelope"></i></span> <label class="size">E-mail</label><asp:TextBox ID="txtEmail"  runat="server" Cssclass="input-01"></asp:TextBox>

                     </div>
                    <div class="form-group">
                       <span class="fontawesome"><i class="fas fa-key"></i></span><label class="size"> Password</label> <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Cssclass="input-01"></asp:TextBox>
                    
                    </div>
                    <div class="form-group">
                      <span class="fontawesome"><i class="fas fa-address-card"></i></span> <label class="size"> Address</label><asp:TextBox ID="txtAddress" runat="server" Cssclass="input-01"></asp:TextBox>

                    </div>
                    <div class="form-group">
                     <span class="fontawesome"><i class="fas fa-users"></i></span><label class="size"> Department</label><asp:TextBox ID="txtDept"  runat="server" Cssclass="input-01"></asp:TextBox>

                    </div>
                
                    <asp:Button ID="submitbtn" runat="server" Text="Submit Form" CssClass="btn btn-primary " OnClick="Submit_Click" />
                   
                     <div class="input-validation-error">
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </div>

                </form>
            </div>
        </div>
    </div>

</asp:Content>
