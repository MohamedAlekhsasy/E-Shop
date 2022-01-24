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
    public partial class products : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("ShowProductsbyPrice", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();

            //IF the output is a table, then we can read the records one at a time
           // SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            // GridView1.DataSource = rdr;
            // GridView1.DataBind();

           // DataTable dt = new DataTable();
           // GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();

            /* dt.Columns.Add("serial number");
             dt.Columns.Add("product Name");
             dt.Columns.Add("category");
             dt.Columns.Add("product Description");
             dt.Columns.Add("color");
             dt.Columns.Add("rate");
             dt.Columns.Add("price");
             dt.Columns.Add("final Price");


             while (rdr.Read())
             {
                 int serial_no = rdr.GetInt32(rdr.GetOrdinal("serial_no"));
                 string productName = rdr.GetString(rdr.GetOrdinal("product_name"));
                 string category = rdr.GetString(rdr.GetOrdinal("category"));
                 string product_description = rdr.GetString(rdr.GetOrdinal("product_description"));
                 string color = rdr.GetString(rdr.GetOrdinal("color"));
                 object rate = rdr.GetValue(rdr.GetOrdinal("rate"));
                 decimal price = rdr.GetDecimal(rdr.GetOrdinal("price"));
                 decimal final_price = rdr.GetDecimal(rdr.GetOrdinal("final_price"));



                 dt.Rows.Add(serial_no, productName, category, product_description,
                     color, rate, price, final_price);



                 Button btn = new Button();
                 btn.Text = "add";
                 form1.Controls.Add(btn);

                 //Create a new label and add it to the HTML form
                 /* Label lbl_serial_no = new Label();
                  lbl_serial_no.Text = serial_no+"    ";
                  form1.Controls.Add(lbl_serial_no);
                  //'$sdthj'

                  Label lbl_productName = new Label();
                  lbl_productName.Text = productName+ "    ";
                  form1.Controls.Add(lbl_productName);

                  Label lbl_category = new Label();
                  lbl_category.Text = category + "    ";
                  form1.Controls.Add(lbl_category);

                  Label lbl_product_description = new Label();
                  lbl_product_description.Text = product_description+ "    ";
                  form1.Controls.Add(lbl_product_description);


                  Label lbl_color = new Label();
                  lbl_color.Text = color+ "    ";
                  form1.Controls.Add(lbl_color);


                  Label lbl_rate = new Label();
                  lbl_rate.Text = rate+ "    ";
                  form1.Controls.Add(lbl_rate);

                  Label lbl_price = new Label();
                  lbl_price.Text = price + "    ";
                  form1.Controls.Add(lbl_price);


                  Label lbl_productPrice = new Label();
                  lbl_productPrice.Text = final_price+ " <br /> <br />";
                  form1.Controls.Add(lbl_productPrice);


             }*/




        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);


            int row_no = Convert.ToInt32(e.CommandArgument.ToString());
            string x = GridView1.Rows[row_no].Cells[0].Text;
            int serial = Convert.ToInt32(x);
            string customername = (string)(Session["username"]);



            if (e.CommandName == "AddToWishlist")
            {
                Response.Redirect("add to wishList.aspx?serial="+serial+"&customername="+customername);
            }


            if (e.CommandName == "RemoveFromWishlist")
            {
                Response.Redirect("remove from wishList.aspx?serial=" + serial + "&customername=" + customername);
            }


            if (e.CommandName == "AddToCart")
            {
                SqlCommand cmd = new SqlCommand("addToCart", conn);
                cmd.CommandType = CommandType.StoredProcedure;


                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@customername", customername));
                cmd.Parameters.Add(new SqlParameter("@serial", serial));


                conn.Open();
                 try
                 {
                     cmd.ExecuteNonQuery();
                 }
                 catch
                 {
                     Response.Write("this product is already exist");
                     conn.Close();
                     return;
                 }
                Response.Write("Added to cart");
                conn.Close();
                

            }


            if (e.CommandName == "RemoveFromCart")
            {
                SqlCommand cmd = new SqlCommand("removefromCart", conn);
                cmd.CommandType = CommandType.StoredProcedure;


                //pass parameters to the stored procedure
                cmd.Parameters.Add(new SqlParameter("@serial", serial));
                cmd.Parameters.Add(new SqlParameter("@customername", customername));


                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("removed from cart");
            }



        }
    }
}