using System;
using System.Collections.Generic;
using GuiaDoApostadorDominio.Entities;
using System.Globalization;
using GuiaDoApostadorInfra.Util;
using Dapper;
using System.Data;
using System.Transactions;
using System.Data.SqlClient;

namespace GuiaDoApostadorDominio.Repository
{
    internal class MegaSenaRepository : RepositoryBase
    {
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
                        id = cadastraConcursoMegaSena((MegaSena)obj, cn);

                        foreach (var dezena in ((MegaSena)obj).Dezenas)
                            cadastraDezenaMegaSena(obj.ID, dezena, cn);

                        foreach (var premio in ((MegaSena)obj).Premios)
                            cadastraPremioMegaSena(obj.ID, premio, cn);
                        
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
            return Convert.ToBoolean(cn.ExecuteScalar("sp_ExisteConcursoMegaSena", new { @IdConcurso = id }, commandType: CommandType.StoredProcedure));
        }

        internal Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/megasena/json");
            return deserializaConcurso(obj);
        }

        internal Concurso BuscarMaisRecente()
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

            int id = Convert.ToInt32(cn.ExecuteScalar("sp_cadastraConcursoMegaSena", paramList, commandType: CommandType.StoredProcedure));

            return id;
        }

        private void cadastraDezenaMegaSena(int idConcurso, byte dezena, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@idConcurso", idConcurso);
            paramList.Add("@dezena", dezena);

            cn.Execute("sp_cadastraDezenaMegaSena", paramList, commandType: CommandType.StoredProcedure);
        }

        private void cadastraPremioMegaSena(int idConcurso, PremioPadrao premio, SqlConnection conn)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@idConcurso", idConcurso);
            paramList.Add("@Acertos", premio.Acertos);
            paramList.Add("@ValorPago", premio.ValorPago);
            paramList.Add("@Ganhadores", premio.Ganhadores);

            cn.Execute("sp_cadastraPremioMegaSena", paramList, commandType: CommandType.StoredProcedure);
        }

        #endregion
    }
}
