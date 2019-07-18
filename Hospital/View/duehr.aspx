<%@ Page Title="" Language="C#" MasterPageFile="~/hrMaster.master" AutoEventWireup="true" CodeFile="duehr.aspx.cs" Inherits="View_duehr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <form runat="server" style="height: 198px">

        <div class="input-validation-error">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>
        <div class="panel-body">
            <asp:GridView ID="TableList" CssClass="table table-condensed table-bordered table-hover" DataKeyNames="EMPNO"
                AutoGenerateColumns="False" runat="server" OnRowCommand="Verify" Width="1223px" Height="173px">
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

                    <asp:TemplateField HeaderText="MEDICINES">
                        <ItemTemplate>
                            <asp:Label ID="txtdept" runat="server" Text='<%# Bind("HOSPITAL") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>



                    <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="linkBtnAccept" runat="server"
                                    CausesValidation="False" CommandName="Accept"
                                    Text="Accept"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField >
                            <ItemTemplate>
                                <asp:LinkButton ID="linkBtnEditReject" runat="server"
                                    CausesValidation="False" CommandName="Reject" 
                                    Text="Reject"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                     </Columns>
            </asp:GridView>
        </div>

    </form>


</asp:Content>






















               
