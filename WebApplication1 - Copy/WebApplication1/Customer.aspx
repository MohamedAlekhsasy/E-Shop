<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer.aspx.cs" Inherits="WebApplication1.customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="View Products" Height="86px" OnClick="viewProduct" Width="150px" /> 
        
            <asp:Button ID="Button2" runat="server" Text="Create Wishlist" Height="86px" OnClick="create_wishList" Width="150px" /> 
       
            <asp:Button ID="Button3" runat="server" Text="Add Credit Card" Height="86px" OnClick="Add_creditCard" Width="150px" /> 
        <br>
            <asp:Button ID="Button4" runat="server" Text="view my cart" Height="86px" OnClick="viewCart" Width="150px" /> 

            <asp:Button ID="Button5" runat="server" Text="view my orders" Height="86px" OnClick="vieworder" Width="150px" /> 

            <asp:Button ID="Button6" runat="server" Text="Add phone" Height="86px" OnClick="add_phone" Width="150px" /> 

        </div>
    </form>
</body>
</html>
