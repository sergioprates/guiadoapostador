using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace GuiaDoApostadorWebApp.Controllers
{
    public class ConcursoController : ApiController
    {
        // GET: api/Concurso
        public IEnumerable<Concurso> Get()
        {
            List<Concurso> concurso = new List<Concurso>();
            concurso.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.MegaSena).ConsultaApi());
            concurso.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Lotofacil).ConsultaApi());
            concurso.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Quina).ConsultaApi());


            return concurso;
        }

        // GET: api/Concurso/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Concurso
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Concurso/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Concurso/5
        public void Delete(int id)
        {
        }
    }
}
