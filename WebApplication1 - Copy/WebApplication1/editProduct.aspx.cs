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
    public partial class editProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void editProducts(object sender, EventArgs e)
        {
            //Get the information of the connection to the database 
            //configuration
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("editProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user 
            //USE >> type var = ID of whatever toolbox.Text
            int serialNumber = (int.Parse(TextBox6.Text));
            string username = (string)(Session["username"]);
            string name = TextBox1.Text;
            string category = TextBox5.Text;
            string description = TextBox2.Text;
            decimal price = decimal.Parse(TextBox3.Text);
            string color = TextBox4.Text;


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@serialnumber", serialNumber));
            cmd.Parameters.Add(new SqlParameter("@vendorname", username));
            cmd.Parameters.Add(new SqlParameter("@product_name", name));
            cmd.Parameters.Add(new SqlParameter("@category", category));
            cmd.Parameters.Add(new SqlParameter("@product_description", description));
            cmd.Parameters.Add(new SqlParameter("@price", price));
            cmd.Parameters.Add(new SqlParameter("@color", color));


            conn.Open();

            cmd.ExecuteNonQuery();
            Response.Write("Product has been updated successfully !!");
            conn.Close();










        }
    }
}