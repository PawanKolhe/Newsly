using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Newsly
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["New"] != null)
            {
                LabelUser.Text = Session["New"].ToString();
                LinkButtonDashboard.Visible = true;
                LinkButtonFavorites.Visible = true;
                LinkButtonLogout.Visible = true;
                LinkButtonLogin.Visible = false;
                LinkButtonRegister.Visible = false;
            }
            else
            {
                LinkButtonDashboard.Visible = false;
                LinkButtonFavorites.Visible = false;
                LinkButtonLogout.Visible = false;
                LinkButtonLogin.Visible = true;
                LinkButtonRegister.Visible = true;
            }
        }

        protected void LinkButtonLogout_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}