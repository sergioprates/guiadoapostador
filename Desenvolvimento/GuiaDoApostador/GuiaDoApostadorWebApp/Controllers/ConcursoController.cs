using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces;
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

            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.DuplaSena).ConsultaApi());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Federal).ConsultaApi());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Loteca).ConsultaApi());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Lotofacil).ConsultaApi());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Lotogol).ConsultaApi());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Lotomania).ConsultaApi());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.MegaSena).ConsultaApi());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Quina).ConsultaApi());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Timemania).ConsultaApi());
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
