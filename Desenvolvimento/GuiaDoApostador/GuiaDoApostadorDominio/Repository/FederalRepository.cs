using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces.Repository;
using GuiaDoApostadorInfra.Util;
using System;
using System.Collections.Generic;
using System.Globalization;

namespace GuiaDoApostadorDominio.Repository
{
    internal class FederalRepository : IFederalRepository
    {
        public Entities.Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/loteriafederal/json");

            return deserializaConcurso(obj);
        }

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
            loteria.CidadePrimeiroPremio = obj.concurso.cidade_1_premio;

            //No momento do desenvolvimento desta chamada, a API estava retornando o valor da cidade do primeiro premio
            //na propriedade observação.
            if (loteria.CidadePrimeiroPremio == null)
            {
                loteria.CidadePrimeiroPremio = obj.concurso.observacao;
            }
            
            return loteria;
        }

        public int Inserir(Entities.Concurso obj)
        {
            throw new NotImplementedException();
        }

        public Entities.Concurso Buscar(int id)
        {
            throw new NotImplementedException();
        }

        public IList<Entities.Concurso> Listar()
        {
            throw new NotImplementedException();
        }

        public bool Existe(int id)
        {
            throw new NotImplementedException();
        }
    }
}
