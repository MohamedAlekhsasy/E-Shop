<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="applyDeal.aspx.cs" Inherits="WebApplication1.applyDeal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            <asp:Label ID="Label1" runat="server" Text="Deal id:"></asp:Label>                    
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <br />
            <br />

            <asp:Label ID="Label2" runat="server" Text="product serial number:"></asp:Label>                    
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                   <br />
            <br />
            <asp:Button runat="server" Text="apply" OnClick="applyDeals" />
        </div>
    </form>
</body>
</html>
