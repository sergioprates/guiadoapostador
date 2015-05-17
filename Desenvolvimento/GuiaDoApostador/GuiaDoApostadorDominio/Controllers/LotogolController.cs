using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Interfaces.Controllers;
using GuiaDoApostadorDominio.Interfaces.Repository;
using GuiaDoApostadorDominio.Entities;

namespace GuiaDoApostadorDominio.Controllers
{
    public class LotogolController : ILotogolController
    {
       private readonly ILotogolRepository _repository;

       public LotogolController(ILotogolRepository repository)
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
