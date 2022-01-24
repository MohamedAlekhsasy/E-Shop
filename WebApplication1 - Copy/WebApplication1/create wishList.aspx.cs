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
    public partial class create_wishList : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("createWishlist", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user 
            //USE >> type var = ID of whatever toolbox.Text
            string customername = (string)(Session["username"]);
            string wishname = wishName.Text;

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@customername", customername));
            cmd.Parameters.Add(new SqlParameter("@name", wishname));

            bool flag = true;
            //Executing the SQLCommand
            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch
            {
                flag=false;
            }
            if (flag)
                Response.Write("added successfully");

            else
                Response.Write("This name is already exists please write another name");

            conn.Close();
        }

        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("customer.aspx", true);

        }
    }
}