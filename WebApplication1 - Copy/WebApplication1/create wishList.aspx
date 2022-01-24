<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="create wishList.aspx.cs" Inherits="WebApplication1.create_wishList" %>

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
            <asp:Button ID="Create" runat="server" Text="Create" OnClick="create" />

            
<br>
            <asp:Button ID="Butt" runat="server" Text="Home"  OnClick="home"/>
        </div>
    </form>
</body>
</html>
