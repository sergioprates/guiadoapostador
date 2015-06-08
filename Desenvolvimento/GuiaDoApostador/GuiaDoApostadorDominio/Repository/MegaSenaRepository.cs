using System;
using System.Collections.Generic;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces.Repository;
using System.Globalization;
using GuiaDoApostadorInfra.Util;
using Dapper;
using System.Data;
using System.Transactions;
using System.Data.SqlClient;

namespace GuiaDoApostadorDominio.Repository
{
    internal class MegaSenaRepository : RepositoryBase, IMegaSenaRepository
    {
        public int Inserir(MegaSena obj)
        {
            object id;

            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    using (cn)
                    {
                        cn.Open();
                        id = cadastraConcursoMegaSena(obj, cn);
                        scope.Complete();
                    }
                }
            }
            catch (Exception ex)
            {   
                throw ex;
            }

            return Convert.ToInt32(id);
        }

        public MegaSena Buscar(int id)
        {
            throw new NotImplementedException();
        }

        public IList<MegaSena> Listar()
        {
            throw new NotImplementedException();
        }

        public bool Existe(int id)
        {
            throw new NotImplementedException();
        }

        public MegaSena ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/megasena/json");
            return deserializaConcurso(obj);
        }

        public MegaSena BuscarMaisRecente()
        {
            throw new NotImplementedException();
        }

        #region Métodos Privados

        private Concurso deserializaConcurso(dynamic obj)
        {    
            MegaSena loteria = new MegaSena()
            {
                ID = obj.concurso.numero,
                Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                Cidade = obj.concurso.cidade,
                Local = obj.concurso.local,
                ValorAcumulado = Convert.ToDecimal(obj.concurso.valor_acumulado.ToString().Replace(".", "")),
                ArrecadacaoTotal = Convert.ToDecimal(obj.concurso.arrecadacao_total.ToString().Replace(".", "")),
                EspecialValorAcumulado = Convert.ToDecimal(obj.mega_virada_valor_acumulado.ToString().Replace(".", ""))                
            };

            loteria.Dezenas = new List<byte>();
            foreach (byte dezena in obj.concurso.numeros_sorteados)
            {
                loteria.Dezenas.Add(dezena);
            }

            loteria.Premios = new List<PremioPadrao>()
            {
                new PremioPadrao()
                {
                    Acertos = 6,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.sena.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.sena.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 5,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.quina.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.quina.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 4,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.quadra.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.quadra.ganhadores.ToString().Replace(".", ""))
                },
            };

            loteria.ProximoConcurso = new ProximoConcurso()
            {
                Data = DateTime.ParseExact(obj.proximo_concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                ValorEstimado = Convert.ToDecimal(obj.proximo_concurso.valor_estimado.ToString().Replace(".", ""))
            };

            return loteria;
        }

        private int cadastraConcursoMegaSena(MegaSena obj, SqlConnection conn)
        {
            int id = Convert.ToInt32(cn.ExecuteScalar("sp_cadastraConcursoMegaSena", new { obj }, commandType: CommandType.StoredProcedure));

            foreach (var dezena in obj.Dezenas)
            {
                cadastraDezenaMegaSena(id, dezena, conn);
            }

            foreach (var premio in obj.Premios)
            {
                cadastraPremioMegaSena(id, premio, conn);
            }

            return id;
        }

        private void cadastraDezenaMegaSena(int idConcurso, byte dezena, SqlConnection conn)
        {
            List<SqlParameter> paramList = new List<SqlParameter>();
            
            SqlParameter paramConcurso = new SqlParameter("@idConcurso", idConcurso);
            SqlParameter paramDezena = new SqlParameter("@dezena", dezena);

            paramList.Add(paramConcurso);
            paramList.Add(paramDezena);

            cn.Execute("sp_cadastraDezenaMegaSena", paramList, commandType: CommandType.StoredProcedure);
        }

        private void cadastraPremioMegaSena(int idConcurso, PremioPadrao premio, SqlConnection conn)
        {
            List<SqlParameter> paramList = new List<SqlParameter>();

            SqlParameter paramConcurso = new SqlParameter("@idConcurso", idConcurso);
            SqlParameter paramAcertos = new SqlParameter("@dezena", premio.Acertos);
            SqlParameter paramValorPago = new SqlParameter("@dezena", premio.ValorPago);
            SqlParameter paramGanhadores = new SqlParameter("@dezena", premio.Ganhadores);

            paramList.Add(paramConcurso);
            paramList.Add(paramAcertos);
            paramList.Add(paramValorPago);
            paramList.Add(paramGanhadores);

            cn.Execute("sp_cadastraPremioMegaSena", paramList, commandType: CommandType.StoredProcedure);
        }

        #endregion
    }
}
