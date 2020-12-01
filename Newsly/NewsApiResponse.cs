using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace Newsly
{
    public class NewsApi
    {
        public string status { get; set; }
        public List<News> news { get; set; }
        public int page { get; set; }

        public static NewsApi GetNewsFromApi(string keyword, string country)
        {
            string latestNewsEndpoint = "https://api.currentsapi.services/v1/latest-news";
            string searchEndpoint = "https://api.currentsapi.services/v1/search";
            string apiKey = "X6NuiEUOrWWueAYpfxBZxk2TV8pyEEMEcwFsnkyjEKFmGzks";
            string language = "en";
            string apiUrl = "";
            if(keyword != "" || country != "")
            {
                apiUrl += searchEndpoint + "?";
                apiUrl += "apiKey=" + apiKey;
                if(keyword != null)
                {
                    apiUrl += "&keywords=" + keyword;
                }
                apiUrl += "&language=" + language;
                apiUrl += "&country=" + country;
            }
            else
            {
                apiUrl += latestNewsEndpoint + "?";
                apiUrl += "apiKey=" + apiKey;
                apiUrl += "&language=" + language;
            }
            apiUrl = Uri.EscapeUriString(apiUrl);

            try
            {
                WebRequest requestObjGet = WebRequest.Create(apiUrl);
                requestObjGet.Method = "GET";
                requestObjGet.Timeout = 7000;
                HttpWebResponse responseObjGet = (HttpWebResponse)requestObjGet.GetResponse();

                string jsonDataStr = null;
                using (Stream stream = responseObjGet.GetResponseStream())
                {
                    StreamReader sr = new StreamReader(stream);
                    jsonDataStr = sr.ReadToEnd();
                    sr.Close();
                }

                NewsApi NewsResponseObj = JsonConvert.DeserializeObject<NewsApi>(jsonDataStr);
                return NewsResponseObj;
            }
            catch(Exception ex)
            {
                return null;
            }
        }
    }
}