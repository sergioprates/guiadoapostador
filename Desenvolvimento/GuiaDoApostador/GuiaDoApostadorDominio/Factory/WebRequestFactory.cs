using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using Newtonsoft.Json;

namespace GuiaDoApostadorDominio.Factory
{
    public class WebRequestFactory
    {
        public static dynamic GetWebRequestJson(string url)
        {
            dynamic obj;

            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);

                WebResponse response = (HttpWebResponse)request.GetResponse();
                string json = new StreamReader(response.GetResponseStream()).ReadToEnd();
                obj = JsonConvert.DeserializeObject<dynamic>(json);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return obj;
        }
    }
}
