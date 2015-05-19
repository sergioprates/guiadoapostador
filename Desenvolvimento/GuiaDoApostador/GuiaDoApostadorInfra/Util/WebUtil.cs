using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace GuiaDoApostadorInfra.Util
{
    public static class WebUtil
    {
        public static dynamic GetWebRequestJson(string url)
        {
            dynamic obj;

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);

            WebResponse response = (HttpWebResponse)request.GetResponse();
            string json = new StreamReader(response.GetResponseStream()).ReadToEnd();
            obj = JsonConvert.DeserializeObject<dynamic>(json);

            return obj;
        }
    }
}
