using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorInfra.Util;
using System;
using System.Collections.Generic;
using System.Globalization;
namespace GuiaDoApostadorDominio.Repository
{
    internal class LotomaniaRepository : RepositoryBase
    {
        public Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/lotomania/json");
            return deserializaConcurso(obj);
        }

        private Concurso deserializaConcurso(dynamic obj)
        {
            Lotomania loteria = new Lotomania()
            {
                ID = obj.concurso.numero,
                Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                Cidade = obj.concurso.cidade,
                Local = obj.concurso.local,
                ValorAcumulado = Convert.ToDecimal(obj.concurso.valor_acumulado.ToString().Replace(".", "")),
                ArrecadacaoTotal = Convert.ToDecimal(obj.concurso.arrecadacao_total.ToString().Replace(".", "")),
                EspecialValorAcumulado = Convert.ToDecimal(obj.especial_pascoa_valor_acumulado.ToString().Replace(".", ""))
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
                    Acertos = 20,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_20.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_20.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 19,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_19.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_19.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 18,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_18.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_18.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 17,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_17.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_17.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 16,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_16.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_16.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 0,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.acertos_0.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.acertos_0.ganhadores.ToString().Replace(".", ""))
                },
            };

            loteria.ProximoConcurso = new ProximoConcurso()
            {
                Data = DateTime.ParseExact(obj.proximo_concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                ValorEstimado = Convert.ToDecimal(obj.proximo_concurso.valor_estimado.ToString().Replace(".", ""))
            };

            return loteria;
        }

        public int Inserir(Concurso obj)
        {
            throw new System.NotImplementedException();
        }

        public Concurso Buscar(int id)
        {
            throw new System.NotImplementedException();
        }

        public System.Collections.Generic.IList<Concurso> Listar()
        {
            throw new System.NotImplementedException();
        }

        public bool Existe(int id)
        {
            throw new System.NotImplementedException();
        }


        public Concurso BuscarMaisRecente()
        {
            throw new NotImplementedException();
        }
    }
}
