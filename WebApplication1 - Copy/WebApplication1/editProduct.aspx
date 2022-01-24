<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editProduct.aspx.cs" Inherits="WebApplication1.editProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p> <asp:Label ID="Label6" runat="server" Text="serial number: " ></asp:Label>

            <asp:TextBox ID="TextBox6" required="required" runat="server"></asp:TextBox></p>
            <p> <asp:Label ID="Label1" runat="server" Text="product name: " ></asp:Label>

            <asp:TextBox ID="TextBox1" required="required" runat="server"></asp:TextBox></p>
             
            <p> <asp:Label ID="Label5" runat="server" Text="category: " ></asp:Label>

            <asp:TextBox ID="TextBox5" required="required" runat="server"></asp:TextBox></p>
            <p> 
            <asp:Label ID="Label2" runat="server" Text="description: "></asp:Label>
            <asp:TextBox ID="TextBox2" required="required" runat="server"></asp:TextBox></p>
            
            <p> <asp:Label ID="Label3" runat="server" Text="price: "></asp:Label>
            
            <asp:TextBox ID="TextBox3" required="required" runat="server"></asp:TextBox></p>
            
            <p> <asp:Label ID="Label4" runat="server" Text="color: "></asp:Label>
            <asp:TextBox ID="TextBox4" required="required" runat="server"></asp:TextBox></p>
            <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="editProducts" />
        </div>
    </form>
</body>
</html>
