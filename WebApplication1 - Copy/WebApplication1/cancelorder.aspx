<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cancelorder.aspx.cs" Inherits="WebApplication1.cancelorder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="Label1" runat="server" Text="Enter id of order    "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br/>
            <asp:Button ID="Button1" runat="server" Text="Cancel order" OnClick="cancel" />
            <br>
            <asp:Button ID="Butt" runat="server" Text="Home"  Width="90px" OnClick="home"/>

        </div>
    </form>
</body>
</html>
