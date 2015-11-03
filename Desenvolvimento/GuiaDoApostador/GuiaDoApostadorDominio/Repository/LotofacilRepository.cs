using Dapper;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorInfra.Util;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Transactions;

namespace GuiaDoApostadorDominio.Repository
{
    internal class LotofacilRepository : RepositoryBase
    {
        internal Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/lotofacil/json");

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
                        id = cadastraConcursoConcurso((Lotofacil)obj);

                        foreach (var dezena in ((Lotofacil)obj).Dezenas)
                            cadastraDezenaConcurso(obj.ID, dezena);

                        foreach (var premio in ((Lotofacil)obj).Premios)
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
            return Convert.ToBoolean(cn.ExecuteScalar("sp_existeConcursoLotofacil", new { @IdConcurso = id }, commandType: CommandType.StoredProcedure));
        }

        internal Dictionary<byte, int> GetNumerosQueMenosSairam()
        {
            Dictionary<byte, int> numeros = new Dictionary<byte, int>();

            using (cn)
            {
                using (IDataReader dr = cn.ExecuteReader("sp_numerosQueMenosSairamLotofacil", null, commandType: CommandType.StoredProcedure))
                {
                    while (dr.Read())
                    {
                        numeros.Add(Convert.ToByte(dr["dezena"]), Convert.ToByte(dr["quantidade"]));
                    }
                }
            }

            return numeros;
        }

        internal Dictionary<byte, int> GetNumerosQueMaisSairam()
        {
            Dictionary<byte, int> numeros = new Dictionary<byte, int>();

            using (cn)
            {
                using (IDataReader dr = cn.ExecuteReader("sp_numerosQueMaisSairamLotofacil", null, commandType: CommandType.StoredProcedure))
                {
                    while (dr.Read())
                    {
                        numeros.Add(Convert.ToByte(dr["dezena"]), Convert.ToByte(dr["quantidade"]));
                    }
                }
            }

            return numeros;
        }

        internal List<byte> GetPalpiteProximoSorteio(int? idConcurso)
        {
            List<byte> numeros = new List<byte>();

            using (cn)
            {
                using (IDataReader dr = cn.ExecuteReader("sp_palpiteProximoSorteioLotofacil", new { @idConcurso = idConcurso }, commandType: CommandType.StoredProcedure))
                {
                    while (dr.Read())
                    {
                        numeros.Add(Convert.ToByte(dr["dezena"]));
                    }
                }
            }

            return numeros;
        }

        internal Dictionary<byte, byte> GeraPalpiteProxSorteio(int sorteiosAnteriores)
        {
            Dictionary<byte, byte> dic = new Dictionary<byte, byte>();

            using (cn)
            {
                using (IDataReader dr = cn.ExecuteReader("sp_geraPalpiteProximoSorteioLotofacil", new { @sorteiosAnteriores = sorteiosAnteriores }, commandType: CommandType.StoredProcedure))
                {
                    while (dr.Read())
                    {
                        dic.Add
                        (
                            Convert.ToByte(dr["dezena"]),
                            Convert.ToByte(dr["quantidade"])
                        );
                    }
                }
            }

            return dic;
        }

        internal void InserirPalpite(int idConcurso, List<byte> palpite)
        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    using (cn)
                    {
                        cn.Open();

                        foreach (var dezena in palpite)
                            cadastraPalpiteConcurso(idConcurso, dezena);

                        scope.Complete();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Métodos Privados

        private Concurso deserializaConcurso(dynamic obj)
        {
            Lotofacil loteria = new Lotofacil()
            {
                ID = obj.concurso.numero,
                Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                Cidade = obj.concurso.cidade,
                Local = obj.concurso.local,
                ValorAcumulado = Convert.ToDecimal(obj.concurso.valor_acumulado.ToString().Replace(".", "")),
                ArrecadacaoTotal = Convert.ToDecimal(obj.concurso.arrecadacao_total.ToString().Replace(".", "")),
                EspecialValorAcumulado = Convert.ToDecimal(obj.especial_independencia_valor_acumulado.ToString().Replace(".", "")),

            };

            loteria.Dezenas = new List<byte>();
            foreach (byte dezena in obj.concurso.numeros_sorteados)
            {
                loteria.Dezenas.Add(dezena);
            }

            loteria.ProximoConcurso = new ProximoConcurso()
            {
                Data = DateTime.ParseExact(obj.proximo_concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                ValorEstimado = Convert.ToDecimal(obj.proximo_concurso.valor_estimado.ToString().Replace(".", ""))
            };

            loteria.Premios = new List<PremioPadrao>()
            {
                new PremioPadrao()
                {
                    Acertos = 15,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_15.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_15.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 14,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_14.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_14.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 13,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_13.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_13.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 12,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_12.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_12.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 11,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_11.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_11.ganhadores.ToString().Replace(".", ""))
                },
            };

            loteria.ProximoConcurso = new ProximoConcurso()
            {
                Data = DateTime.ParseExact(obj.proximo_concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                ValorEstimado = Convert.ToDecimal(obj.proximo_concurso.valor_estimado.ToString().Replace(".", ""))
            };

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

            int id = Convert.ToInt32(cn.ExecuteScalar("sp_cadastraConcursoLotofacil", paramList, commandType: CommandType.StoredProcedure));

            return id;
        }

        private void cadastraDezenaConcurso(int idConcurso, byte dezena)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@idConcurso", idConcurso);
            paramList.Add("@dezena", dezena);

            cn.Execute("sp_cadastraDezenaLotofacil", paramList, commandType: CommandType.StoredProcedure);
        }

        private void cadastraPremioConcurso(int idConcurso, PremioPadrao premio)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@IdConcurso", idConcurso);
            paramList.Add("@Acertos", premio.Acertos);
            paramList.Add("@ValorPago", premio.ValorPago);
            paramList.Add("@Ganhadores", premio.Ganhadores);

            cn.Execute("sp_cadastraPremioLotofacil", paramList, commandType: CommandType.StoredProcedure);
        }

        private void cadastraPalpiteConcurso(int idConcurso, byte dezena)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@idConcurso", idConcurso);
            paramList.Add("@dezena", dezena);

            cn.Execute("sp_cadastraPalpiteLotofacil", paramList, commandType: CommandType.StoredProcedure);
        }

        private Concurso buscar(int? id)
        {
            Lotofacil con = new Lotofacil();

            try
            {
                using (cn)
                {
                    cn.Open();

                    using (IDataReader dr = cn.ExecuteReader("sp_buscaConcursoLotofacil", new { @IdConcurso = id }, commandType: CommandType.StoredProcedure))
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
                            con.EspecialValorAcumulado = Convert.ToDecimal(dr["especialValorAcumulado"]);
                        }
                    }

                    if (con.ID != 0)
                    {
                        using (IDataReader dr = cn.ExecuteReader("sp_buscaDezenasLotofacil", new { @IdConcurso = con.ID }, commandType: CommandType.StoredProcedure))
                        {
                            con.Dezenas = new List<byte>();

                            while (dr.Read())
                            {
                                con.Dezenas.Add(Convert.ToByte(dr["dezena"]));
                            }
                        }

                        using (IDataReader dr = cn.ExecuteReader("sp_buscaPremiosLotofacil", new { @IdConcurso = con.ID }, commandType: CommandType.StoredProcedure))
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
