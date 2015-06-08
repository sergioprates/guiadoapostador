using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces.Repository;
using GuiaDoApostadorInfra.Util;
using System;
using System.Collections.Generic;
using System.Globalization;

namespace GuiaDoApostadorDominio.Repository
{
    internal class QuinaRepository : IQuinaRepository
    {

        public Quina ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/quina/json");

            return deserializaConcurso(obj);
        }

        private Quina deserializaConcurso(dynamic obj)
        {
            Quina loteria = new Quina()
            {

                ID = obj.concurso.numero,
                Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                Cidade = obj.concurso.cidade,
                Local = obj.concurso.local,
                ValorAcumulado = Convert.ToDecimal(obj.concurso.valor_acumulado.ToString().Replace(".", "")),
                ArrecadacaoTotal = Convert.ToDecimal(obj.concurso.arrecadacao_total.ToString().Replace(".", "")),
                ProximoConcurso = new ProximoConcurso(DateTime.ParseExact(obj.proximo_concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")), Convert.ToDecimal(obj.proximo_concurso.valor_estimado.ToString().Replace(".", ""))),
                EspecialValorAcumulado = Convert.ToDecimal(obj.especial_sao_joao_valor_acumulado.ToString().Replace(".", "")),

                Premios = new List<PremioPadrao>()
                {
                new PremioPadrao(5, Convert.ToDecimal(obj.concurso.premiacao.quina.valor_pago.ToString().Replace(".", "")), Convert.ToInt32(obj.concurso.premiacao.quina.ganhadores.ToString().Replace(".", ""))),

                new PremioPadrao(4, decimal.Parse(obj.concurso.premiacao.quadra.valor_pago.ToString().Replace(".", "")), Convert.ToInt32(obj.concurso.premiacao.quadra.ganhadores.ToString().Replace(".", ""))),

                new PremioPadrao(3, decimal.Parse(obj.concurso.premiacao.terno.valor_pago.ToString().Replace(".", "")), Convert.ToInt32(obj.concurso.premiacao.terno.ganhadores.ToString().Replace(".", "")))
                }
            };

            loteria.Dezenas = new List<byte>();

            foreach (byte dezena in obj.concurso.numeros_sorteados)
            {
                loteria.Dezenas.Add(dezena);
            }

            return loteria;
        }

        public int Inserir(Quina obj)
        {
            throw new NotImplementedException();
        }

        public Quina Buscar(int id)
        {
            throw new NotImplementedException();
        }

        public IList<Quina> Listar()
        {
            throw new NotImplementedException();
        }

        public bool Existe(int id)
        {
            throw new NotImplementedException();
        }


        public Quina BuscarMaisRecente()
        {
            throw new NotImplementedException();
        }
    }
}
