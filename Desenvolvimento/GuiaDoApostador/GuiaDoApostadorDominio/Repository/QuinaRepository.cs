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
    internal class QuinaRepository : RepositoryBase
    {
        internal Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/quina/json");

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
                        id = cadastraConcursoConcurso((Quina)obj);

                        foreach (var dezena in ((Quina)obj).Dezenas)
                            cadastraDezenaConcurso(obj.ID, dezena);

                        foreach (var premio in ((Quina)obj).Premios)
                            cadastraPremioConcurso(obj.ID, premio);

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

        internal Concurso BuscarMaisRecente()
        {
            return buscar(null);
        }

        internal Concurso Buscar(int id)
        {
            return buscar(id);
        }

        internal IList<Concurso> Listar()
        {
            throw new NotImplementedException();
        }

        internal bool Existe(int id)
        {
            return Convert.ToBoolean(cn.ExecuteScalar("sp_existeConcursoQuina", new { @IdConcurso = id }, commandType: CommandType.StoredProcedure));
        }

        internal List<byte> GetNumerosQueMenosSairam()
        {
            List<byte> numeros = new List<byte>();

            using (cn)
            {
                using (IDataReader dr = cn.ExecuteReader("sp_numerosQueMenosSairamQuina", null, commandType: CommandType.StoredProcedure))
                {
                    while (dr.Read())
                    {
                        numeros.Add(Convert.ToByte(dr["dezena"]));
                    }
                }
            }

            return numeros;
        }

        #region Métodos Privados
        
        private Concurso deserializaConcurso(dynamic obj)
        {
            Quina loteria = new Quina()
            {

                ID = obj.concurso.numero,
                Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                Cidade = obj.concurso.cidade,
                Local = obj.concurso.local,
                ValorAcumulado = Convert.ToDecimal(obj.concurso.valor_acumulado.ToString().Replace(".", "")),
                ArrecadacaoTotal = Convert.ToDecimal(obj.concurso.arrecadacao_total.ToString().Replace(".", "")),
                ProximoConcurso = new ProximoConcurso(DateTime.ParseExact(obj.proximo_concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")), Convert.ToDecimal(obj.proximo_concurso.valor_estimado.ToString().Replace(".", ""))),
                EspecialValorAcumulado = Convert.ToDecimal(obj.especial_sao_joao_valor_acumulado.ToString().Replace(".", "")),

                Premios = new List<PremioPadrao>()
                {
                new PremioPadrao(5, Convert.ToDecimal(obj.concurso.premiacao.quina.valor_pago.ToString().Replace(".", "")), Convert.ToInt32(obj.concurso.premiacao.quina.ganhadores.ToString().Replace(".", ""))),

                new PremioPadrao(4, decimal.Parse(obj.concurso.premiacao.quadra.valor_pago.ToString().Replace(".", "")), Convert.ToInt32(obj.concurso.premiacao.quadra.ganhadores.ToString().Replace(".", ""))),

                new PremioPadrao(3, decimal.Parse(obj.concurso.premiacao.terno.valor_pago.ToString().Replace(".", "")), Convert.ToInt32(obj.concurso.premiacao.terno.ganhadores.ToString().Replace(".", "")))
                }
            };

            loteria.Dezenas = new List<byte>();

            foreach (byte dezena in obj.concurso.numeros_sorteados)
            {
                loteria.Dezenas.Add(dezena);
            }

            return loteria;
        }

        private int cadastraConcursoConcurso(Concurso obj)
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

            int id = Convert.ToInt32(cn.ExecuteScalar("sp_cadastraConcursoQuina", paramList, commandType: CommandType.StoredProcedure));

            return id;
        }

        private void cadastraDezenaConcurso(int idConcurso, byte dezena)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@idConcurso", idConcurso);
            paramList.Add("@dezena", dezena);

            cn.Execute("sp_cadastraDezenaQuina", paramList, commandType: CommandType.StoredProcedure);
        }

        private void cadastraPremioConcurso(int idConcurso, PremioPadrao premio)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@IdConcurso", idConcurso);
            paramList.Add("@Acertos", premio.Acertos);
            paramList.Add("@ValorPago", premio.ValorPago);
            paramList.Add("@Ganhadores", premio.Ganhadores);

            cn.Execute("sp_cadastraPremioQuina", paramList, commandType: CommandType.StoredProcedure);
        }

        private Concurso buscar(int? id)
        {
            Quina con = new Quina();

            try
            {
                using (cn)
                {
                    cn.Open();

                    using (IDataReader dr = cn.ExecuteReader("sp_buscaConcursoQuina", new { @IdConcurso = id }, commandType: CommandType.StoredProcedure))
                    {
                        if (dr.Read())
                        {
                            con.ProximoConcurso = new ProximoConcurso();

                            con.ID = Convert.ToInt32(dr["idConcurso"]);
                            con.Data = Convert.ToDateTime(dr["data"]);
                            con.Cidade = Convert.ToString(dr["cidade"]);
                            con.Local = Convert.ToString(dr["local"]);
                            con.ValorAcumulado = Convert.ToDecimal(dr["valorAcumulado"]);
                            con.ArrecadacaoTotal = Convert.ToDecimal(dr["arrecadacaoTotal"]);
                            con.ProximoConcurso.Data = Convert.ToDateTime(dr["proximoConcursoData"]);
                            con.ProximoConcurso.ValorEstimado = Convert.ToDecimal(dr["proximoConcursoValorEstimado"]);
                            con.EspecialValorAcumulado = dr["especialValorAcumulado"] == DBNull.Value ? (decimal?)null : Convert.ToDecimal(dr["especialValorAcumulado"]);
                        }
                    }

                    if (con.ID != 0)
                    {
                        using (IDataReader dr = cn.ExecuteReader("sp_buscaDezenasQuina", new { @IdConcurso = con.ID }, commandType: CommandType.StoredProcedure))
                        {
                            con.Dezenas = new List<byte>();

                            while (dr.Read())
                            {
                                con.Dezenas.Add(Convert.ToByte(dr["dezena"]));
                            }
                        }

                        using (IDataReader dr = cn.ExecuteReader("sp_buscaPremiosQuina", new { @IdConcurso = con.ID }, commandType: CommandType.StoredProcedure))
                        {
                            con.Premios = new List<PremioPadrao>();

                            while (dr.Read())
                            {
                                PremioPadrao premio = new PremioPadrao()
                                {
                                    Acertos = Convert.ToByte(dr["acertos"]),
                                    Ganhadores = Convert.ToInt32(dr["ganhadores"]),
                                    ValorPago = Convert.ToDecimal(dr["valorPago"])
                                };

                                con.Premios.Add(premio);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return con;
        }

        #endregion
    }
}
