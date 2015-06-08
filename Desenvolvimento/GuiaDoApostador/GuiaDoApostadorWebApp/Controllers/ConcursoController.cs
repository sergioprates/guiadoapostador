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
            List<Concurso> concursos = new List<Concurso>();

            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController<MegaSena>().ConsultaApi());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController<Lotofacil>().ConsultaApi());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController<Quina>().ConsultaApi());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController<Lotomania>().ConsultaApi());

            return concursos;
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
