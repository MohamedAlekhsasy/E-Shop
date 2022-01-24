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
    public partial class applyOffer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Get the information of the connection to the database 
            //configuration
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("viewOffers", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user 
            //USE >> type var = ID of whatever toolbox.Text
            string username = (string)(Session["username"]);

            conn.Open();

            cmd.ExecuteNonQuery();
            SqlDataReader rdr = cmd.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();
        }

        protected void applyOffers(object sender, EventArgs e)
        {
            //Get the information of the connection to the database 
            //configuration
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("applyOffer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user 
            //USE >> type var = ID of whatever toolbox.Text
            string username = (string)(Session["username"]);
            int id = int.Parse(TextBox1.Text);
            int serial = int.Parse(TextBox2.Text);

            cmd.Parameters.Add(new SqlParameter("@vendorname", username));
            cmd.Parameters.Add(new SqlParameter("@offerid", id));
            cmd.Parameters.Add(new SqlParameter("@serial", serial));

            conn.Open();

            cmd.ExecuteNonQuery();
            Response.Write("Offer has been applied successfully !!");
            conn.Close();

        }
    }
}