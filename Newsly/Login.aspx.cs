using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Newsly
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                Response.Redirect("Dashboard.aspx");
            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            LabelInfo.Text = "";
            LabelError.Text = "";

            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                conn.Open();

                string userCheck = "select count(*) from dbo.Newsly where username='" + TextBoxUsername.Text + "'";
                SqlCommand cmd = new SqlCommand(userCheck, conn);
                int temp = int.Parse(cmd.ExecuteScalar().ToString());

                if (temp == 1)
                {
                    string checkPassword = "select password from dbo.Newsly where username='" + TextBoxUsername.Text + "'";
                    SqlCommand passCmd = new SqlCommand(checkPassword, conn);
                    string password = passCmd.ExecuteScalar().ToString();

                    if(TextBoxPassword.Text == password)
                    {
                        Session["New"] = TextBoxUsername.Text;
                        LabelInfo.Text = "Password is correct.";
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        LabelError.Text = "Password is incorrect.";
                    }
                }
                else
                {
                    LabelError.Text = "User not found.";
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }
    }
}