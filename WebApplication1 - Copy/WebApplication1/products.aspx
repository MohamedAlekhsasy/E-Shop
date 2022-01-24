<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="WebApplication1.products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="serial_no" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="serial_no" HeaderText="serial_no" InsertVisible="False" ReadOnly="True" SortExpression="serial_no" />
                    <asp:BoundField DataField="product_name" HeaderText="product_name" SortExpression="product_name" />
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                    <asp:BoundField DataField="product_description" HeaderText="product_description" SortExpression="product_description" />
                    <asp:BoundField DataField="color" HeaderText="color" SortExpression="color" />
                    <asp:BoundField DataField="rate" HeaderText="rate" SortExpression="rate" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="final_price" HeaderText="final_price" SortExpression="final_price" />
                    <asp:ButtonField ButtonType="Button" CommandName="AddToWishlist" Text="Add to wish list" />
                    <asp:ButtonField ButtonType="Button" CommandName="RemoveFromWishlist" Text="remove from wish list" />
                    <asp:ButtonField ButtonType="Button" CommandName="AddToCart" Text="Add  to cart" />
                    <asp:ButtonField ButtonType="Button" CommandName="RemoveFromCart" Text="remove from cart" />
                </Columns>
            </asp:GridView>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=3skora\sqlexpress;Initial Catalog=projectFinal;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="ShowProductsbyPrice" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            
        </div>
        
    </form>
</body>
</html>
