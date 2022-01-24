using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void activate(object sender, EventArgs e)
        {
            Response.Redirect("activateVendor.aspx", true);
        }

        protected void update(object sender, EventArgs e)
        {
            Response.Redirect("updateOrders.aspx", true);
        }

        protected void review(object sender, EventArgs e)
        {
            Response.Redirect("reviewOrders.aspx", true);
        }

        protected void create(object sender, EventArgs e)
        {
            Response.Redirect("createDeal.aspx", true);
        }

        protected void apply(object sender, EventArgs e)
        {
            Response.Redirect("applyDeal.aspx", true);
        }

        protected void remove(object sender, EventArgs e)
        {
            Response.Redirect("removeDeal.aspx", true);
        }

        protected void add_phone(object sender, EventArgs e)
        {
            Response.Redirect("addnum.aspx", true);
        }
    }
}