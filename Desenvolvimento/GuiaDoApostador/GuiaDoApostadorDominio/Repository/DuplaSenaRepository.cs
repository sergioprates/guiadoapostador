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
                        id = cadastraConcursoConcurso((DuplaSena)obj, cn);

                        foreach (var dezena in ((DuplaSena)obj).Dezenas)
                            cadastraDezenaConcurso(obj.ID, dezena, cn);

                        foreach (var premio in ((DuplaSena)obj).Premios)
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
            throw new NotImplementedException();
        }

        internal IList<Concurso> Listar()
        {
            throw new NotImplementedException();
        }

        internal bool Existe(int id)
        {
            return Convert.ToBoolean(cn.ExecuteScalar("sp_ExisteConcursoDuplaSena", new { @IdConcurso = id }, commandType: CommandType.StoredProcedure));
        }


        internal Concurso BuscarMaisRecente()
        {
            throw new NotImplementedException();
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
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao_1.sena.ganhadores.ToString().Replace(".", ""))
                },
                new PremioDuplaSena()
                {
                    Acertos = 5,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao_1.quina.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao_1.quina.ganhadores.ToString().Replace(".", ""))
                },
                new PremioDuplaSena()
                {
                    Acertos = 4,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao_1.quadra.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao_1.quadra.ganhadores.ToString().Replace(".", ""))
                },
                new PremioDuplaSena()
                {
                    Acertos = 6,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao_2.sena.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao_2.sena.ganhadores.ToString().Replace(".", ""))
                },
                new PremioDuplaSena()
                {
                    Acertos = 5,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao_2.quina.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao_2.quina.ganhadores.ToString().Replace(".", ""))
                },
                new PremioDuplaSena()
                {
                    Acertos = 4,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao_2.quadra.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao_2.quadra.ganhadores.ToString().Replace(".", ""))
                }
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

            int id = Convert.ToInt32(cn.ExecuteScalar("sp_cadastraConcursoDuplaSena", paramList, commandType: CommandType.StoredProcedure));

            return id;
        }

        private void cadastraDezenaConcurso(int idConcurso, DezenaDuplaSena dezena, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@idConcurso", idConcurso);
            paramList.Add("@Sorteio", dezena.Sorteio);
            paramList.Add("@dezena", dezena.Dezena);

            cn.Execute("sp_cadastraDezenaDuplaSena", paramList, commandType: CommandType.StoredProcedure);
        }

        private void cadastraPremioConcurso(int idConcurso, PremioDuplaSena premio, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@idConcurso", idConcurso);
            paramList.Add("@Sorteio", premio.Acertos);
            paramList.Add("@Acertos", premio.Acertos);
            paramList.Add("@ValorPago", premio.ValorPago);
            paramList.Add("@Ganhadores", premio.Ganhadores);

            cn.Execute("sp_cadastraPremioDuplaSena", paramList, commandType: CommandType.StoredProcedure);
        }

        #endregion
    }
}
