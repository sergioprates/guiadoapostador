using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces;
using GuiaDoApostadorWebApp.ViewModels;
using Newtonsoft.Json;
using PushNotification.Dominio.Entities;
using PushNotification.Dominio.Facade;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
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
            //concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Loteca).BuscarMaisRecente());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Lotofacil).BuscarMaisRecente());
            //concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Lotogol).BuscarMaisRecente());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Lotomania).BuscarMaisRecente());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.MegaSena).BuscarMaisRecente());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Quina).BuscarMaisRecente());
            concursos.Add(new GuiaDoApostadorDominio.Controllers.ConcursoController(Loteria.Timemania).BuscarMaisRecente());

            return concursos.OrderByDescending(x=> x.Data).ToList();
        }

        // GET: api/Concurso/Loteria
        public Concurso Get(Loteria loteria)
        {
            GuiaDoApostadorDominio.Controllers.ConcursoController controller = new GuiaDoApostadorDominio.Controllers.ConcursoController(loteria);

            Concurso con = controller.BuscarMaisRecente();

            return con;
        }

        // GET: api/Concurso/Loteria/id
        public Concurso Get(Loteria loteria, int id)
        {
            GuiaDoApostadorDominio.Controllers.ConcursoController controller = new GuiaDoApostadorDominio.Controllers.ConcursoController(loteria);

            Concurso con = controller.Buscar(id);

            return con;
        }



        // POST: api/Concurso
        //public void Post([FromBody]string value)
        //{
        //    var valores = value;
        //}

        [HttpPost]
        public void Post(Apostador apostador)
        {
            if (apostador == null)
            {
                throw new Exception("Parâmetro inválido. Apostador");
            }

            if (apostador.Apostas == null)
            {
                throw new Exception("Parâmetro inválido. Apostas");
            }

            for (int i = 0; i < apostador.Apostas.Count; i++)
            {
                Aposta aposta = apostador.Apostas[i];
                Concurso concurso = new GuiaDoApostadorDominio.Controllers.ConcursoController(aposta.TipoConcurso).Buscar(aposta.ConcursoID);
                
                if (concurso != null && concurso.ID > 0)
                {
                    string json = JsonConvert.SerializeObject(concurso);

                    PushAndroid push = new PushAndroid();

                    push.RegistrationIDS.Add(apostador.RegistrationID);
                    push.SenderID = ConfigurationManager.AppSettings["SenderIDAndroid"];
                    push.ApplicationID = ConfigurationManager.AppSettings["ApplicationIDAndroid"];
                    push.Title = ConfigurationManager.AppSettings["TituloPushAndroid"];
                    push.Message = ConfigurationManager.AppSettings["MensagemPadraoPushAndroid"];
                    push.Data = json;
                    new PushFacade(PushNotification.Dominio.Enum.Platform.Android).Send(push);
                    //manda o push
                }
            }            
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
