﻿using GuiaDoApostadorDominio.Interfaces.Controllers;
using System.Net;
using System.IO;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Repository;
using GuiaDoApostadorDominio.Interfaces.Repository;

namespace GuiaDoApostadorDominio.Controllers
{
    public class MegaSenaController : IMegaSenaController
    {
        private MegaSenaRepository _repository = new MegaSenaRepository();

        public MegaSenaController()
        {
            
        }

        public MegaSena ConsultaApi()
        {
            return _repository.ConsultaApi();
        }

        public MegaSena Buscar(int id)
        {
            return _repository.Buscar(id);
        }

        public int Inserir(MegaSena entidade)
        {
            MegaSena loteria = (MegaSena)entidade;
            entidade.ID = _repository.Inserir(entidade);

            return entidade.ID;
        }

        public System.Collections.Generic.IList<MegaSena> Listar()
        {
            return _repository.Listar();
        }

        public bool Existe(int id)
        {
            return _repository.Existe(id);
        }
    }
}
