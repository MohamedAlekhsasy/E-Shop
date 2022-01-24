<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="removeOffer.aspx.cs" Inherits="WebApplication1.removeOffer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <asp:Label ID="Label1" runat="server" Text="Offer id: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Remove" OnClick="removeOffers" />




        </div>
    </form>
</body>
</html>
