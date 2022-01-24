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
    public partial class createDeal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void create(object sender, EventArgs e)
        {
            //Get the information of the connection to the database 
            //configuration
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("createTodaysDeal", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user 
            //USE >> type var = ID of whatever toolbox.Text

            string username = (string)(Session["username"]);
            string name = TextBox1.Text;
            string description = TextBox2.Text;


            cmd.Parameters.Add(new SqlParameter("@deal_amount", name));
            cmd.Parameters.Add(new SqlParameter("@admin_username", username));
            cmd.Parameters.Add(new SqlParameter("@expiry_date", description));
            conn.Open();

            cmd.ExecuteNonQuery();
            Response.Write("Deal has been added successfully !!");

            conn.Close();
        }
    }
}