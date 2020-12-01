using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Newsly
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                conn.Open();

                string userCheck = "select count(*) from dbo.Newsly where username='" + TextBoxUsername.Text + "'";
                SqlCommand cmd = new SqlCommand(userCheck, conn);
                int temp = int.Parse(cmd.ExecuteScalar().ToString());

                conn.Close();

                if (temp >= 1)
                {
                    LabelError.Text = "Username already exists";
                }
            }
        }

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            LabelInfo.Text = "";
            LabelError.Text = "";

            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                conn.Open();

                string insertQuery = "insert into dbo.Newsly(username,email,password) values(@username,@email,@password)";

                SqlCommand cmd = new SqlCommand(insertQuery, conn);

                cmd.Parameters.AddWithValue("@username", TextBoxUsername.Text);
                cmd.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                cmd.Parameters.AddWithValue("@password", TextBoxPassword.Text);

                cmd.ExecuteNonQuery();
                LabelInfo.Text = "Registration Successful!";

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }
    }
}