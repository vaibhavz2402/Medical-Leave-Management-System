<%@ Page Title="" Language="C#" MasterPageFile="~/empMaster.master" AutoEventWireup="true" CodeFile="empHome.aspx.cs" Inherits="View_empHome" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Home</title>

    <!-- dependencies -->
    <link rel="stylesheet" href="../Stylesheets/empHome.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    
    <div class="input-validation-error">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>

    <!--- Welcome Card --->
    
    <div class="jumbotron" style="float:left;width:65%">
        <div class="wel"  style="width:100%">
            Welcome, <asp:label ID="txtname" runat="server"></asp:label> !
        </div></div>

        <!---Event Card    ------->
      
        <div class="container-fluid event-card"  >
           
       
                <div style="float:right;width:30%;top:auto;">
                    
                        <div class="wrapper" style="border: 1px solid black">
                            <div class="header">Upcoming Event</div>

                            <div class="banner-img">
                                <img src="../Stock/event.jpg" alt="Image 1" />      
                            </div>

                            <div class="dates">
                                <div class="start">
                                    <strong>STARTS</strong> 12:30 JAN 2015
                               
                                    <span></span>
                                </div>
                                <div class="ends">
                                    <strong>ENDS</strong> 14:30 JAN 2015
                           
                                </div>
                            </div>

                            <div class="stats" runat="server">

                                <div>
                                    <strong>INVITED</strong> 3098
                           
                                </div>

                                <div>
                                    <strong>JOINED</strong> 562
                           
                                </div>

                                <div>
                                    <strong>DECLINED</strong> 182
                           
                                </div>

                            </div>

                            
                        </div>
                    </div>
               
            </div>
        
          
        <!----  Task Cards  ---->
        
        <div class="row w-80" style="float:left;width:70%">
            <div class="col-md-4">
                <div class="card border-info mx-sm-1 p-3">
                    <div class="card border-info shadow text-info p-3 my-card"><i class="fas fa-tasks"></i></div>
                    <div class="text-info text-center mt-3">
                        <h4>Today's Tasks</h4>
                    </div>
                    <div class="text-info text-center mt-2">
                        <h1>234</h1>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-success mx-sm-1 p-3">
                    <div class="card border-success shadow text-success p-3 my-card"><i class="fas fa-exclamation-triangle"></i></div>
                    <div class="text-success text-center mt-3">
                        <h4>Over Due Tasks</h4>
                    </div>
                    <div class="text-success text-center mt-2">
                        <h1>9332</h1>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-danger mx-sm-1 p-3">
                    <div class="card border-danger shadow text-danger p-3 my-card"><i class="fas fa-check-circle"></i></div>
                    <div class="text-danger text-center mt-3">
                        <h4>Completed Tasks</h4>
                    </div>
                    <div class="text-danger text-center mt-2">
                        <h1>346</h1>
                    </div>
                </div>
            </div>

        </div>
</asp:Content>
