using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeChange
{
    public partial class HeaderFooter : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Regno"] != null)
            {
                hl_mp.Visible = true;
                btn_Logout.Visible = true;
                Login.Visible = false;
            }
            else
            {
                hl_mp.Visible = false;
                btn_Logout.Visible = false;
            }
        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Response.Cookies["User"].Expires.AddMilliseconds(1);
            Session["Regno"] = null;
            Login.Visible = true;
            btn_Logout.Visible = false;
        }
    }
}