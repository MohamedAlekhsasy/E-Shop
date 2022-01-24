<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registeration.aspx.cs" Inherits="WebApplication1.Registeration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            
            <p> <asp:Label ID="Label1" runat="server" Text="FirstName" ></asp:Label>

            <asp:TextBox ID="TextBox1" required="required" runat="server"></asp:TextBox></p>
             
            <p> <asp:Label ID="Label5" runat="server" Text="LastName" ></asp:Label>

            <asp:TextBox ID="TextBox5" required="required" runat="server"></asp:TextBox></p>
            <p> 
            <asp:Label ID="Label2" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="TextBox2" required="required" runat="server"></asp:TextBox></p>
            
            <p> <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
            
            <asp:TextBox ID="TextBox3" required="required" runat="server" TextMode="Password"></asp:TextBox></p>
            
            <p> <asp:Label ID="Label4" runat="server" Text="UseEmail"></asp:Label>
            <asp:TextBox ID="TextBox4" required="required" runat="server"></asp:TextBox></p>
            
            <p><asp:Button ID="Button1" runat="server" Text="Register as a Customer" OnClick="customerRegister" /></p>

            <p> <asp:Label ID="Label6" runat="server" Text="company name: "></asp:Label>
            <asp:TextBox ID="TextBox6" required="required" runat="server"></asp:TextBox></p>

            <p> <asp:Label ID="Label7" runat="server" Text="bank_acc_no "></asp:Label>
            <asp:TextBox ID="TextBox7" required="required" runat="server"></asp:TextBox></p>


            <p><asp:Button ID="Button2" runat="server" Text="Register as a Vendor" OnClick="vendorRegister" /></p>


           
        </div>
    </form>
    
</body>
</html>
