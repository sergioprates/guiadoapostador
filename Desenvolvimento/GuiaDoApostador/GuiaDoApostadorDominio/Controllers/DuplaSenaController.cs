using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Interfaces.Controllers;
using GuiaDoApostadorDominio.Interfaces.Repository;
using GuiaDoApostadorDominio.Entities;

namespace GuiaDoApostadorDominio.Controllers
{
    public class DuplaSenaController : IDuplaSenaController
    {
        private readonly IDuplaSenaRepository _repository;

        public DuplaSenaController(IDuplaSenaRepository repository)
        {
            if (_repository == null)
            {
                _repository = repository;
            }
        }

        public DuplaSena ConsultaApi()
        {
            return _repository.ConsultaApi();
        }

        public DuplaSena Buscar(int id)
        {
            return _repository.Buscar(id);
        }

        public int Inserir(DuplaSena entidade)
        {
            return _repository.Inserir(entidade);
        }

        public System.Collections.Generic.IList<DuplaSena> Listar()
        {
            return _repository.Listar();
        }

        public bool Existe(int id)
        {
            return _repository.Existe(id);
        }
    }
}
