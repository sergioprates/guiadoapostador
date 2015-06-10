using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Interfaces;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Repository;

namespace GuiaDoApostadorDominio.Controllers
{
    public class LotogolController : ILotogolController
    {
       private readonly LotogolRepository _repository = new LotogolRepository();

       public LotogolController()
       { }

       public Concurso ConsultaApi()
        {
            return _repository.ConsultaApi();
        }

       public Concurso Buscar(int id)
        {
            return _repository.Buscar(id);
        }

       public int Inserir(Concurso entidade)
        {
            return _repository.Inserir(entidade);
        }

       public System.Collections.Generic.IList<Concurso> Listar()
        {
            return _repository.Listar();
        }


        public bool Existe(int id)
        {
            return _repository.Existe(id);
        }
    }
}
