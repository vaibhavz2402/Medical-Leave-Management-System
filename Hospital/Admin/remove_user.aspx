<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.master" AutoEventWireup="true" CodeFile="remove_user.aspx.cs" Inherits="View_remove_user" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Due Requests</title>

    <script>
        document.getElementById('<%=lblError.ClientID%>').value = "";
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" style="height: 198px">

        <div class="input-validation-error">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>
        <div class="panel-body">
            <asp:GridView ID="TableList" CssClass="table table-condensed table-bordered table-hover" DataKeyNames="USER_ID"
                AutoGenerateColumns="false" runat="server" OnRowEditing="RowEdit" OnRowDataBound="RowDataBound" OnRowDeleting="GridView1_RowDeleting"
                OnRowUpdating="RowUpdate" OnRowCancelingEdit="CancelEdit" Width="1223px" Height="173px" OnSelectedIndexChanged="TableList_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <asp:Label ID="lblSrnoGrid" runat="server" Text='<%# Container.DataItemIndex + 1 %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Empno">
                            <ItemTemplate>
                                <asp:Label ID="lblEmpno" runat="server" Text='<%# Bind("USER_ID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Textbox ID="lblEmpno_edit" runat="server" Text='<%# Bind("USER_ID") %>'> </asp:Textbox> 
                            </EditItemTemplate> 
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="txtName" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                             </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Textbox ID="txtName_edit" runat="server" Text='<%# Bind("NAME") %>'> </asp:Textbox> 
                            </EditItemTemplate> 
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DEPT">
                            <ItemTemplate>
                                <asp:Label ID="txtdept" runat="server" Text='<%# Bind("DEPT") %>'></asp:Label>
                             </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Textbox ID="txtdept_edit" runat="server" Text='<%# Bind("DEPT") %>'> </asp:Textbox> 
                            </EditItemTemplate> 
                        </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                             </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Textbox ID="txtEmail_edit" runat="server" Text='<%# Bind("Email") %>'> </asp:Textbox> 
                            </EditItemTemplate> 
                        </asp:TemplateField>
                    

                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>

    </form>


</asp:Content>

