<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="WebApplication1.payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
               <p> <asp:Label ID="Label1" runat="server" Text="Order Id   " ></asp:Label>

            <asp:TextBox ID="TextBox1" required="required" runat="server"></asp:TextBox></p>
             
            <p> <asp:Label ID="Label5" runat="server" Text="Cash Amount  " ></asp:Label>

            <asp:TextBox ID="TextBox2" required="required" runat="server"></asp:TextBox></p>
            <p> 
            <asp:Label ID="Label2" runat="server" Text="Credit Amount  "></asp:Label>
            <asp:TextBox ID="TextBox3" required="required" runat="server"></asp:TextBox></p>
            
            <asp:Button ID="Button1" runat="server" Text="OK" OnClick="pay" />

            <br>
            <asp:Button ID="Butt" runat="server" Text="Home"  OnClick="home"/>


        </div>
    </form>
</body>
</html>
