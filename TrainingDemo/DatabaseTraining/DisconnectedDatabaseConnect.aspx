<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DisconnectedDatabaseConnect.aspx.cs" Inherits="DatabaseTraining_DisconnectedDatabaseConnect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeID" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeId" ReadOnly="True" SortExpression="EmployeeId" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="First Name" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="Last Name" />
                <asp:BoundField DataField="DepartmantID" HeaderText="DepartmentId" SortExpression="DepartmantID" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnGetData" runat="server" Text="Get Data" OnClick="btnGetData_Click" />
        <br />
       
        <br />
        <asp:Button ID="Button1" runat="server" Text="Update Database" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
