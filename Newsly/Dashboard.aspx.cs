using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Newsly
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["New"] != null)
                {
                    string username = Session["New"].ToString();
                    LabelWelcome.Text = $"Welcome {username}!";

                    GenerateNewsHTML("", "");
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        public void GenerateNewsHTML(string keyword, string country)
        {
            NewsApi newsApiResponse = NewsApi.GetNewsFromApi(keyword, country);
            if(newsApiResponse == null)
            {
                Session["newsList"] = null;
                RepeaterNews.DataSource = Session["newsList"];
                RepeaterNews.DataBind();
                return;
            }

            Session["newsList"] = newsApiResponse.news;
            RepeaterNews.DataSource = Session["newsList"];
            RepeaterNews.DataBind();
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            string keyword = TextBoxSearchBox.Text.Trim();
            if (keyword != "")
            {
                LabelNewsType.Text = $"Search results for '{keyword}'";
                TextBoxSearchClose.Visible = true;
            }
            else
            {
                LabelNewsType.Text = "Latest News";
                TextBoxSearchClose.Visible = false;
                RadioButtonListRegion.SelectedIndex = 0;
            }
            GenerateNewsHTML(keyword, "");
        }

        public void TextBoxSearchClose_Click(object sender, EventArgs e)
        {
            GenerateNewsHTML("", "");
            LabelNewsType.Text = "Latest News";
            TextBoxSearchBox.Text = "";
            TextBoxSearchClose.Visible = false;
            RadioButtonListRegion.SelectedIndex = 0;
        }

        public News FindNewsById(string newsId)
        {
            List<News> newsList = (List<News>) Session["newsList"];
            for (int i = 0; i < newsList.Count; i++)
            {
                News news = newsList[i];
                if (news.id == newsId)
                {
                    return news;
                }
            }
            return null;
        }

        public bool StoreNewsToDB(News news)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                conn.Open();

                string insertQuery = "insert into dbo.SavedNews(id,title,description,url,author,image,language,published,username) values(@id,@title,@description,@url,@author,@image,@language,@published,@username)";
                SqlCommand cmd = new SqlCommand(insertQuery, conn);

                cmd.Parameters.AddWithValue("@id", news.id);
                cmd.Parameters.AddWithValue("@title", news.title);
                cmd.Parameters.AddWithValue("@description", news.description);
                cmd.Parameters.AddWithValue("@url", news.url);
                cmd.Parameters.AddWithValue("@author", news.author);
                cmd.Parameters.AddWithValue("@image", news.image);
                cmd.Parameters.AddWithValue("@language", news.language);
                cmd.Parameters.AddWithValue("@published", news.published);
                cmd.Parameters.AddWithValue("@username", Session["New"]);

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

        public void ButtonFavorite_Click(object sender, EventArgs e)
        {
            string newsId = (sender as Button).CommandArgument;
            News news = FindNewsById(newsId);
            
            if (news != null)
            {
                bool storeSuccess = StoreNewsToDB(news);
            }
        }

        protected void RadioButtonListRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(RadioButtonListRegion.SelectedValue == "India")
            {
                GenerateNewsHTML("", "IN");
                LabelNewsType.Text = "Latest News (India)";
            }
            else
            {
                GenerateNewsHTML("", "");
                LabelNewsType.Text = "Latest News";
            }
        }
    }
}