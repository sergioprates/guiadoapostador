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

            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.DuplaSena).BuscarMaisRecente());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Federal).BuscarMaisRecente());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Loteca).BuscarMaisRecente());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Lotofacil).BuscarMaisRecente());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Lotogol).BuscarMaisRecente());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Lotomania).BuscarMaisRecente());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.MegaSena).BuscarMaisRecente());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Quina).BuscarMaisRecente());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Timemania).BuscarMaisRecente());

            return concursos;
        }

        // GET: api/Concurso
        public Concurso Get(Loteria loteria)
        {
            GuiaDoApostadorDominio.Controllers.ConcursoController controller = new GuiaDoApostadorDominio.Controllers.ConcursoController(loteria);

            Concurso con = controller.BuscarMaisRecente();

            return con;
        }

        // GET: api/Concurso/5
        public Concurso Get(Loteria loteria, int id)
        {
            GuiaDoApostadorDominio.Controllers.ConcursoController controller = new GuiaDoApostadorDominio.Controllers.ConcursoController(loteria);

            Concurso con = controller.Buscar(id);

            return con;
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
