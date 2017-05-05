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
    public partial class Login : System.Web.UI.Page
    {
        string cstring = ConfigurationManager.ConnectionStrings["WeChangeConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

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

                        Session["Regno"] = tb_UID.Text;

                        //lbl_StatusShower.Text = UserAuth.Values["UID"].ToString();
                        Response.Redirect("~/LandingPage.aspx");

                        lbl_StatusShower.Text = "Successful bete";

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
                        lbl_StatusShower2.Text = "Account Created!";
                    }
                }
            }
        }
    }
}