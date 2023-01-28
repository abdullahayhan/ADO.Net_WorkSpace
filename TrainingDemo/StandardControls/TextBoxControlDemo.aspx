<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBoxControlDemo.aspx.cs" Inherits="StandardControls_TextBoxControlDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 39%;
            height: 87px;
            border-color: #808000;
        }
        .auto-style2 {
            width: 202px;
        }
        .auto-style3 {
            width: 202px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_FirstName" runat="server" AutoPostBack="True" MaxLength="20" OnTextChanged="txt_FirstName_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_LastName" runat="server" MaxLength="20"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txt_Pass" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="Confirm Pass"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_Confirm" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="Address"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_adress" runat="server" Height="80px" TextMode="MultiLine" Width="186px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btn_DisplayData" runat="server" OnClick="btn_DisplayData_Click" Text="Display Data" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="txtUserData" runat="server" Height="114px" TextMode="MultiLine" Width="258px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
