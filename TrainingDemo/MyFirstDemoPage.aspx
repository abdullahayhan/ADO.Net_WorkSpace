<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyFirstDemoPage.aspx.cs" Inherits="MyFirstDemoPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 21px; width: 47px">
            <asp:Label ID="Label1" runat="server" Text="Buton"></asp:Label>
        </div>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Today Date Time and time"></asp:Label>
        </p>
        <asp:Label ID="lblDateTimeNow" runat="server"></asp:Label>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Check Control Event" />
        </p>
    </form>
</body>
</html>
