<%@ Page Title="" Language="C#" MasterPageFile="~/hrMaster.master" AutoEventWireup="true" CodeFile="acceptedhr.aspx.cs" Inherits="View_acceptedhr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title> Due Requests</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form runat="server" style="height: 198px">

        <div class="input-validation-error">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>
        <div class="panel-body">
            <asp:GridView ID="TableList" CssClass="table table-condensed table-bordered table-hover" DataKeyNames="EMPNO"
                AutoGenerateColumns="False" runat="server" Width="1223px" Height="173px">
                <Columns>
                    <asp:TemplateField HeaderText="#">
                        <ItemTemplate>
                            <asp:Label ID="lblSrnoGrid" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Empno">
                        <ItemTemplate>
                            <asp:Label ID="lblEmpno" runat="server" Text='<%# Bind("EMPNO") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="MEDICAL CONDITION">
                        <ItemTemplate>
                            <asp:Label ID="txtName" runat="server" Text='<%# Bind("MEDICAL_CONDITION") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="HOSPITAL">
                        <ItemTemplate>
                            <asp:Label ID="txtdept" runat="server" Text='<%# Bind("HOSPITAL") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     </Columns>
            </asp:GridView>
        </div>

    </form>


</asp:Content>
