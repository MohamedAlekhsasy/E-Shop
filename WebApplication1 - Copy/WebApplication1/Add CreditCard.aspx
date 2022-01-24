<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add CreditCard.aspx.cs" Inherits="WebApplication1.Add_CreditCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:Label ID="lbl_credit" runat="server" Text="CreditCard Number: "></asp:Label>
    
        <asp:TextBox ID="txt_credit" runat="server"></asp:TextBox>
    
        <br />
    
        <br />
        <asp:Label ID="lbl_expirydate" runat="server" Text="Expiry Date: "></asp:Label>
        <asp:TextBox ID="txt_expirydate" runat="server" ></asp:TextBox>
    
        <br />
    
        <br />
         <asp:Label ID="Label1" runat="server" Text="cvv: "></asp:Label>
        <asp:TextBox ID="txt_cvv" runat="server" ></asp:TextBox>
    
        <br />
    
        <br />

        <asp:Button ID="btn_Add" runat="server" Text="Add" onclick="Add" Width="90px"/>
            <br>
            <asp:Button ID="Butt" runat="server" Text="Home"  Width="90px" OnClick="home"/>
        </div>
    </form>
</body>
</html>
