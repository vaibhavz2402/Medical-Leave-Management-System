<%@ Page Title="" Language="C#" MasterPageFile="~/empMaster.master" AutoEventWireup="true" CodeFile="apply.aspx.cs" Inherits="View_apply" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Apply</title>
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../Stylesheets/apply.css" />

    <style>
        .edit {
            margin-top: 50px;
        }
    </style>
     <script>
         document.getElementById('<%=lblError.ClientID%>').value = "";
         document.getElementById('<%=txtEmpno.ClientID%>').disabled = false;
         document.getElementById('<%=txtName.ClientID%>').disabled = false;
         document.getElementById('<%=txtPhone.ClientID%>').disabled = false;
         document.getElementById('<%=txtEmail.ClientID%>').disabled = false;
         document.getElementById('<%=txtMedical.ClientID%>').disabled = false;
         document.getElementById('<%=txtHospital.ClientID%>').disabled = false;
         document.getElementById('<%=txtRelation.ClientID%>').disabled = false;
         document.getElementById('<%=submitbtn.ClientID%>').disabled = false;

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

    <div class="container edit" runat="server">
        <div class="col-md-5" runat="server">
            <div class="form-area" runat="server">
                <form name="form1" runat="server" class="form-01">
                    <br style="clear: both" />
                    <h3 style="margin-bottom: 25px; text-align: center;">Medical Leave Form</h3>
                    <div class="form-group">
                        <span class="fontawesome"><i class="fas fa-id-card"></i></span>
                        <label class="size">Employee No.</label><asp:TextBox ID="txtEmpno" runat="server" CssClass="input-01"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <span class="fontawesome"><span><i class="fas fa-user"></i></span></span>
                        <label class="size">Name</label><asp:TextBox ID="txtName" runat="server" CssClass="input-01"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <span class="fontawesome"><i class="fas fa-phone"></i></span>
                        <label class="size">Phone No.</label>
                        <asp:TextBox ID="txtPhone" TextMode="Phone" runat="server" CssClass="input-01"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <span class="fontawesome"><i class="fas fa-envelope"></i></span>
                        <label class="size">E-mail</label><asp:TextBox ID="txtEmail" runat="server" CssClass="input-01"></asp:TextBox>

                    </div>



                    <div class="form-group">
                        <span class="fontawesome"><i class="fas fa-users"></i></span>
                        <label class="size">Medical Condition</label><asp:TextBox ID="txtMedical" runat="server" CssClass="input-01"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <span class="fontawesome"><i class="fas fa-users"></i></span>
                        <label class="size">Hospital</label><asp:TextBox ID="txtHospital" runat="server" CssClass="input-01"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <span class="fontawesome"><i class="fas fa-address-card"></i></span>
                        <label class="size">Relation</label><asp:TextBox ID="txtRelation" runat="server" CssClass="input-01"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <div class='input-group date'>
                            <input id="datepicker" placeholder="Start Date" runat="server" />

                        </div>
                    </div>

                    <div class="form-group">
                        <div class='input-group date'>
                            <input id="datepicker1" placeholder="End Date" runat="server" />

                        </div>
                    </div>
                   
                      <!-- jQuery -->
    <script>

        $('#datepicker').datepicker({
            uiLibrary: 'bootstrap4'
        });


        $('#datepicker1').datepicker({
            uiLibrary: 'bootstrap4'
        });


        $(document).ready(function () {
            $('#apply').click(function (e) {

                var datepicker = $('#datepicker').val();
                var datepicker1 = $('#datepicker1').val();

                var email_regex = /^[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+.[a-zA-z0-9]{2,4}$/;


                //if (medical == '' || hospital == '' || datepicker == '' || datepicker1 == '') {
                //    alert("Please Complete all the fields")
                //    return false;
                //}
                //else if (!email.match(email_regex) || email.length == 0) {
                //    alert("* Please enter a valid email address *");
                //    return false;
                //}
                //else if (mobile.length < 10 || mobile.length > 10) {
                //    alert("Phone No. Length should be equal than 10 digits");
                //    return false;
                //}

                //else {
                //    alert("Form Submitted Successfuly!");
                //    return true;
                //}
            });
        });


    </script>

                    <asp:Button ID="submitbtn" runat="server" Text="Submit Form" CssClass="btn btn-primary " OnClick="Submit_Click" />




                    <div class="input-validation-error">
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </div>

                </form>
            </div>
        </div>
    </div>


    <!-- jQuery -->
    <script>

        $('#datepicker').datepicker({
            uiLibrary: 'bootstrap4'
        });


        $('#datepicker1').datepicker({
            uiLibrary: 'bootstrap4'
        });


        $(document).ready(function () {
            $('#apply').click(function (e) {

                var email = $('#email').val();
                var mobile = $('#mobile').val();
                var medical = $('#medical').val();
                var hospital = $('#hospital').val();
                var datepicker = $('#datepicker').val();
                var datepicker1 = $('#datepicker1').val();

                var email_regex = /^[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+.[a-zA-z0-9]{2,4}$/;


                if (medical == '' || hospital == '' || datepicker == '' || datepicker1 == '') {
                    alert("Please Complete all the fields")
                    return false;
                }
                else if (!email.match(email_regex) || email.length == 0) {
                    alert("* Please enter a valid email address *");
                    return false;
                }
                else if (mobile.length < 10 || mobile.length > 10) {
                    alert("Phone No. Length should be equal than 10 digits");
                    return false;
                }

                else {
                    alert("Form Submitted Successfuly!");
                    return true;
                }
            });
        });


    </script>

    
</asp:Content>
