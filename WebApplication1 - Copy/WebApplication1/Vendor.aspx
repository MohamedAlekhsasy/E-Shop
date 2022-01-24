<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vendor.aspx.cs" Inherits="WebApplication1.Vendor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Post product"  Width="187 px" OnClick="postProduct" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="View product" onClick ="viewProducts" Width="187 px" />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Edit product" Width="187 px" OnClick="editProduct" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" Text="create offer" Width="187px" OnClick ="create"/>
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" Text="apply offer on product" Width ="187 px" OnClick ="apply" />
            <br />
            <br />
            <asp:Button ID="Button6" runat="server" Text="remove offer" Width ="187 px" OnClick="remove" />
             <br />
            <br />
           <asp:Button ID="Button7" runat="server" Text="Add phone" Width ="187 px" OnClick="add_phone"  /> 

        </div>
    </form>
</body>
</html>
