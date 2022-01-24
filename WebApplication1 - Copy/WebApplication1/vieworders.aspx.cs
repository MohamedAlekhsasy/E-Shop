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
    public partial class vieworders : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("vieworder", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string customer = (string)(Session["username"]);

            cmd.Parameters.Add(new SqlParameter("@customer", customer));


            conn.Open();
            cmd.ExecuteNonQuery();

            SqlDataReader rdr = cmd.ExecuteReader();

            GridView1.DataSource = rdr;
            GridView1.DataBind();



            conn.Close();

        }

        protected void cancelorder(object sender, EventArgs e)
        {
            Response.Redirect("cancelorder.aspx");
        }
        protected void choose_credit(object sender, EventArgs e)
        {
            Response.Redirect("chooseCredit.aspx");
        }

        protected void payment(object sender, EventArgs e)
        {
            Response.Redirect("payment.aspx");
        }

        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("customer.aspx", true);

        }
    }
}