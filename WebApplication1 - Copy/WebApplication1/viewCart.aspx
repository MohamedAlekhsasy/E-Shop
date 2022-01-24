<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewCart.aspx.cs" Inherits="WebApplication1.viewCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView2" runat="server"></asp:GridView>
            <asp:Button ID="Button1" runat="server" Text="make order" OnClick="make_order" />
            <br>
            <asp:Button ID="Butt" runat="server" Text="Home"  OnClick="home" Width="126px"/>

        </div>
    </form>
</body>
</html>
