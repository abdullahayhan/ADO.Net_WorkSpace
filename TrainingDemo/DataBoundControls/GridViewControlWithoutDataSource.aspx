<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridViewControlWithoutDataSource.aspx.cs" Inherits="DataBoundControls_GridViewControlWithoutDataSource" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeID" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdated="GridView1_RowUpdated" OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="EmployeeID" SortExpression="EmployeeID">
                        <EditItemTemplate>
                            <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Eval("EmployeeID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DepartmantID" SortExpression="DepartmantID">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDepartmantID" runat="server" Text='<%# Bind("DepartmantID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("DepartmantID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
           
            <br />
            <br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
           
        </div>
    </form>
</body>
</html>
