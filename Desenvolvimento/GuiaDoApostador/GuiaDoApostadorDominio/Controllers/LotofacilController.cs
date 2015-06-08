﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Interfaces.Controllers;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces.Repository;

namespace GuiaDoApostadorDominio.Controllers
{
    public class LotofacilController : ILotofacilController
    {
        private readonly ILotofacilRepository _repository;

        public LotofacilController(ILotofacilRepository repository)
        {
            if (_repository == null)
            {
                _repository = repository;
            }
        }

        public Lotofacil ConsultaApi()
        {
            return _repository.ConsultaApi();
        }

        public Lotofacil Buscar(int id)
        {
            return _repository.Buscar(id);
        }

        public int Inserir(Lotofacil entidade)
        {
            return _repository.Inserir(entidade);
        }

        public System.Collections.Generic.IList<Lotofacil> Listar()
        {
            return _repository.Listar();
        }

        public bool Existe(int id)
        {
            return _repository.Existe(id);
        }
    }
}
