<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RadioAndCheckBoxButtonDemo.aspx.cs" Inherits="StandardControls_RadioAndCheckBoxButtonDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <h2> 
               <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label><br />
           </h2>
            <asp:RadioButton ID="radioMale" Text="Male" GroupName="Gender" runat="server" /><br />
            <asp:RadioButton ID="radioFemale" Text="Female" GroupName="Gender" runat="server" /><br />


           <h2> 
               <asp:Label ID="lblHobbies" runat="server" Text="Hobbies"></asp:Label><br />
           </h2>
            <asp:CheckBox ID="chkCricket" Text="Cricket" runat="server" /> <br />
            <asp:CheckBox ID="chkSinging" Text="Singing" runat="server" /><br />
            <asp:CheckBox ID="chkActing" Text="Acting" runat="server" /><br />
            <asp:CheckBox ID="chkDancing" Text="Dancing" runat="server" />
        </div>
        <p>
            <asp:Button ID="btnDisplay" runat="server" Height="28px" OnClick="btnDisplay_Click" Text="Display Selected Values" Width="158px" />
        </p>


        <p>
            <asp:Label ID="lblDisplaySelected" runat="server" Text="Label"></asp:Label>
        </p>


    </form>
</body>
</html>
