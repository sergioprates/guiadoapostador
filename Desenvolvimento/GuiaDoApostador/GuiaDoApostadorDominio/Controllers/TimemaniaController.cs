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

        public Timemania ConsultaApi()
        {
            return _repository.ConsultaApi();
        }

        public Timemania Buscar(int id)
        {
            return _repository.Buscar(id);
        }

        public int Inserir(Timemania entidade)
        {
            return _repository.Inserir(entidade);
        }

        public System.Collections.Generic.IList<Timemania> Listar()
        {
            return _repository.Listar();
        }


        public bool Existe(int id)
        {
            return _repository.Existe(id);
        }
    }
}
