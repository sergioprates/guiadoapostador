using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorInfra.Util;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Repository
{
    internal class LotofacilRepository : RepositoryBase
    {
        internal Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/lotofacil/json");

            return deserializaConcurso(obj);
        }

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
