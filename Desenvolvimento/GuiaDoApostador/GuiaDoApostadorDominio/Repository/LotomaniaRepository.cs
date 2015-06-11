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
    internal class LotomaniaRepository : RepositoryBase
    {
        internal Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/lotomania/json");
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
                        id = cadastraConcursoConcurso((Lotomania)obj, cn);

                        foreach (var dezena in ((Lotomania)obj).Dezenas)
                            cadastraDezenaConcurso(obj.ID, dezena, cn);

                        foreach (var premio in ((Lotomania)obj).Premios)
                            cadastraPremioConcurso(obj.ID, premio, cn);

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
            throw new System.NotImplementedException();
        }

        internal System.Collections.Generic.IList<Concurso> Listar()
        {
            throw new System.NotImplementedException();
        }

        internal bool Existe(int id)
        {
            return Convert.ToBoolean(cn.ExecuteScalar("sp_ExisteConcursoLotomania", new { @IdConcurso = id }, commandType: CommandType.StoredProcedure));
        }


        internal Concurso BuscarMaisRecente()
        {
            throw new NotImplementedException();
        }

        #region Métodos Privados
        
        private Concurso deserializaConcurso(dynamic obj)
        {
            Lotomania loteria = new Lotomania()
            {
                ID = obj.concurso.numero,
                Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                Cidade = obj.concurso.cidade,
                Local = obj.concurso.local,
                ValorAcumulado = Convert.ToDecimal(obj.concurso.valor_acumulado.ToString().Replace(".", "")),
                ArrecadacaoTotal = Convert.ToDecimal(obj.concurso.arrecadacao_total.ToString().Replace(".", "")),
                EspecialValorAcumulado = Convert.ToDecimal(obj.especial_pascoa_valor_acumulado.ToString().Replace(".", ""))
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
                    Acertos = 20,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_20.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_20.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 19,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_19.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_19.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 18,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_18.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_18.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 17,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_17.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_17.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 16,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_16.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_16.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 0,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_0.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_0.ganhadores.ToString().Replace(".", ""))
                },
            };

            loteria.ProximoConcurso = new ProximoConcurso()
            {
                Data = DateTime.ParseExact(obj.proximo_concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                ValorEstimado = Convert.ToDecimal(obj.proximo_concurso.valor_estimado.ToString().Replace(".", ""))
            };

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

            int id = Convert.ToInt32(cn.ExecuteScalar("sp_cadastraConcursoLotomania", paramList, commandType: CommandType.StoredProcedure));

            return id;
        }

        private void cadastraDezenaConcurso(int idConcurso, byte dezena, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@idConcurso", idConcurso);
            paramList.Add("@dezena", dezena);

            cn.Execute("sp_cadastraDezenaLotomania", paramList, commandType: CommandType.StoredProcedure);
        }

        private void cadastraPremioConcurso(int idConcurso, PremioPadrao premio, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@IdConcurso", idConcurso);
            paramList.Add("@Acertos", premio.Acertos);
            paramList.Add("@ValorPago", premio.ValorPago);
            paramList.Add("@Ganhadores", premio.Ganhadores);

            cn.Execute("sp_cadastraPremioLotomania", paramList, commandType: CommandType.StoredProcedure);
        }

        #endregion
    }
}
