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

       public Lotogol ConsultaApi()
        {
            return _repository.ConsultaApi();
        }

       public Lotogol Buscar(int id)
        {
            return _repository.Buscar(id);
        }

       public int Inserir(Lotogol entidade)
        {
            return _repository.Inserir(entidade);
        }

       public System.Collections.Generic.IList<Lotogol> Listar()
        {
            return _repository.Listar();
        }


        public bool Existe(int id)
        {
            return _repository.Existe(id);
        }
    }
}
