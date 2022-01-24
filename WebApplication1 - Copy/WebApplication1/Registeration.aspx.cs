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
    public partial class Registeration : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {



        }

        protected void customerRegister(object sender, EventArgs e)
        {
            //Get the information of the connection to the database 
            //configuration
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("customerRegister", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user 
            //USE >> type var = ID of whatever toolbox.Text
            string first = TextBox1.Text;
            string last = TextBox5.Text;
            string username = TextBox2.Text;
            string password = TextBox3.Text;
            string mail = TextBox4.Text;


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@first_name", first));
            cmd.Parameters.Add(new SqlParameter("@last_name", last));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            cmd.Parameters.Add(new SqlParameter("@email", mail));

            bool f = true;
            //Executing the SQLCommand
            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch
            {
                f = false;
            }
            conn.Close();
            if (f)
            {


                Response.Write("Registeration Successful");
                Response.Redirect("login.aspx", true);

            }

            else
                Response.Write("UserName already Exists , please insert another one");
        }

        protected void vendorRegister(object sender, EventArgs e)
        {
            //Get the information of the connection to the database 
            //configuration
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("vendorRegister", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user 
            //USE >> type var = ID of whatever toolbox.Text
            string first = TextBox1.Text;
            string last = TextBox5.Text;
            string username = TextBox2.Text;
            string password = TextBox3.Text;
            string mail = TextBox4.Text;
            string company = TextBox6.Text;
            string bank = TextBox7.Text;


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@first_name", first));
            cmd.Parameters.Add(new SqlParameter("@last_name", last));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            cmd.Parameters.Add(new SqlParameter("@email", mail));
            cmd.Parameters.Add(new SqlParameter("@company_name", company));
            cmd.Parameters.Add(new SqlParameter("@bank_acc_no", bank));

            bool f = true;
            //Executing the SQLCommand
            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch
            {
                f = false;
            }
            conn.Close();
            if (f)
            {
                Response.Write("Registeration Successful");
                Response.Redirect("login.aspx", true);
            }

            else
                Response.Write("UserName already Exists , please insert another one");
        }
    }
}