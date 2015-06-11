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
    internal class LotogolRepository : RepositoryBase
    {
        internal Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/lotogol/json");
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
                        id = cadastraConcursoConcurso((Lotogol)obj, cn);

                        foreach (var jogo in ((Lotogol)obj).Jogos)
                            cadastraJogoConcurso(obj.ID, jogo, cn);

                        foreach (var premio in ((Lotogol)obj).Premios)
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
            return Convert.ToBoolean(cn.ExecuteScalar("sp_ExisteConcursoLotogol", new { @IdConcurso = id }, commandType: CommandType.StoredProcedure));
        }


        internal Concurso BuscarMaisRecente()
        {
            throw new NotImplementedException();
        }

        #region Métodos Privados

        private Concurso deserializaConcurso(dynamic obj)
        {
            Lotogol loteria = new Lotogol()
            {
                ID = obj.concurso.numero,
                Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                ArrecadacaoTotal = Convert.ToDecimal(obj.concurso.arrecadacao_total.ToString().Replace(".", "")),
                ValorAcumuladoFaixa1 = Convert.ToDecimal(obj.concurso.valor_acumulado_faixa_1.ToString().Replace(".", "")),
                ValorAcumuladoFaixa2 = Convert.ToDecimal(obj.concurso.valor_acumulado_faixa_2.ToString().Replace(".", "")),
            };

            loteria.ProximoConcurso = new ProximoConcurso()
            {
                Data = DateTime.ParseExact(obj.proximo_concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                ValorEstimado = Convert.ToDecimal(obj.proximo_concurso.valor_estimado.ToString().Replace(".", ""))
            };

            loteria.Jogos = new List<JogoLotogol>()
            {
                new JogoLotogol(obj.concurso.jogos.jogo1.data.ToString())
                {
                     NumeroJogo = 1,
                     Time1 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo1.time1.gols,
                         Time = (string)obj.concurso.jogos.jogo1.time1.time
                     },
                     Time2 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo1.time2.gols,
                         Time = (string)obj.concurso.jogos.jogo1.time2.time
                     }
                },
                new JogoLotogol(obj.concurso.jogos.jogo2.data.ToString())
                {
                     NumeroJogo = 2,
                     Time1 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo2.time1.gols,
                         Time = (string)obj.concurso.jogos.jogo2.time1.time
                     },
                     Time2 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo2.time2.gols,
                         Time = (string)obj.concurso.jogos.jogo2.time2.time
                     }
                },
                new JogoLotogol(obj.concurso.jogos.jogo3.data.ToString())
                {
                     NumeroJogo = 3,
                     Time1 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo3.time1.gols,
                         Time = (string)obj.concurso.jogos.jogo3.time1.time
                     },
                     Time2 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo3.time2.gols,
                         Time = (string)obj.concurso.jogos.jogo3.time2.time
                     }
                },
                new JogoLotogol(obj.concurso.jogos.jogo4.data.ToString())
                {
                     NumeroJogo = 4,
                     Time1 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo4.time1.gols,
                         Time = (string)obj.concurso.jogos.jogo4.time1.time
                     },
                     Time2 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo4.time2.gols,
                         Time = (string)obj.concurso.jogos.jogo4.time2.time
                     }
                },
                new JogoLotogol(obj.concurso.jogos.jogo5.data.ToString())
                {
                     NumeroJogo = 5,
                     Time1 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo5.time1.gols,
                         Time = (string)obj.concurso.jogos.jogo5.time1.time
                     },
                     Time2 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo5.time2.gols,
                         Time = (string)obj.concurso.jogos.jogo5.time2.time
                     }
                },
            };


            loteria.Premios = new List<PremioPadrao>()
            {
                new PremioPadrao()
                {
                    Acertos = 5,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.premio_1.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.premio_1.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 4,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.premio_2.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.premio_2.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 3,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.premio_3.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.premio_3.ganhadores.ToString().Replace(".", ""))
                },
            };

            return loteria;
        }

        private int cadastraConcursoConcurso(Concurso obj, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@IdConcurso", obj.ID);
            paramList.Add("@Data", obj.Data);
            paramList.Add("@ValorAcumulado1", ((Lotogol)obj).ValorAcumuladoFaixa1);
            paramList.Add("@ValorAcumulado2", ((Lotogol)obj).ValorAcumuladoFaixa2);
            paramList.Add("@ArrecadacaoTotal", obj.ArrecadacaoTotal);
            paramList.Add("@ProximoConcursoData", obj.ProximoConcurso.Data);
            paramList.Add("@ProximoConcursoValorEstimado", obj.ProximoConcurso.ValorEstimado);

            int id = Convert.ToInt32(cn.ExecuteScalar("sp_cadastraConcursoLotogol", paramList, commandType: CommandType.StoredProcedure));

            return id;
        }

        private void cadastraJogoConcurso(int idConcurso, JogoLotogol jogo, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@idConcurso", idConcurso);
            paramList.Add("@Jogo", jogo.NumeroJogo);
            paramList.Add("@Time1", jogo.Time1.Time);
            paramList.Add("@Gols1", jogo.Time1.Gols);
            paramList.Add("@Time2", jogo.Time2.Time);
            paramList.Add("@Gols2", jogo.Time2.Gols);
            paramList.Add("@DiaSemana", jogo.DiaDaSemana);

            cn.Execute("sp_cadastraJogoLotogol", paramList, commandType: CommandType.StoredProcedure);
        }

        private void cadastraPremioConcurso(int idConcurso, PremioPadrao premio, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@IdConcurso", idConcurso);
            paramList.Add("@Acertos", premio.Acertos);
            paramList.Add("@ValorPago", premio.ValorPago);
            paramList.Add("@Ganhadores", premio.Ganhadores);

            cn.Execute("sp_cadastraPremioLotogol", paramList, commandType: CommandType.StoredProcedure);
        }

        #endregion
    }
}
