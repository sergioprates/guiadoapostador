using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Web.Http;

namespace GuiaDoApostadorWebApp
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "ConcursoApi",
                routeTemplate: "Concurso/{loteria}/{id}",
                defaults: new { controller = "Concurso", id = RouteParameter.Optional, loteria = RouteParameter.Optional }
            );

            config.Routes.MapHttpRoute(
                name: "EstatisticaApi",
                routeTemplate: "Estatistica/{estatistica}/{loteria}",
                defaults: new { controller = "Estatistica" }
            );

            config.Formatters.JsonFormatter.SupportedMediaTypes.Add(new MediaTypeHeaderValue("text/html"));
        }

    }
}
