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
    public partial class SignPetition : System.Web.UI.Page
    {
        string cstring = ConfigurationManager.ConnectionStrings["WeChangeConnectionString"].ConnectionString;
        string title, desc, petID, Dmaker, Descision, DesDesc, DecisionDT, DT, Signs, Pname, pID;

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Admin"] = null;
            Response.Redirect("AdminAuthentication.aspx");
        }

        protected void btn_Approve_Click(object sender, EventArgs e)
        {
            using (SqlConnection con_CreatePetition = new SqlConnection(cstring))
            {
                con_CreatePetition.Open();
                SqlCommand addDesc = new SqlCommand("update petitions set DecisionDesc = '" + tb_DecisionDesc.Text + "' where ID=" + pID.ToString(), con_CreatePetition);
                addDesc.ExecuteNonQuery();

                SqlCommand cmd_Approve = new SqlCommand("update petitions set Decision='a',DecisionDT='"+DateTime.Now.ToString()+"' where ID=" + pID.ToString(),con_CreatePetition);
                cmd_Approve.ExecuteNonQuery();
                lbl_DecisionAction.Text = "Done";
                Response.Redirect(Request.RawUrl);
            }

        }

        protected void btn_Reject_Click(object sender, EventArgs e)
        {

            using (SqlConnection con_CreatePetition = new SqlConnection(cstring))
            {
                con_CreatePetition.Open();
                SqlCommand addDesc = new SqlCommand("update petitions set DecisionDesc = '" + tb_DecisionDesc.Text + "' where ID=" + pID.ToString(), con_CreatePetition);
                addDesc.ExecuteNonQuery();
                SqlCommand cmd_Reject = new SqlCommand("update petitions set Decision='d',DecisionDT='"+DateTime.Now.ToString()+"' where ID=" + pID.ToString(), con_CreatePetition);
                cmd_Reject.ExecuteNonQuery();
                lbl_DecisionAction.Text = "Done";

                Response.Redirect(Request.RawUrl);
            }
        }

        protected void SignPeition_Click(object sender, EventArgs e)
        {
            using (SqlConnection con_CreatePetition = new SqlConnection(cstring))
            {
                con_CreatePetition.Open();
                SqlCommand GetSigns = new SqlCommand("select signs from petitions where ID=" + pID.ToString(), con_CreatePetition);
                int signs = Convert.ToInt32(GetSigns.ExecuteScalar().ToString());
                signs += 1;
                SqlCommand SignPetition = new SqlCommand("update petitions set signs=" + signs.ToString() + "where ID=" + pID.ToString(), con_CreatePetition);
                SignPetition.ExecuteNonQuery();

                if (Session["Regno"] != null)
                {
                    SqlCommand LogSigns = new SqlCommand("insert into signatures(PetitionId,userID,DT) values(" + pID.ToString() + "," + Session["Regno"].ToString() + ",'" + DateTime.Now.ToString() + "')", con_CreatePetition);

                    LogSigns.ExecuteNonQuery();
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
                lbl_statusShower.ForeColor = System.Drawing.Color.Green;
                lbl_statusShower.Text = "Thank you for signing the petition.";

            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                SignPeition.Visible = false;
                Adminpanel.Visible = true;
            }
            else
            {
                Adminpanel.Visible = false;
            }

            using (SqlConnection con_CreatePetition = new SqlConnection(cstring))
            {
                con_CreatePetition.Open();
                pID = Request.QueryString["PetitionID"].ToString();

                SqlCommand cmd_title = new SqlCommand("select Title from petitions where ID=" + Request.QueryString["PetitionID"].ToString(), con_CreatePetition);
                SqlCommand cmd_pdesc = new SqlCommand("select PDescription from petitions where ID=" + Request.QueryString["PetitionID"].ToString(), con_CreatePetition);
                SqlCommand cmd_petID = new SqlCommand("select PetitionerID from petitions where ID=" + Request.QueryString["PetitionID"].ToString(), con_CreatePetition);
                SqlCommand cmd_Dmaker = new SqlCommand("select DecisionMaker from petitions where ID=" + Request.QueryString["PetitionID"].ToString(), con_CreatePetition);
                SqlCommand cmd_Decision = new SqlCommand("select Decision from petitions where ID=" + Request.QueryString["PetitionID"].ToString(), con_CreatePetition);
                SqlCommand cmd_DecisionDT = new SqlCommand("select DecisionDT from petitions where ID=" + Request.QueryString["PetitionID"].ToString(), con_CreatePetition);
                SqlCommand cmd_DesDesc = new SqlCommand("select DecisionDesc from petitions where ID=" + Request.QueryString["PetitionID"].ToString(), con_CreatePetition);
                SqlCommand cmd_DT = new SqlCommand("select DT from petitions where ID=" + Request.QueryString["PetitionID"].ToString(), con_CreatePetition);
                SqlCommand cmd_signs = new SqlCommand("select Signs from petitions where ID=" + Request.QueryString["PetitionID"].ToString(), con_CreatePetition);
                SqlCommand cmd_Pname = new SqlCommand("select Pname from petitions where ID=" + Request.QueryString["PetitionID"].ToString(), con_CreatePetition);

                title = cmd_title.ExecuteScalar().ToString();
                desc = cmd_pdesc.ExecuteScalar().ToString();
                petID = cmd_petID.ExecuteScalar().ToString();
                Dmaker = cmd_Dmaker.ExecuteScalar().ToString();
                Descision = cmd_Decision.ExecuteScalar().ToString();
                DesDesc = cmd_DecisionDT.ExecuteScalar().ToString();
                DecisionDT = cmd_DesDesc.ExecuteScalar().ToString();
                DT = cmd_DT.ExecuteScalar().ToString();
                Signs = cmd_signs.ExecuteScalar().ToString();
                Pname = cmd_Pname.ExecuteScalar().ToString();

                lbl_Title.Text = title;
                lbl_signs.Text = Signs;
                lbl_pname.Text = Pname;
                lbl_pdesc.Text = desc;
                lbl_DT.Text = DT;
                lbl_decision.Text = Descision;
                lbl_descDT.Text = DecisionDT;
                lbl_DecDesc.Text = DesDesc;
                lbl_DM.Text = Dmaker;
                lbl_petID.Text = petID;

            }
        }
    }
}