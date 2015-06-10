using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Interfaces.Controllers;
using GuiaDoApostadorDominio.Interfaces.Repository;
using GuiaDoApostadorDominio.Entities;

namespace GuiaDoApostadorDominio.Controllers
{
    public class QuinaController : IQuinaController
    {
        private readonly IQuinaRepository _repository;

        public QuinaController()
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
