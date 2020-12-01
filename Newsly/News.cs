﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Newsly
{
    public class News
    {
        public string id { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public string url { get; set; }
        public string author { get; set; }
        public string image { get; set; }
        public string language { get; set; }
        public string[] category { get; set; }
        public string published { get; set; }
    }
}