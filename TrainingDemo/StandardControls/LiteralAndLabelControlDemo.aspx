<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LiteralAndLabelControlDemo.aspx.cs" Inherits="StandardControls_LiteralAndLabelControlDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblName" runat="server" Text="&lt;h1&gt;Learners Point&lt;h1&gt;" style="font-family:Arial"></asp:Label>
            
            <br />
            <br />
            
            <asp:Literal ID="literalName" runat="server">Learners Point</asp:Literal>
        </div>
    </form>
</body>
</html>
