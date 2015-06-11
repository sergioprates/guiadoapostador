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
    internal class LotecaRepository : RepositoryBase
    {
        internal Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/loteca/json");
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
                        id = cadastraConcursoConcurso((Loteca)obj, cn);

                        foreach (var jogo in ((Loteca)obj).Jogos)
                            cadastraJogoConcurso(obj.ID, jogo, cn);

                        foreach (var premio in ((Loteca)obj).Premios)
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
            return Convert.ToBoolean(cn.ExecuteScalar("sp_ExisteConcursoLoteca", new { @IdConcurso = id }, commandType: CommandType.StoredProcedure));
        }


        internal Concurso BuscarMaisRecente()
        {
            throw new NotImplementedException();
        }

        #region Métodos privados
        
        private Concurso deserializaConcurso(dynamic obj)
        {
            Loteca loteria = new Loteca()
            {
                ID = obj.concurso.numero,
                Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                ArrecadacaoTotal = Convert.ToDecimal(obj.concurso.arrecadacao_total.ToString().Replace(".", ""))
            };

            loteria.ProximoConcurso = new ProximoConcurso()
            {
                Data = DateTime.ParseExact(obj.proximo_concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                ValorEstimado = Convert.ToDecimal(obj.proximo_concurso.valor_estimado.ToString().Replace(".", ""))
            };

            loteria.Jogos = new List<JogoLoteca>();

            //Retiraram da API a coluna meio com o X. Por isso estou verificando a quantidade de gols de cada time.
            foreach (var jogo in obj.concurso.jogos)
            {
                JogoLoteca jogoLoteca = new JogoLoteca((string)jogo.data)
                {
                    Coluna1 = new JogoTimePadrao((string)jogo.coluna_1.time, (byte)jogo.coluna_1.gols),
                    Coluna2 = new JogoTimePadrao((string)jogo.coluna_2.time, (byte)jogo.coluna_2.gols),
                    Empate = (byte)jogo.coluna_1.gols == (byte)jogo.coluna_2.gols ? true : false,
                };
                loteria.Jogos.Add(jogoLoteca);
            }

            loteria.Premios = new List<PremioPadrao>()
            {
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
                }
            };

            loteria.ProximoConcursoFinalCinco = new ConcursoFinalCinco()
            {
                Numero = obj.concurso_final_cinco.numero,
                ValorAcumulado = Convert.ToDecimal(obj.concurso_final_cinco.valor_acumulado.ToString().Replace(".", ""))
            };

            return loteria;
        }

        private int cadastraConcursoConcurso(Concurso obj, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@IdConcurso", obj.ID);
            paramList.Add("@Data", obj.Data);
            paramList.Add("@ValorAcumulado", obj.ValorAcumulado);
            paramList.Add("@ArrecadacaoTotal", obj.ArrecadacaoTotal);
            paramList.Add("@ProximoConcursoData", obj.ProximoConcurso.Data);
            paramList.Add("@ProximoConcursoValorEstimado", obj.ProximoConcurso.ValorEstimado);
            paramList.Add("@EspecialValorAcumulado", ((Loteca)obj).ProximoConcursoFinalCinco.ValorAcumulado);
            paramList.Add("@EspecialNumero", ((Loteca)obj).ProximoConcursoFinalCinco.Numero);

            int id = Convert.ToInt32(cn.ExecuteScalar("sp_cadastraConcursoLoteca", paramList, commandType: CommandType.StoredProcedure));

            return id;
        }

        private void cadastraJogoConcurso(int idConcurso, JogoLoteca jogo, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@idConcurso", idConcurso);
            paramList.Add("@Time1", jogo.Coluna1.Time);
            paramList.Add("@Gols1", jogo.Coluna1.Gols);
            paramList.Add("@Time2", jogo.Coluna2.Time);
            paramList.Add("@Gols2", jogo.Coluna2.Gols);
            paramList.Add("@DiaSemana", jogo.DiaDaSemana);

            cn.Execute("sp_cadastraJogoLoteca", paramList, commandType: CommandType.StoredProcedure);
        }

        private void cadastraPremioConcurso(int idConcurso, PremioPadrao premio, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@IdConcurso", idConcurso);
            paramList.Add("@Acertos", premio.Acertos);
            paramList.Add("@ValorPago", premio.ValorPago);
            paramList.Add("@Ganhadores", premio.Ganhadores);

            cn.Execute("sp_cadastraPremioLoteca", paramList, commandType: CommandType.StoredProcedure);
        }

        #endregion
    }
}
