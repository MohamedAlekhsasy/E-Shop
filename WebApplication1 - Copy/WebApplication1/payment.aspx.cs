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
    public partial class payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void pay(object sender, EventArgs e)
        {
            //Get the information of the connection to the database 
            //configuration
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("SpecifyAmount", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user 
            //USE >> type var = ID of whatever toolbox.Text
            string customername = (string)(Session["username"]);
            string stid = TextBox1.Text;
            string stcash = TextBox2.Text;
            string stcredit = TextBox3.Text;
           
            int id = Convert.ToInt32(stid);
            decimal cash = Convert.ToDecimal(stcash);
            decimal credit = Convert.ToDecimal(stcredit);


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@customername", customername));
            cmd.Parameters.Add(new SqlParameter("@orderID", id));
            cmd.Parameters.Add(new SqlParameter("@cash", cash));
            cmd.Parameters.Add(new SqlParameter("@credit", credit));

            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();

            }
            catch
            {
                Response.Write("id does not exists , please check id again");
                return;
            }
            Response.Write("done successfully");
            conn.Close();
        }

        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("customer.aspx", true);
        }
    }
}