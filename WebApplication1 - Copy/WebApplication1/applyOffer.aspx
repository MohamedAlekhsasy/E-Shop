<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="applyOffer.aspx.cs" Inherits="WebApplication1.applyOffer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <asp:Label ID="Label1" runat="server" Text="offer id:"></asp:Label>                    
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <br />
            <br />

            <asp:Label ID="Label2" runat="server" Text="product serial number:"></asp:Label>                    
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                   <br />
            <br />
            <asp:Button runat="server" Text="apply" OnClick="applyOffers" />
        </div>
        
    </form>
</body>
</html>

