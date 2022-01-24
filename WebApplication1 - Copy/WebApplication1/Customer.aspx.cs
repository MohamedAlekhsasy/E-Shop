using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewProduct(object sender, EventArgs e)
        {
            Response.Redirect("products.aspx", true);
        }

        protected void create_wishList(object sender, EventArgs e)
        {
            Response.Redirect("create wishList.aspx", true);
        }


        protected void Add_creditCard(object sender, EventArgs e)
        {
            Response.Redirect("Add CreditCard.aspx", true);
        }

        protected void viewCart(object sender, EventArgs e)
        {
            Response.Redirect("viewCart.aspx", true);
        }

        protected void vieworder(object sender, EventArgs e)
        {
            Response.Redirect("vieworders.aspx", true);
        }

        protected void add_phone(object sender, EventArgs e)
        {
            Response.Redirect("addnum.aspx", true);
        }
    }
}