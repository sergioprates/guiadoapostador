using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorInfra.Util;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Repository
{
    internal class LotecaRepository : RepositoryBase
    {
        internal Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/loteca/json");
            return deserializaConcurso(obj);
        }

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
        internal int Inserir(Concurso obj)
        {
            throw new NotImplementedException();
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
            throw new NotImplementedException();
        }


        internal Concurso BuscarMaisRecente()
        {
            throw new NotImplementedException();
        }
    }
}
