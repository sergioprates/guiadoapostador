using GuiaDoApostadorDominio.Interfaces;
using System.Net;
using System.IO;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Repository;
using System.Collections.Generic;

namespace GuiaDoApostadorDominio.Controllers
{
    public class MegaSenaController : IMegaSenaController
    {
        private MegaSenaRepository _repository = new MegaSenaRepository();
        
        public MegaSenaController()
        { }

        public Concurso ConsultaApi()
        {
            return _repository.ConsultaApi();
        }

        public Concurso BuscarMaisRecente()
        {
            return _repository.BuscarMaisRecente();
        }

        public Concurso Buscar(int id)
        {
            return _repository.Buscar(id);
        }

        public int Inserir(Concurso entidade)
        {
            entidade.ID = _repository.Inserir(entidade);

            return entidade.ID;
        }

        public IList<Concurso> Listar()
        {
            return _repository.Listar();
        }

        public bool Existe(int id)
        {
            return _repository.Existe(id);
        }

        public object ObtemEstatistica(Estatistica estat)
        {
            object estatistica = null;

            switch (estat)
            {
                case Estatistica.NumerosQueMenosSairam:
                    var valor = _repository.GetNumerosQueMenosSairam();
                    valor.Sort();
                    estatistica = valor;
                    break;
            }

            return estatistica;
        }
    }
}
