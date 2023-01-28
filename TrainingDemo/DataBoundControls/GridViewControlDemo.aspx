<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridViewControlDemo.aspx.cs" Inherits="DataBoundControls_GridViewControlDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" Height="133px" Width="321px">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" ReadOnly="True" SortExpression="EmployeeID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="DepartmantID" HeaderText="DepartmantID" SortExpression="DepartmantID" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ASPTrainingConnectionString %>" 
                DeleteCommand="DELETE FROM [Employee] WHERE [EmployeeID] = @EmployeeID" 
                InsertCommand="INSERT INTO [Employee] ([EmployeeID], [FirstName], [LastName], [DepartmantID]) VALUES (@EmployeeID, @FirstName, @LastName, @DepartmantID)" 
                SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [DepartmantID] FROM [Employee]" 
                UpdateCommand="UPDATE [Employee] SET [FirstName] = @FirstName, [LastName] = @LastName, [DepartmantID] = @DepartmantID WHERE [EmployeeID] = @EmployeeID">
                <DeleteParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="DepartmantID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="DepartmantID" Type="Int32" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:Label ID="lblID" runat="server" Text="Employee ID : "></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblFirstName" runat="server" Text="First Name : "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblLastName" runat="server" Text="Last Name : "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblDepartmanID" runat="server" Text="Departman ID : "></asp:Label>
&nbsp;<asp:TextBox ID="txtDepartmanID" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnInsertEmp" runat="server" Height="28px" OnClick="btnInsertEmp_Click" Text="Insert" Width="92px" />
        </div>
    </form>
</body>
</html>
