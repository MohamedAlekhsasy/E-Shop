<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activateVendor.aspx.cs" Inherits="WebApplication1.activateVendor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:Label ID="Label1" runat="server" Text="Vendor Name: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Activate" OnClick="active" />
        </div>
    </form>
</body>
</html>
