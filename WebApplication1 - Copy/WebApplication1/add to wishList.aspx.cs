using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1.Customer
{
    public partial class add_to_wishList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddToCart(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);


            /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("AddtoWishlist", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string wishname = wishName.Text;
            

            string customername= Request.QueryString["customername"];
            string x = Request.QueryString["serial"];
            int serial = Convert.ToInt32(x);

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@customername", customername));
            cmd.Parameters.Add(new SqlParameter("@wishlistname", wishname));
            cmd.Parameters.Add(new SqlParameter("@serial", serial));


            //Executing the SQLCommand
            conn.Open();
             try
             {
                 cmd.ExecuteNonQuery();
             }
             catch
             {
                 Response.Write("this product is already exist or the wish list " +
                     "you insert is not exist");
                 return;
             }
            
            Response.Write("Added successfully");
            conn.Close();

        }

        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("customer.aspx", true);
        }
    }
}