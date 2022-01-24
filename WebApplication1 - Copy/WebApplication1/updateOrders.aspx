<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateOrders.aspx.cs" Inherits="WebApplication1.updateOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="order no"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> 
           
            <br />
            <asp:Button ID="Button1" runat="server" Text="update" OnClick ="update"/>
        </div>
    </form>
    
    
</body>
</html>
