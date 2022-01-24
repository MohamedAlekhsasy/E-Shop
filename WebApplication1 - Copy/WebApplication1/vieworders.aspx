<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vieworders.aspx.cs" Inherits="WebApplication1.vieworders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <asp:Button ID="Button1" runat="server" Text="Cancel Order" OnClick="cancelorder" Width="180px" />
            <br>
            <asp:Button ID="Button2" runat="server" Text="ChooseCreditCard" Width="180px" OnClick="choose_credit" />
            <br>
            <asp:Button ID="Button3" runat="server" Text="Payment method" Width="180px" OnClick="payment" />
            <br>
            <asp:Button ID="Butt" runat="server" Text="Home"  Width="180px"  OnClick="home"/>

        </div>
    </form>
</body>
</html>
