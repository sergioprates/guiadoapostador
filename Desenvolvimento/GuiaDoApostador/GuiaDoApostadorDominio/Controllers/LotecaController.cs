using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Interfaces.Controllers;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces.Repository;

namespace GuiaDoApostadorDominio.Controllers
{
    public class LotecaController :  ILotecaController
    {

        private readonly ILotecaRepository _repository;

        public LotecaController(ILotecaRepository repository)
        {
            if (_repository == null)
            {
                _repository = repository;
            }
        }

        public Loteca ConsultaApi()
        {
            return _repository.ConsultaApi();
        }

        public Loteca Buscar(int id)
        {
            return _repository.Buscar(id);
        }

        public int Inserir(Loteca entidade)
        {
            return _repository.Inserir(entidade);
        }

        public System.Collections.Generic.IList<Loteca> Listar()
        {
            return _repository.Listar();
        }


        public bool Existe(int id)
        {
            return _repository.Existe(id);
        }
    }
}
