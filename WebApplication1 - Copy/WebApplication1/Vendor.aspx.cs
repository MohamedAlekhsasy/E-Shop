using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class Vendor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void viewProducts(object sender, EventArgs e)
        {
            Response.Redirect("viewProduct.aspx", true);
        }

        protected void postProduct(object sender, EventArgs e)
        {


            Response.Redirect("postProduct.aspx", true);

        }

        protected void editProduct(object sender, EventArgs e)
        {
            Response.Redirect("editProduct.aspx", true);
        }

        protected void create(object sender, EventArgs e)
        {
            Response.Redirect("createOffer.aspx", true);
        }

        protected void apply(object sender, EventArgs e)
        {
            Response.Redirect("applyOffer.aspx", true);

        }

        protected void remove(object sender, EventArgs e)
        {
            Response.Redirect("removeOffer.aspx", true);
        }

        protected void add_phone(object sender, EventArgs e)
        {
            Response.Redirect("addnum.aspx", true);
        }
    }
}