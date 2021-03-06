﻿using Dapper;
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
    internal class DuplaSenaRepository : RepositoryBase
    {
        internal Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/duplasena/json");
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
                        id = cadastraConcursoConcurso((DuplaSena)obj);

                        foreach (var dezena in ((DuplaSena)obj).Dezenas)
                            cadastraDezenaConcurso(obj.ID, dezena);

                        foreach (var premio in ((DuplaSena)obj).Premios)
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
            return Convert.ToBoolean(cn.ExecuteScalar("sp_existeConcursoDuplaSena", new { @IdConcurso = id }, commandType: CommandType.StoredProcedure));
        }

        internal Dictionary<byte, int> GetNumerosQueMenosSairam()
        {
            Dictionary<byte, int> numeros = new Dictionary<byte, int>();

            using (cn)
            {
                using (IDataReader dr = cn.ExecuteReader("sp_numerosQueMenosSairamDuplaSena", null, commandType: CommandType.StoredProcedure))
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
                using (IDataReader dr = cn.ExecuteReader("sp_numerosQueMaisSairamDuplaSena", null, commandType: CommandType.StoredProcedure))
                {
                    while (dr.Read())
                    {
                        numeros.Add(Convert.ToByte(dr["dezena"]), Convert.ToByte(dr["quantidade"]));
                    }
                }
            }

            return numeros;
        }

        internal List<DezenaDuplaSena> GetPalpiteProximoSorteio(int? idConcurso)
        {
            List<DezenaDuplaSena> numeros = new List<DezenaDuplaSena>();

            using (cn)
            {
                using (IDataReader dr = cn.ExecuteReader("sp_palpiteProximoSorteioDuplaSena", new { @idConcurso = idConcurso }, commandType: CommandType.StoredProcedure))
                {
                    while (dr.Read())
                    {
                        DezenaDuplaSena numero = new DezenaDuplaSena();
                        numero.Dezena = Convert.ToByte(dr["dezena"]);
                        numero.Sorteio = Convert.ToByte(dr["sorteio"]);
                        
                        numeros.Add(numero);
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
                using (IDataReader dr = cn.ExecuteReader("sp_geraPalpiteProximoSorteioDuplaSena", new { @sorteiosAnteriores = sorteiosAnteriores }, commandType: CommandType.StoredProcedure))
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

        internal void InserirPalpite(int idConcurso, List<DezenaDuplaSena> palpite)
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
            DuplaSena loteria = new DuplaSena()
            {
                ID = obj.concurso.numero,
                Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                Cidade = obj.concurso.cidade,
                Local = obj.concurso.local,
                ValorAcumulado = Convert.ToDecimal(obj.concurso.valor_acumulado.ToString().Replace(".", "")),
                ArrecadacaoTotal = Convert.ToDecimal(obj.concurso.arrecadacao_total.ToString().Replace(".", ""))
            };

            loteria.Dezenas = new List<DezenaDuplaSena>();

            foreach (byte dezena in obj.concurso.numeros_sorteados_1)
            {
                DezenaDuplaSena d = new DezenaDuplaSena()
                {
                    Sorteio = 1,
                    Dezena = dezena
                };

                loteria.Dezenas.Add(d);
            }

            foreach (byte dezena in obj.concurso.numeros_sorteados_2)
            {
                DezenaDuplaSena d = new DezenaDuplaSena()
                {
                    Sorteio = 2,
                    Dezena = dezena
                };

                loteria.Dezenas.Add(d);
            }
            
            loteria.Premios = new List<PremioDuplaSena>()
            {
                new PremioDuplaSena()
                {
                    Acertos = 6,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao_1.sena.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao_1.sena.ganhadores.ToString().Replace(".", "")),
                    Sorteio = 1
                },
                new PremioDuplaSena()
                {
                    Acertos = 5,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao_1.quina.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao_1.quina.ganhadores.ToString().Replace(".", "")),
                    Sorteio = 1
                },
                new PremioDuplaSena()
                {
                    Acertos = 4,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao_1.quadra.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao_1.quadra.ganhadores.ToString().Replace(".", "")),
                    Sorteio = 1
                },
                new PremioDuplaSena()
                {
                    Acertos = 6,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao_2.sena.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao_2.sena.ganhadores.ToString().Replace(".", "")),
                    Sorteio = 2
                },
                new PremioDuplaSena()
                {
                    Acertos = 5,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao_2.quina.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao_2.quina.ganhadores.ToString().Replace(".", "")),
                    Sorteio = 2
                },
                new PremioDuplaSena()
                {
                    Acertos = 4,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao_2.quadra.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao_2.quadra.ganhadores.ToString().Replace(".", "")),
                    Sorteio = 2
                }
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

            int id = Convert.ToInt32(cn.ExecuteScalar("sp_cadastraConcursoDuplaSena", paramList, commandType: CommandType.StoredProcedure));

            return id;
        }

        private void cadastraDezenaConcurso(int idConcurso, DezenaDuplaSena dezena)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@idConcurso", idConcurso);
            paramList.Add("@Sorteio", dezena.Sorteio);
            paramList.Add("@dezena", dezena.Dezena);

            cn.Execute("sp_cadastraDezenaDuplaSena", paramList, commandType: CommandType.StoredProcedure);
        }

        private void cadastraPremioConcurso(int idConcurso, PremioDuplaSena premio)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@idConcurso", idConcurso);
            paramList.Add("@Sorteio", premio.Sorteio);
            paramList.Add("@Acertos", premio.Acertos);
            paramList.Add("@ValorPago", premio.ValorPago);
            paramList.Add("@Ganhadores", premio.Ganhadores);

            cn.Execute("sp_cadastraPremioDuplaSena", paramList, commandType: CommandType.StoredProcedure);
        }

        private void cadastraPalpiteConcurso(int idConcurso, DezenaDuplaSena dezena)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@idConcurso", idConcurso);
            paramList.Add("@sorteio", dezena.Sorteio);
            paramList.Add("@dezena", dezena.Dezena);

            cn.Execute("sp_cadastraPalpiteDuplaSena", paramList, commandType: CommandType.StoredProcedure);
        }

        private Concurso buscar(int? id)
        {
            DuplaSena con = new DuplaSena();

            try
            {
                using (cn)
                {
                    cn.Open();

                    using (IDataReader dr = cn.ExecuteReader("sp_buscaConcursoDuplaSena", new { @IdConcurso = id }, commandType: CommandType.StoredProcedure))
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
                        using (IDataReader dr = cn.ExecuteReader("sp_buscaDezenasDuplaSena", new { @IdConcurso = con.ID }, commandType: CommandType.StoredProcedure))
                        {
                            con.Dezenas = new List<DezenaDuplaSena>();

                            while (dr.Read())
                            {
                                DezenaDuplaSena dezena = new DezenaDuplaSena()
                                {
                                    Sorteio = Convert.ToByte(dr["sorteio"]),
                                    Dezena = Convert.ToByte(dr["dezena"]),
                                };

                                con.Dezenas.Add(dezena);
                            }
                        }

                        using (IDataReader dr = cn.ExecuteReader("sp_buscaPremiosDuplaSena", new { @IdConcurso = con.ID }, commandType: CommandType.StoredProcedure))
                        {
                            con.Premios = new List<PremioDuplaSena>();

                            while (dr.Read())
                            {
                                PremioDuplaSena premio = new PremioDuplaSena()
                                {
                                    Sorteio = Convert.ToByte(dr["sorteio"]),
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
