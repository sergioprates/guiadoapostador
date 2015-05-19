using GuiaDoApostadorDominio.Interfaces.Repository;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Dapper;
using GuiaDoApostadorDominio.Entities;

namespace GuiaDoApostadorDominio.Repository
{
    internal class PremioPadraoRepository : RepositoryBase
    {

        //chavear método, existirá um método de inserir para cada loteria.
        public void Inserir(Entities.PremioPadrao obj, int idConcurso, Loteria tipo)
        {
            switch (tipo)
            {
                case Loteria.DuplaSena:
                    break;
                case Loteria.Federal:
                    break;
                case Loteria.Loteca:
                    break;
                case Loteria.Lotofacil:
                    break;
                case Loteria.Lotogol:
                    break;
                case Loteria.Lotomania:
                    break;
                case Loteria.MegaSena:
                    InserirMegaSena(obj, idConcurso);
                    break;
                case Loteria.Quina:
                    break;
                case Loteria.Timemania:
                    break;
                default:
                    break;
            }
        }

        private void InserirMegaSena(Entities.PremioPadrao obj, int idConcurso)
        {
            using (cn)
            {
                cn.Open();
                cn.Execute("sp_cadastraPremioPadraoMegaSena", new { obj, idConcurso = idConcurso }, commandType: CommandType.StoredProcedure);
            }
        }

        public Entities.PremioPadrao Buscar(int id)
        {
             throw new NotImplementedException();
        }

        public IList<Entities.PremioPadrao> Listar()
        {
            using (cn)
            {
                cn.Open();
                return cn.Query<PremioPadrao>("sp_listaPremioPadrao",null, commandType: CommandType.StoredProcedure).AsList<PremioPadrao>();
            }
        }

        public IList<Entities.PremioPadrao> Listar(int idConcurso)
        {
            using (cn)
            {
                cn.Open();
                return cn.Query<PremioPadrao>("sp_listaPremioPadraoPorConcurso", new { idConcurso = idConcurso }, commandType: CommandType.StoredProcedure).AsList<PremioPadrao>();
            }
        }

        public bool Existe(int id)
        {
            throw new NotImplementedException();
        }
    }
}
