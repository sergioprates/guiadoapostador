using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces.Repository;
using GuiaDoApostadorInfra.Util;
using System;
using System.Collections.Generic;
using System.Globalization;

namespace GuiaDoApostadorDominio.Repository
{
    internal class TimemaniaRepository : RepositoryBase, ITimemaniaRepository
    {
        public Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/timemania/json");
            return deserializaConcurso(obj);
        }

        private Concurso deserializaConcurso(dynamic obj)
        {
            Timemania loteria = new Timemania()
            {
                ID = obj.concurso.numero,
                Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                Cidade = obj.concurso.cidade,
                Local = obj.concurso.local,
                ValorAcumulado = Convert.ToDecimal(obj.concurso.valor_acumulado.ToString().Replace(".", "")),
                ArrecadacaoTotal = Convert.ToDecimal(obj.concurso.arrecadacao_total.ToString().Replace(".", ""))
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
                    Acertos = 7,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_7.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_7.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 6,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_6.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_6.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 5,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_5.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_5.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 4,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_4.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_4.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 3,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_3.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_3.ganhadores.ToString().Replace(".", ""))
                },
            };

            loteria.ProximoConcurso = new ProximoConcurso()
            {
                Data = DateTime.ParseExact(obj.proximo_concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                ValorEstimado = Convert.ToDecimal(obj.proximo_concurso.valor_estimado.ToString().Replace(".", ""))
            };

            loteria.TimeCoracao = new TimeCoracao();
            loteria.TimeCoracao.Nome = obj.concurso.time_coracao.time;
            loteria.TimeCoracao.Ganhadores = obj.concurso.time_coracao.ganhadores;
            loteria.TimeCoracao.ValorPago = Convert.ToDecimal(obj.concurso.time_coracao.valor_pago.ToString().Replace(".", ""));

            loteria.ProximoConcursoFinalCinco = new ConcursoFinalCinco();
            loteria.ProximoConcursoFinalCinco.Numero = obj.concurso_final_cinco.numero;
            loteria.ProximoConcursoFinalCinco.ValorAcumulado = Convert.ToDecimal(obj.concurso_final_cinco.valor_acumulado.ToString().Replace(".", ""));

            return loteria;
        }

        public int Inserir(Concurso obj)
        {
            throw new NotImplementedException();
        }

        public Concurso Buscar(int id)
        {
            throw new NotImplementedException();
        }

        public IList<Concurso> Listar()
        {
            throw new NotImplementedException();
        }

        public bool Existe(int id)
        {
            throw new NotImplementedException();
        }


        public Concurso BuscarMaisRecente()
        {
            throw new NotImplementedException();
        }
    }
}
