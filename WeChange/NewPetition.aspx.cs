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
    public partial class NewPetition : System.Web.UI.Page
    {
        string cstring = ConfigurationManager.ConnectionStrings["WeChangeConnectionString"].ConnectionString;

        int PetitionerID =99999999;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void CreateNewPetition_Click(object sender, EventArgs e)
        {
            if (isAuthenticated())
            {
                Boolean set = tb_PetitionTitle.Text == "" || tb_PetitionDesc.Text == "";

                if (tb_DecisionMakerCustom.Visible == true)
                {
                    if (tb_DecisionMakerCustom.Text == "" || set)
                        lbl_PetitionStatus.Text = "All fields are mandatory";
                    else
                        CreatePetition();
                }
                else
                {
                    if (set)
                        lbl_PetitionStatus.Text = "All fields are mandatory";
                    else
                        CreatePetition();
                }
            }
            else
            {
                LoginView.Visible = true;
            }

        }
        public void CreatePetition()
        {
            string cstring = ConfigurationManager.ConnectionStrings["WeChangeConnectionString"].ConnectionString;
            using (SqlConnection con_CreatePetition = new SqlConnection(cstring))
            {
                using (SqlCommand cmd_CreatePetition = new SqlCommand("AddNewPetition", con_CreatePetition))
                {
                    cmd_CreatePetition.CommandType = CommandType.StoredProcedure;
                    SqlParameter PetitionTitle = new SqlParameter("@title", SqlDbType.NVarChar);
                    SqlParameter PetitionDesc = new SqlParameter("@Desc", SqlDbType.NVarChar);
                    SqlParameter PID = new SqlParameter("@PetitionerID", SqlDbType.Int);
                    SqlParameter DecisionMaker = new SqlParameter("@DMaker", SqlDbType.NVarChar);
                    SqlParameter Decision = new SqlParameter("@Decision",SqlDbType.NVarChar);
                    SqlParameter DecisionDesc = new SqlParameter("@DecisionDesc",SqlDbType.NVarChar);
                    SqlParameter DecisionDT = new SqlParameter("@DecisionDescDT", SqlDbType.NVarChar);
                    SqlParameter CreationDT = new SqlParameter("@CreationDT", SqlDbType.NVarChar);
                    SqlParameter Signs = new SqlParameter("@Signs", SqlDbType.Int);
                    SqlParameter ImagePath = new SqlParameter("@ImagePath", SqlDbType.NVarChar);

                    cmd_CreatePetition.Parameters.AddWithValue("@title", tb_PetitionTitle.Text);
                    cmd_CreatePetition.Parameters.AddWithValue("@Desc", tb_PetitionDesc.Text);
                    cmd_CreatePetition.Parameters.AddWithValue("@PetitionerID", PetitionerID);
                    cmd_CreatePetition.Parameters.AddWithValue("@Decision", "p");
                    cmd_CreatePetition.Parameters.AddWithValue("@DecisionDesc", "pending");
                    cmd_CreatePetition.Parameters.AddWithValue("@DecisionDescDT", "pending");
                    cmd_CreatePetition.Parameters.AddWithValue("@CreationDT", DateTime.Now.ToString());
                    cmd_CreatePetition.Parameters.AddWithValue("@Signs", 0);
                    cmd_CreatePetition.Parameters.AddWithValue("@ImagePath", "null");

                    if(tb_DecisionMakerCustom.Enabled)
                    cmd_CreatePetition.Parameters.AddWithValue("@DMaker", tb_DecisionMakerCustom.Text);
                    else
                    cmd_CreatePetition.Parameters.AddWithValue("@DMaker", ddl_DecisionMaker.SelectedItem.Text);


                    con_CreatePetition.Open();
                    if( Int16.Parse(cmd_CreatePetition.ExecuteNonQuery().ToString())!=1)
                    {
                        lbl_PetitionStatus.ForeColor = System.Drawing.Color.Red;
                        lbl_PetitionStatus.Text = "Oops! There was an error on our side. The error has been logged, please try again after some time.";
                    }
                    else
                    {
                        lbl_PetitionStatus.ForeColor = System.Drawing.Color.LightGreen;
                        lbl_PetitionStatus.Text = "Your petition has been created!";
                    }
                }
            }
        }

        public Boolean isAuthenticated()
        {
            HttpCookie c = Request.Cookies.Get("User");
            if (c == null)
            {
                return false;
            }
            else
            {
                PetitionerID = Convert.ToInt32(c.Values["UID"].ToString());
                return true;
            }


        }

        protected void ddl_DecisionMaker_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddl_DecisionMaker.SelectedValue=="4")
            {
                tb_DecisionMakerCustom.Visible = true;
                RequiredFieldValidator4.Enabled = true;
            }
            else
            {
                tb_DecisionMakerCustom.Visible = false;
                RequiredFieldValidator4.Enabled = false;

            }
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            pnl_login.Visible = true;
            pnl_signup.Visible = false;
        }

        protected void btn_signup_Click(object sender, EventArgs e)
        {
            pnl_login.Visible = false;
            pnl_signup.Visible = true;
        }

        protected void btn_LoginUser_Click(object sender, EventArgs e)
        {
            using (SqlConnection con_CreatePetition = new SqlConnection(cstring))
            {
                using (SqlCommand cmd_CreatePetition = new SqlCommand("LogInUser", con_CreatePetition))
                {
                    cmd_CreatePetition.CommandType = CommandType.StoredProcedure;
                    SqlParameter UserID = new SqlParameter("@UserID", SqlDbType.Int);
                    SqlParameter Passwords = new SqlParameter("@Pass", SqlDbType.NVarChar);

                    cmd_CreatePetition.Parameters.AddWithValue("@UserID", Convert.ToInt32(tb_UID.Text));
                    cmd_CreatePetition.Parameters.AddWithValue("@Pass", tb_pass.Text);

                    con_CreatePetition.Open();

                    if (Convert.ToInt32(cmd_CreatePetition.ExecuteScalar().ToString()) == 1)
                    {
                        SqlCommand NameFetcher = new SqlCommand("select name from users where regno = @UserId", con_CreatePetition);
                        NameFetcher.Parameters.AddWithValue("@UserID", Convert.ToInt32(tb_UID.Text));

                        SqlCommand emailFetcher = new SqlCommand("select email from users where regno = @UserId", con_CreatePetition);
                        emailFetcher.Parameters.AddWithValue("@UserID", Convert.ToInt32(tb_UID.Text));

                        HttpCookie UserAuth = new HttpCookie("User");
                        UserAuth.Values["UID"] = tb_UID.Text;
                        UserAuth.Values["name"] = NameFetcher.ExecuteScalar().ToString();
                        UserAuth.Values["email"] = emailFetcher.ExecuteScalar().ToString();
                        Response.Cookies.Add(UserAuth);

                        HttpCookie RegNo = new HttpCookie("UserID");
                        RegNo.Value = tb_UID.Text;
                        Response.Cookies.Add(RegNo);

                        //lbl_StatusShower.Text = UserAuth.Values["UID"].ToString();
                        lbl_StatusShower.Text = "Successful bete";
                        //Response.Redirect(Request.RawUrl);

                        LoginView.Visible = false;

                    }
                    else
                        lbl_StatusShower.Text = "not success";
                }
            }
        }

        protected void btn_SignUpUser_Click(object sender, EventArgs e)
        {
            if (tb_email.Text.Equals(tb_emailConfirm.Text))
                AddUser();

            else
            {
                lbl_StatusShower2.ForeColor = System.Drawing.Color.Red;
                lbl_StatusShower2.Text = "Emails do not match";
            }
        }

        public void AddUser()
        {
            using (SqlConnection con_CreatePetition = new SqlConnection(cstring))
            {
                using (SqlCommand cmd_CreatePetition = new SqlCommand("AddNewUser", con_CreatePetition))
                {
                    cmd_CreatePetition.CommandType = CommandType.StoredProcedure;

                    SqlParameter UserID = new SqlParameter("@UserID", SqlDbType.Int);
                    SqlParameter Passwords = new SqlParameter("@Pass", SqlDbType.NVarChar);
                    SqlParameter naam = new SqlParameter("@name", SqlDbType.NVarChar);
                    SqlParameter Email = new SqlParameter("@email", SqlDbType.NVarChar);
                    SqlParameter dt = new SqlParameter("@DT", SqlDbType.NVarChar);

                    cmd_CreatePetition.Parameters.AddWithValue("@UserID", Convert.ToInt32(tb_regno.Text));
                    cmd_CreatePetition.Parameters.AddWithValue("@Pass", tb_password.Text);
                    cmd_CreatePetition.Parameters.AddWithValue("@name", tb_name.Text);
                    cmd_CreatePetition.Parameters.AddWithValue("@email", tb_email.Text);
                    cmd_CreatePetition.Parameters.AddWithValue("@DT", DateTime.Now.ToString());


                    con_CreatePetition.Open();
                    if (Int16.Parse(cmd_CreatePetition.ExecuteNonQuery().ToString()) != 1)
                    {
                        lbl_StatusShower2.ForeColor = System.Drawing.Color.Red;
                        lbl_StatusShower2.Text = "Oops! There was an error on our side. The error has been logged, please try again after some time.";
                    }
                    else
                    {
                        lbl_StatusShower2.ForeColor = System.Drawing.Color.LightGreen;
                        pnl_login.Visible = true;
                        pnl_signup.Visible = false;
                        lbl_StatusShower.Text = "Account has been created. Login to continue...";
                    }
                }
            }
        }
    }
}