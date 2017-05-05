using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WeChange
{
    public partial class MyPetitions : System.Web.UI.Page
    {
        string cstring = ConfigurationManager.ConnectionStrings["WeChangeConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Regno"] != null)
            {
                using (SqlConnection con_CreatePetition = new SqlConnection(cstring))
                {
                    using (SqlCommand cmd_CreatePetition = new SqlCommand("select * from petitions where PetitionerID=" + Session["Regno"].ToString(), con_CreatePetition))
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd_CreatePetition.CommandText, con_CreatePetition);
                        DataSet ds = new DataSet("MyPetitions");

                        da.Fill(ds);
                        rpt_MyPetitions.DataSource = ds;
                        rpt_MyPetitions.DataBind();
                    }
                }
            }
            
        }
    }
}