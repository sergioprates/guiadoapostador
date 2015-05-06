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
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://developers.agenciaideias.com.br/loterias/megasena/json");

            WebResponse response = (HttpWebResponse)request.GetResponse();
            string json = new StreamReader(response.GetResponseStream()).ReadToEnd();
            dynamic obj = JsonConvert.DeserializeObject<dynamic>(json);

            return deserializaConcurso(obj);
        }

        private Concurso deserializaConcurso(dynamic obj)
        {
            MegaSena loteria = new MegaSena();

            loteria.ID = obj.concurso.numero;
            loteria.Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR"));
            loteria.Cidade = obj.concurso.cidade;
            loteria.Local = obj.concurso.local;

            loteria.ValorAcumulado = Convert.ToDecimal(obj.concurso.valor_acumulado.ToString().Replace(",", "."));

            loteria.Dezenas = new List<byte>();

            foreach (byte dezena in obj.concurso.numeros_sorteados)
            {
                loteria.Dezenas.Add(dezena);
            }
           

            loteria.Premios = new List<PremioPadrao>();

            loteria.Premios.Add(new PremioPadrao(6, Convert.ToDecimal(obj.concurso.premiacao.sena.valor_pago.ToString().Replace(".", "").Replace(",", ".")), Convert.ToInt32(obj.concurso.premiacao.sena.ganhadores.ToString().Replace(".",""))));


            loteria.Premios.Add(new PremioPadrao(5, Convert.ToDecimal(obj.concurso.premiacao.quina.valor_pago.ToString().Replace(".", "").Replace(",", ".")), Convert.ToInt32(obj.concurso.premiacao.quina.ganhadores.ToString().Replace(".", ""))));


            loteria.Premios.Add(new PremioPadrao(4, decimal.Parse(obj.concurso.premiacao.quadra.valor_pago.ToString().Replace(".", "").Replace(",", ".")), Convert.ToInt32(obj.concurso.premiacao.quadra.ganhadores.ToString().Replace(".", ""))));


            loteria.ArrecadacaoTotal = Convert.ToDecimal(obj.concurso.arrecadacao_total.ToString().Replace(".", "").Replace(",", "."));

            loteria.ProximoConcursoData = new ProximoConcurso(DateTime.ParseExact(obj.proximo_concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")), Convert.ToDecimal(obj.proximo_concurso.valor_estimado.ToString().Replace(".", "").Replace(",", ".")));

            loteria.EspecialValorAcumulado = Convert.ToDecimal(obj.mega_virada_valor_acumulado.ToString().Replace(".", "").Replace(",", "."));


            return loteria;
        }
    }
}
