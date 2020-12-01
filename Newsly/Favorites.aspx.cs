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
    public partial class Favorites : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        public bool RemoveNewsFromDB(string newsId)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                conn.Open();

                string removeQuery = "delete from dbo.SavedNews where id = @id";
                SqlCommand cmd = new SqlCommand(removeQuery, conn);

                cmd.Parameters.AddWithValue("@id", newsId);

                cmd.ExecuteNonQuery();
                conn.Close();

                return true;
            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
                return false;
            }
        }

        public void ButtonFavoriteDelete_Click(object sender, EventArgs e)
        {
            string newsId = (sender as Button).CommandArgument;
            bool removeSuccess = RemoveNewsFromDB(newsId);
            RepeaterNews.DataBind();
        }
    }
}