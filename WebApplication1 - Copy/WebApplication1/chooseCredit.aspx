<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chooseCredit.aspx.cs" Inherits="WebApplication1.chooseCredit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p> <asp:Label ID="Label1" runat="server" Text="credit card  " ></asp:Label>

            <asp:TextBox ID="TextBox1" required="required" runat="server"></asp:TextBox></p>
             
            <p> <asp:Label ID="Label2" runat="server" Text="Order Id  " ></asp:Label>

            <asp:TextBox ID="TextBox2" required="required" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox></p>
            <asp:Button ID="Button1" runat="server" Text="OK" OnClick="choose" />

            
<br>
            <asp:Button ID="Butt" runat="server" Text="Home" OnClick="home" style="height: 29px"/>

        </div>
    </form>
</body>
</html>
