<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApplication1.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Activate Vendors" OnClick="activate" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Update Orders" OnClick="update" />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Review Orders" OnClick="review" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" Text="Create today's Deal" OnClick="create" />
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" Text="Apply today's Deal" OnClick="apply" />
            <br />
            <br />
            <asp:Button ID="Button6" runat="server" Text="Remove Deal" OnClick="remove" />
            <br />
            <br />
             <asp:Button ID="Button7" runat="server" Text="Add phone" OnClick="add_phone" /> 

        </div>
    </form>
</body>
</html>
