using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace WeChange
{
    public partial class Admin : System.Web.UI.Page
    {
        string cstring = ConfigurationManager.ConnectionStrings["WeChangeConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"]==null)
            {
                Response.Redirect("~/AdminAuthentication.aspx");
            }
            else
            {
                //sahi hai
            }
        }
    }
}