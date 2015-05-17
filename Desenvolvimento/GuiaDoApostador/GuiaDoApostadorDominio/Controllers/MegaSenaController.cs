using GuiaDoApostadorDominio.Interfaces.Controllers;
using System.Net;
using System.IO;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Repository;
using GuiaDoApostadorDominio.Interfaces.Repository;

namespace GuiaDoApostadorDominio.Controllers
{
    public class MegaSenaController :  IMegaSenaController
    {
        private readonly IMegaSenaRepository _repository;

        public MegaSenaController(IMegaSenaRepository repository)
        {
            if (_repository == null)
            {
                _repository = repository;
            }
        }

        public Concurso ConsultaApi()
        {
            return _repository.ConsultaApi();
        }

        public Entities.Concurso Buscar(int id)
        {
            return _repository.Buscar(id);
        }

        public int Inserir(Entities.Concurso entidade)
        {
            return _repository.Inserir(entidade);
        }

        public System.Collections.Generic.IList<Entities.Concurso> Listar()
        {
            return _repository.Listar();
        }


        public bool Existe(int id)
        {
            return _repository.Existe(id);
        }
    }
}
