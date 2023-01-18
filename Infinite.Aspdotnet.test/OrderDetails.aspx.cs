using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Infinite.Aspdotnet.test
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("getOrderDetailsBetweenDates", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@startdate", txtStartDate.Text);
                    cmd.Parameters.AddWithValue("@enddate", txtEndDate.Text);

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }

                    cmd.ExecuteNonQuery();



                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        gvOrders.DataSource = dr;
                        gvOrders.DataBind();

                    }






                }
            }
        }
    }
}