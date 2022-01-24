<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
    
 
    <asp:Label ID="lbl_username" runat="server" Text="Username: "></asp:Label>
    
        <asp:TextBox ID="txt_username" runat="server"></asp:TextBox>
    
        <br />
    
        <br />
        <asp:Label ID="lbl_password" runat="server" Text="Password: "></asp:Label>
        <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />
    
        <br />
        <asp:Button ID="btn_login" runat="server" Text="Login" onclick="userlogin" Width="90px"/>
        &nbsp;</div>
    </form>
    <p>
        <a href="Registeration.aspx">I have no account</a></p>
</body>
</html>
