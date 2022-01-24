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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void userlogin(object sender, EventArgs e)
        {
                //Get the information of the connection to the database 
                //configuration
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

                //create a new connection
                SqlConnection conn = new SqlConnection(connStr);

                /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
                SqlCommand cmd = new SqlCommand("userLogin", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                //To read the input from the user 
                //USE >> type var = ID of whatever toolbox.Text
                string username = txt_username.Text;
                string password = txt_password.Text;

                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@username", username));
                cmd.Parameters.Add(new SqlParameter("@password", password));

            //Save the output from the procedure
            SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
            SqlParameter type = cmd.Parameters.Add("@type", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            type.Direction = ParameterDirection.Output;

            //Executing the SQLCommand
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close(); 


            if (success.Value.ToString().Equals("1"))
            {
                //To send response data to the client side (HTML)
                Response.Write("Passed");

                /*ASP.NET session state enables you to store and retrieve values for a user
                as the user navigates ASP.NET pages in a Web application.
                This is how we store a value in the session*/
                Session["username"] = username+"";
                //this is how you retrive data from session variable.
                //string field1 = (string)(Session["username"]);
                // Response.Write(field1);

                if (type.Value.ToString().Equals("0"))
                {
                    //To navigate to another webpage
                    Response.Redirect("customer.aspx", true);

                }

                if (type.Value.ToString().Equals("1"))
                {
                    //To navigate to another webpage
                    Response.Redirect("Vendor.aspx", true);

                }
                if (type.Value.ToString().Equals("2"))
                {
                    //To navigate to another webpage
                    Response.Redirect("Admin.aspx", true);

                }
             
            }
            else
            {
                Response.Write("Failed");
            }


        }

    }
}