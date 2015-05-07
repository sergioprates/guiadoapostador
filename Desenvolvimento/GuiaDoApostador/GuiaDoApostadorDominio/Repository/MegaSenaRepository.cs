using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces.Repository;
using System.Net;
using Newtonsoft.Json;
using System.IO;
using System.Globalization;
using Newtonsoft.Json.Linq;
using GuiaDoApostadorDominio.Factory;

namespace GuiaDoApostadorDominio.Repository
{
    internal class MegaSenaRepository : IMegaSenaRepository
    {
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

        public Concurso ConsultaApi()
        {
            string url = "http://developers.agenciaideias.com.br/loterias/megasena/json";
            dynamic obj = WebRequestFactory.GetWebRequestJson(url);

            return deserializaConcurso(obj);
        }

        private Concurso deserializaConcurso(dynamic obj)
        {    
            MegaSena loteria = new MegaSena()
            {
                ID = obj.concurso.numero,
                Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                Cidade = obj.concurso.cidade,
                Local = obj.concurso.local,
                ValorAcumulado = Convert.ToDecimal(obj.concurso.valor_acumulado.ToString().Replace(",", ".")),
                ArrecadacaoTotal = Convert.ToDecimal(obj.concurso.arrecadacao_total.ToString().Replace(".", "").Replace(",", ".")),
                EspecialValorAcumulado = Convert.ToDecimal(obj.mega_virada_valor_acumulado.ToString().Replace(".", "").Replace(",", "."))                
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
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.sena.valor_pago.ToString().Replace(".", "").Replace(",", ".")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.sena.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 5,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.quina.valor_pago.ToString().Replace(".", "").Replace(",", ".")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.quina.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 4,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.quadra.valor_pago.ToString().Replace(".", "").Replace(",", ".")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.quadra.ganhadores.ToString().Replace(".", ""))
                },
            };

            loteria.ProximoConcurso = new ProximoConcurso()
            {
                Data = DateTime.ParseExact(obj.proximo_concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                ValorEstimado = Convert.ToDecimal(obj.proximo_concurso.valor_estimado.ToString().Replace(".", "").Replace(",", "."))
            };

            return loteria;
        }
    }
}
