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
    public partial class removeDeal : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("viewDeals", conn);
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

        protected void remove(object sender, EventArgs e)
        {
            //Get the information of the connection to the database 
            //configuration
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("removeExpiredDeal", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user 
            //USE >> type var = ID of whatever toolbox.Text
            string username = (string)(Session["username"]);
            string id = TextBox1.Text;


            cmd.Parameters.Add(new SqlParameter("@deal_iD", id));
            conn.Open();

            cmd.ExecuteNonQuery();
            Response.Write("Deal has been removed !!");
            conn.Close();
        }
    }
}