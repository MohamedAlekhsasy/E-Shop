<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add to wishList.aspx.cs" Inherits="WebApplication1.Customer.add_to_wishList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Enter name of wish list    "></asp:Label>
            <asp:TextBox ID="wishName" runat="server"></asp:TextBox>
            <br/>
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="AddToCart" Width="60px" />

            <br>
            <asp:Button ID="Button1" runat="server" Text="Home"  Width="60px" OnClick="home"/>
        </div>
    </form>
</body>
</html>
