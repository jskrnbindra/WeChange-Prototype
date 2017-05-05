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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cstring = ConfigurationManager.ConnectionStrings["WeChangeConnectionString"].ConnectionString;

        public static int RegNo = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Regno"] != null)
            {
                RegNo = Convert.ToInt32(Session["Regno"].ToString());
                btn_MPetitions.Visible = true;
            }
            else
                btn_MPetitions.Visible = false;
        }

        protected void btn_MPetitions_Click(object sender, EventArgs e)
        {
            using (SqlConnection con_CreatePetition = new SqlConnection(cstring))
            {
                using (SqlCommand cmd_CreatePetition = new SqlCommand("select * from petitions where PetitionerID="+Session["Regno"].ToString(), con_CreatePetition))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd_CreatePetition.CommandText,con_CreatePetition);
                    DataSet ds = new DataSet("MyPetitions");

                    da.Fill(ds);
                    rpt_MyPetitions.DataSource = ds;
                    rpt_MyPetitions.DataBind();
                }
            }

            SearchResults.Visible = false;
            rpt_Victories.Visible = false;
            rpt_Trending.Visible = false;
            rpt_MyPetitions.Visible = true;
            rpt_Latest.Visible = false;
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            using (SqlConnection con_CreatePetition = new SqlConnection(cstring))
            {
                using (SqlCommand cmd_CreatePetition = new SqlCommand("select * from petitions where title like '%"+tb_search.Text+"%'", con_CreatePetition))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd_CreatePetition.CommandText, con_CreatePetition);
                    DataSet ds = new DataSet("SearchResults");

                    da.Fill(ds);
                    SearchResults.DataSource = ds;
                    SearchResults.DataBind();
                }
            }
            SearchResults.Visible = true;
            rpt_Victories.Visible = false;
            rpt_Trending.Visible = false;
            rpt_MyPetitions.Visible = false;
            rpt_Latest.Visible = false;
        }

        protected void btn_Trending_Click(object sender, EventArgs e)
        {
            SearchResults.Visible = false;
            rpt_Victories.Visible = false;
            rpt_Trending.Visible = true;
            rpt_MyPetitions.Visible = false;
            rpt_Latest.Visible = false;
        }

        protected void btn_Latest_Click(object sender, EventArgs e)
        {
            SearchResults.Visible = false;
            rpt_Victories.Visible = false;
            rpt_Trending.Visible = false;
            rpt_MyPetitions.Visible = false;
            rpt_Latest.Visible = true;
        }

        protected void btn_Victories_Click(object sender, EventArgs e)
        {
            SearchResults.Visible = false;
            rpt_Victories.Visible = true;
            rpt_Trending.Visible = false;
            rpt_MyPetitions.Visible = false;
            rpt_Latest.Visible = false;
        }

        protected void rpt_Victories_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}