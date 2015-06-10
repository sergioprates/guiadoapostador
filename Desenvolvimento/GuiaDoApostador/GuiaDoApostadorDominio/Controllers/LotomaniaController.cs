﻿using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces.Controllers;
using GuiaDoApostadorDominio.Interfaces.Repository;

namespace GuiaDoApostadorDominio.Controllers
{
    public class LotomaniaController : ILotomaniaController
    {
        private readonly ILotomaniaRepository _repository;

        public LotomaniaController()
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
