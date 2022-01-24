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
    public partial class viewCart : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("viewMyCart", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string customer = (string)(Session["username"]);

            cmd.Parameters.Add(new SqlParameter("@customer", customer));


            conn.Open();
            cmd.ExecuteNonQuery();

            SqlDataReader rdr = cmd.ExecuteReader();

            GridView2.DataSource = rdr;
             GridView2.DataBind();

           
            
            conn.Close();

        }


        protected void make_order(object sender, EventArgs e)
        {
            //Get the information of the connection to the database 
            //configuration
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("makeOrder", conn);
            cmd.CommandType = CommandType.StoredProcedure;

         
            string username = (string)(Session["username"]);

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@customername", username));
           

            conn.Open();
            cmd.ExecuteNonQuery();
            Response.Write("order made successfully");
            conn.Close();
        }

        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("customer.aspx", true);
        }
    }
}