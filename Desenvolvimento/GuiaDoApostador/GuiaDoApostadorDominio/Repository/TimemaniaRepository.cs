using Dapper;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorInfra.Util;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Transactions;

namespace GuiaDoApostadorDominio.Repository
{
    internal class TimemaniaRepository : RepositoryBase
    {
        internal Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/timemania/json");
            return deserializaConcurso(obj);
        }

        internal int Inserir(Concurso obj)
        {
            object id;

            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    using (cn)
                    {
                        cn.Open();
                        id = cadastraConcursoConcurso((Timemania)obj, cn);

                        foreach (var dezena in ((Timemania)obj).Dezenas)
                            cadastraDezenaConcurso(obj.ID, dezena, cn);

                        foreach (var premio in ((Timemania)obj).Premios)
                            cadastraPremioConcurso(obj.ID, premio, cn);

                        cadastraTimeCoracao(obj.ID, ((Timemania)obj).TimeCoracao, cn);

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

        internal Concurso Buscar(int id)
        {
            throw new NotImplementedException();
        }

        internal IList<Concurso> Listar()
        {
            throw new NotImplementedException();
        }

        internal bool Existe(int id)
        {
            return Convert.ToBoolean(cn.ExecuteScalar("sp_ExisteConcursoTimemania", new { @IdConcurso = id }, commandType: CommandType.StoredProcedure));
        }


        internal Concurso BuscarMaisRecente()
        {
            throw new NotImplementedException();
        }

        #region Métodos Privados

        private Concurso deserializaConcurso(dynamic obj)
        {
            Timemania loteria = new Timemania()
            {
                ID = obj.concurso.numero,
                Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                Cidade = obj.concurso.cidade,
                Local = obj.concurso.local,
                ValorAcumulado = Convert.ToDecimal(obj.concurso.valor_acumulado.ToString().Replace(".", "")),
                ArrecadacaoTotal = Convert.ToDecimal(obj.concurso.arrecadacao_total.ToString().Replace(".", ""))
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
                    Acertos = 7,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_7.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_7.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 6,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_6.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_6.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 5,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_5.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_5.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 4,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_4.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_4.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 3,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_3.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_3.ganhadores.ToString().Replace(".", ""))
                },
            };

            loteria.ProximoConcurso = new ProximoConcurso()
            {
                Data = DateTime.ParseExact(obj.proximo_concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                ValorEstimado = Convert.ToDecimal(obj.proximo_concurso.valor_estimado.ToString().Replace(".", ""))
            };

            loteria.TimeCoracao = new TimeCoracao();
            loteria.TimeCoracao.Nome = obj.concurso.time_coracao.time;
            loteria.TimeCoracao.Ganhadores = obj.concurso.time_coracao.ganhadores;
            loteria.TimeCoracao.ValorPago = Convert.ToDecimal(obj.concurso.time_coracao.valor_pago.ToString().Replace(".", ""));

            loteria.ProximoConcursoFinalCinco = new ConcursoFinalCinco();
            loteria.ProximoConcursoFinalCinco.Numero = obj.concurso_final_cinco.numero;
            loteria.ProximoConcursoFinalCinco.ValorAcumulado = Convert.ToDecimal(obj.concurso_final_cinco.valor_acumulado.ToString().Replace(".", ""));

            return loteria;
        }

        private int cadastraConcursoConcurso(Concurso obj, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@IdConcurso", obj.ID);
            paramList.Add("@Data", obj.Data);
            paramList.Add("@Cidade", obj.Cidade);
            paramList.Add("@Local", obj.Local);
            paramList.Add("@ValorAcumulado", obj.ValorAcumulado);
            paramList.Add("@ArrecadacaoTotal", obj.ArrecadacaoTotal);
            paramList.Add("@EspecialValorAcumulado", obj.EspecialValorAcumulado);
            paramList.Add("@ProximoConcursoData", obj.ProximoConcurso.Data);
            paramList.Add("@ProximoConcursoValorEstimado", obj.ProximoConcurso.ValorEstimado);

            int id = Convert.ToInt32(cn.ExecuteScalar("sp_cadastraConcursoTimemania", paramList, commandType: CommandType.StoredProcedure));

            return id;
        }

        private void cadastraDezenaConcurso(int idConcurso, byte dezena, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@idConcurso", idConcurso);
            paramList.Add("@dezena", dezena);

            cn.Execute("sp_cadastraDezenaTimemania", paramList, commandType: CommandType.StoredProcedure);
        }

        private void cadastraPremioConcurso(int idConcurso, PremioPadrao premio, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@IdConcurso", idConcurso);
            paramList.Add("@Acertos", premio.Acertos);
            paramList.Add("@ValorPago", premio.ValorPago);
            paramList.Add("@Ganhadores", premio.Ganhadores);

            cn.Execute("sp_cadastraPremioTimemania", paramList, commandType: CommandType.StoredProcedure);
        }

        private void cadastraTimeCoracao(int idConcurso, TimeCoracao time, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@IdConcurso", idConcurso);
            paramList.Add("@TimeCoracao", time.Nome);
            paramList.Add("@ValorPago", time.ValorPago);
            paramList.Add("@Ganhadores", time.Ganhadores);

            cn.Execute("sp_cadastraTimeCoracaoTimemania", paramList, commandType: CommandType.StoredProcedure);
        }

        #endregion
    }
}
