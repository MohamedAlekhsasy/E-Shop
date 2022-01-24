<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addnum.aspx.cs" Inherits="WebApplication1.addnum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Enter your phone number   "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br/>
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="AddPhone" Width="60px" />

          
        </div>
    </form>
</body>
</html>
