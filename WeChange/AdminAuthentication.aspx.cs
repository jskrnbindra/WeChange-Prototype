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
    public partial class AdminAuthentication : System.Web.UI.Page
    {
        string cstring = ConfigurationManager.ConnectionStrings["WeChangeConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            using (SqlConnection con_CreatePetition = new SqlConnection(cstring))
            {

                using (SqlCommand cmd_CreatePetition = new SqlCommand("select password from MillionDollarTable where ID=1", con_CreatePetition))
                {
                    con_CreatePetition.Open();
                    if (password.Text.Equals(cmd_CreatePetition.ExecuteScalar().ToString()))
                    {
                        //logged in
                        Session["Admin"] = "Admin";
                        Response.Redirect("~/Admin.aspx");
                    }
                    else
                    {
                        Label1.Text = "Invalid Credentials";
                    }
                }
            }
        }
    }
}