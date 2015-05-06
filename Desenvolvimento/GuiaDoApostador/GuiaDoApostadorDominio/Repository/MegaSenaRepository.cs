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
            loteria.Data = DateTime.ParseExact(obj.concurso.data, "dd/MM/yyyy", new CultureInfo("pt-BR"));
            loteria.Cidade = obj.concurso.cidade;
            loteria.Local = obj.concurso.local;
            
            if (string.IsNullOrWhiteSpace(obj.concurso.valor_acumulado) == false)
            {
                loteria.ValorAcumulado = Convert.ToDecimal(obj.concurso.valor_acumulado.ToString().Replace(",", "."));
            }

            loteria.Dezenas = new List<byte>(obj.concurso.numeros_sorteados);

            loteria.Premios = new List<PremioPadrao>();

            if (string.IsNullOrWhiteSpace(obj.concurso.premiacao.sena.valor_pago) == false)
            {
                loteria.Premios.Add(new PremioPadrao(6, obj.concurso.premiacao.sena.valor_pago.ToString().Replace(".", "").Replace(",", "."), obj.concurso.premiacao.sena.ganhadores));
            }
            else
            {
                loteria.Premios.Add(new PremioPadrao(6, 0, obj.concurso.premiacao.sena.ganhadores));
            }

            if (string.IsNullOrWhiteSpace(obj.concurso.premiacao.quina.valor_pago) == false)
            {
                loteria.Premios.Add(new PremioPadrao(5, obj.concurso.premiacao.quina.valor_pago.ToString().Replace(".", "").Replace(",", "."), obj.concurso.premiacao.quina.ganhadores));
            }
            else
            {
                loteria.Premios.Add(new PremioPadrao(5, 0, obj.concurso.premiacao.quina.ganhadores));
            }

            if (string.IsNullOrWhiteSpace(obj.concurso.premiacao.quadra.valor_pago) == false)
            {
                loteria.Premios.Add(new PremioPadrao(5, obj.concurso.premiacao.quadra.valor_pago.ToString().Replace(".", "").Replace(",", "."), obj.concurso.premiacao.quadra.ganhadores));
            }
            else
            {
                loteria.Premios.Add(new PremioPadrao(5, 0, obj.concurso.premiacao.quadra.ganhadores));
            }

            loteria.ArrecadacaoTotal = obj.concurso.arrecadacao_total;

            loteria.ProximoConcursoData = new ProximoConcurso(DateTime.ParseExact(obj.proximo_concurso.data, "dd/MM/yyyy", new CultureInfo("pt-BR")), obj.proximo_concurso.valor_estimado.Replace(".", "").Replace(",", "."));

            if (string.IsNullOrWhiteSpace(obj.mega_virada_valor_acumulado) == false)
            {
                loteria.EspecialValorAcumulado = Convert.ToDecimal(obj.mega_virada_valor_acumulado.ToString().Replace(".", "").Replace(",", "."));
            }

            return loteria;
        }
    }
}
