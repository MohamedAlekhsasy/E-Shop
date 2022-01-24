using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlTypes;

namespace WebApplication1
{
    public partial class Add_CreditCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Add(object sender, EventArgs e)
        {
            //Get the information of the connection to the database 
            //configuration
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("AddCreditCard", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user 
            //USE >> type var = ID of whatever toolbox.Text
            string creditcardnumber = txt_credit.Text;
            DateTime expirydate = new DateTime();
            try
            {
                 expirydate = Convert.ToDateTime(txt_expirydate.Text);
            }
            catch (FormatException)
            {
                Response.Write("Invalid date , please write a correct date");
                return;
            }
            
            string cvv = txt_cvv.Text;
            string customername = (string)(Session["username"]);

            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@creditcardnumber", creditcardnumber));
            cmd.Parameters.Add(new SqlParameter("@expirydate", expirydate));
            cmd.Parameters.Add(new SqlParameter("@cvv", cvv));
            cmd.Parameters.Add(new SqlParameter("@customername", customername));

            conn.Open();

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (SqlException)
            {
                Response.Write("This CreditCard already Exists , please insert another one");
                return;
            }
            catch(SqlTypeException)
            {
                Response.Write("Invalid date , please write a correct date");
                return;
            }
            
            Response.Write("Added Successfully");
            conn.Close();
        }

        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("customer.aspx", true);
        }
    }
}