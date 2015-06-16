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
    public class EstatisticaController : ApiController
    {
        // GET: api/Estatistica/nome/loteria
        public object Get(Estatistica estatistica, Loteria loteria)
        {
            GuiaDoApostadorDominio.Controllers.ConcursoController controller = new GuiaDoApostadorDominio.Controllers.ConcursoController(loteria);

            object estat = controller.ObtemEstatistica(estatistica);

            return estat;
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
