using System;
using System.Collections.Generic;
using GuiaDoApostadorDominio.Interfaces.Controllers;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces.Repository;

namespace GuiaDoApostadorDominio.Controllers
{
    public class TimemaniaController : ITimemaniaController
    {
        private readonly ITimemaniaRepository _repository;

        public TimemaniaController(ITimemaniaRepository repository)
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
