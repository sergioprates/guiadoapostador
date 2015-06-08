using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces.Controllers;
using GuiaDoApostadorDominio.Interfaces.Repository;

namespace GuiaDoApostadorDominio.Controllers
{
    public class LotomaniaController : ILotomaniaController
    {
        private readonly ILotomaniaRepository _repository;

        public LotomaniaController(ILotomaniaRepository repository)
        {
            if (_repository == null)
            {
                _repository = repository;
            }
        }

        public Lotomania ConsultaApi()
        {
            return _repository.ConsultaApi();
        }

        public Lotomania Buscar(int id)
        {
            return _repository.Buscar(id);
        }

        public int Inserir(Lotomania entidade)
        {
            return _repository.Inserir(entidade);
        }

        public System.Collections.Generic.IList<Lotomania> Listar()
        {
            return _repository.Listar();
        }

        public bool Existe(int id)
        {
            return _repository.Existe(id);
        }
    }
}
