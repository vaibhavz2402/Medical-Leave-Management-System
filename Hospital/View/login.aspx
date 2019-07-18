<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="View_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    document.getElementById('<%=lblError.ClientID%>').value = "";
    document.getElementById('<%=txtLoginID.ClientID%>').disabled = false;
    document.getElementById('<%=txtPassword.ClientID%>').disabled = false;
    document.getElementById('<%=btnLogin.ClientID%>').disabled = false;
</script>

<head runat="server">

    <title>LOGIN</title>
    <link rel="stylesheet" href="../Stylesheets/login.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" />
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../JQuery/validation.js"></script>

</head>


<body>

    <form name="form1" runat="server" class="form-01">

        <div class="header">
            <h2>Account Login</h2>
        </div>
        <div class="input-validation-error">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>
        <div>
            <span class="fontawesome"><i class="fas fa-user"></i></span>
            <asp:TextBox ID="txtLoginID" runat="server" CssClass="input-01" placeholder="Email"></asp:TextBox>


            <span class="fontawesome"><i class="fas fa-key"></i></span>
            <asp:TextBox ID="txtPassword" placeholder="Password" CssClass="input-01" runat="server" TextMode="Password"></asp:TextBox>

            <div class="check-wrap">
                <input type="checkbox" class="checkbox" />
                <label for="checkbox">Remember Me</label>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="LOGIN" OnClick="btnLogin_Click" />

        </div>
    </form>

</body>

</html>
