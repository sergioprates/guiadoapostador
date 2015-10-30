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
    internal class FederalRepository : RepositoryBase
    {
        internal Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/loteriafederal/json");

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
                        id = cadastraConcursoConcurso((Federal)obj);

                        foreach (var premio in ((Federal)obj).Premios)
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
            return Convert.ToBoolean(cn.ExecuteScalar("sp_existeConcursoFederal", new { @IdConcurso = id }, commandType: CommandType.StoredProcedure));
        }

        #region Métodos Privados

        private Concurso deserializaConcurso(dynamic obj)
        {
            Federal loteria = new Federal();

            loteria.ID = obj.concurso.numero;
            loteria.Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR"));
            loteria.Cidade = obj.concurso.cidade;
            loteria.Local = obj.concurso.local;

            loteria.Premios = new List<PremioFederal>();

            loteria.Premios.Add(new PremioFederal(1, Convert.ToInt32(obj.concurso.premiacao.premio_1.bilhete.ToString().Replace(".", "")), Convert.ToDecimal(obj.concurso.premiacao.premio_1.valor_pago.ToString().Replace(".", ""))));
            loteria.Premios.Add(new PremioFederal(2, Convert.ToInt32(obj.concurso.premiacao.premio_2.bilhete.ToString().Replace(".", "")), Convert.ToDecimal(obj.concurso.premiacao.premio_2.valor_pago.ToString().Replace(".", ""))));
            loteria.Premios.Add(new PremioFederal(3, Convert.ToInt32(obj.concurso.premiacao.premio_3.bilhete.ToString().Replace(".", "")), Convert.ToDecimal(obj.concurso.premiacao.premio_3.valor_pago.ToString().Replace(".", ""))));
            loteria.Premios.Add(new PremioFederal(4, Convert.ToInt32(obj.concurso.premiacao.premio_4.bilhete.ToString().Replace(".", "")), Convert.ToDecimal(obj.concurso.premiacao.premio_4.valor_pago.ToString().Replace(".", ""))));
            loteria.Premios.Add(new PremioFederal(5, Convert.ToInt32(obj.concurso.premiacao.premio_5.bilhete.ToString().Replace(".", "")), Convert.ToDecimal(obj.concurso.premiacao.premio_5.valor_pago.ToString().Replace(".", ""))));
            loteria.Observacao = obj.concurso.cidade_1_premio;

            //No momento do desenvolvimento desta chamada, a API estava retornando o valor da cidade do primeiro premio
            //na propriedade observação.
            if (string.IsNullOrWhiteSpace(loteria.Observacao))
            {
                loteria.Observacao = obj.concurso.observacao;
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
            paramList.Add("@Observacao", ((Federal)obj).Observacao);

            int id = Convert.ToInt32(cn.ExecuteScalar("sp_cadastraConcursoFederal", paramList, commandType: CommandType.StoredProcedure));

            return id;
        }

        private void cadastraPremioConcurso(int idConcurso, PremioFederal premio)
        {
            var paramList = new DynamicParameters();

            paramList.Add("@IdConcurso", idConcurso);
            paramList.Add("@Premio", premio.Premio);
            paramList.Add("@Bilhete", premio.Bilhete);
            paramList.Add("@ValorPago", premio.ValorPago);

            cn.Execute("sp_cadastraPremioFederal", paramList, commandType: CommandType.StoredProcedure);
        }

        private Concurso buscar(int? id)
        {
            Federal con = new Federal();

            try
            {
                using (cn)
                {
                    cn.Open();

                    using (IDataReader dr = cn.ExecuteReader("sp_buscaConcursoFederal", new { @IdConcurso = id }, commandType: CommandType.StoredProcedure))
                    {
                        if (dr.Read())
                        {
                            con.ProximoConcurso = new ProximoConcurso();

                            con.ID = Convert.ToInt32(dr["idConcurso"]);
                            con.Data = Convert.ToDateTime(dr["data"]);
                            con.Cidade = Convert.ToString(dr["cidade"]);
                            con.Local = Convert.ToString(dr["local"]);
                            con.Observacao = Convert.ToString(dr["observacao"]);
                        }
                    }

                    if (con.ID != 0)
                    {
                        using (IDataReader dr = cn.ExecuteReader("sp_buscaPremiosFederal", new { @IdConcurso = con.ID }, commandType: CommandType.StoredProcedure))
                        {
                            con.Premios = new List<PremioFederal>();

                            while (dr.Read())
                            {
                                PremioFederal premio = new PremioFederal()
                                {
                                    Premio = Convert.ToByte(dr["premio"]),
                                    Bilhete = Convert.ToInt32(dr["bilhete"]),
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
