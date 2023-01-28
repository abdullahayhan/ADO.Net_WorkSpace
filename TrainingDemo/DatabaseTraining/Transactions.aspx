<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Transactions.aspx.cs" Inherits="DatabaseTraining_Transactions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <br />
            <br />
            <asp:Label ID="lblTransferForm" runat="server" Text="Transfer Form :"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlTrasferFrom" runat="server" DataSourceID="SqlDataSourceBankCustomer" DataTextField="CustomerName" DataValueField="CustomerID" AppendDataBoundItems="True">
            <asp:ListItem Value="0">Select</asp:ListItem>
        </asp:DropDownList>

        <asp:SqlDataSource ID="SqlDataSourceBankCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:ASPTrainingConnectionString %>" SelectCommand="SELECT [CustomerID], [CustomerName] FROM [BankCustomer]"></asp:SqlDataSource>
        <br />
        <br />


            <asp:Label ID="lblTransferTo" runat="server" Text="Transfer To : "></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlTrasferTo" runat="server" DataSourceID="SqlDataSourceBankCustomer" DataTextField="CustomerName" DataValueField="CustomerID" AppendDataBoundItems="True">
            <asp:ListItem Value="0">Select</asp:ListItem>
        </asp:DropDownList>
             
            <br />
             
            <br />
            <asp:Label ID="lblTransferAmount" runat="server" Text="Amount to Transfer : "></asp:Label>
            <asp:TextBox ID="txtTransferAmount" runat="server" Height="16px" Width="121px"></asp:TextBox>

            <br />
            <br />

            <asp:Button ID="btnStartTransaction" runat="server" Text="Start Transaction" OnClick="btnStartTransaction_Click" />
            <br />
            <br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
