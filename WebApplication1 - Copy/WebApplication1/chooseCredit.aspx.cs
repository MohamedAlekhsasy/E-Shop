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
    public partial class chooseCredit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void choose(object sender, EventArgs e)
        {
            //Get the information of the connection to the database 
            //configuration
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("ChooseCreditCard", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user 
            //USE >> type var = ID of whatever toolbox.Text
            string credit = TextBox1.Text;
            string stid = TextBox2.Text;
            int id = Convert.ToInt32(stid);

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@creditcard", credit));
            cmd.Parameters.Add(new SqlParameter("@orderid", id));

            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();

            }
            catch
            {
                Response.Write("Undefined creditCard , please insert it first");
                return;
            }
            Response.Write("creditcard has been chosen successfully");
            conn.Close();
        }

        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("customer.aspx", true);
        }
    }
}