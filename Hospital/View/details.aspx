<%@ Page Title="" Language="C#" MasterPageFile="~/empMaster.master" AutoEventWireup="true" CodeFile="details.aspx.cs" Inherits="View_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Details</title>
    <link rel="stylesheet" href="../Stylesheets/details.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="cover" runat="server">
         <div class="input-validation-error">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>
        <div class="input-01">Name:  <asp:label ID="txtname" runat="server"></asp:label> </div> 

        <div class="input-01">Employee Number: <asp:label ID="empNo" runat="server"></asp:label> </div>

        <div class="input-01">Department: <asp:label ID="empDept" runat="server"></asp:label> </div>

         <div class="input-01">Phone Number: <asp:label ID="empMobile" runat="server"></asp:label> </div>

         <div class="input-01">Address: <asp:label ID="empAddress" runat="server"></asp:label> </div>

         <div class="input-01">Email: <asp:label ID="empEmail" runat="server"></asp:label> </div>



    </div>

</asp:Content>
