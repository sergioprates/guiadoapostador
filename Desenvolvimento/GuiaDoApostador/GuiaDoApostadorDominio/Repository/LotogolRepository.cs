using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorInfra.Util;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Repository
{
    internal class LotogolRepository : RepositoryBase
    {
        public Concurso ConsultaApi()
        {
            dynamic obj = WebUtil.GetWebRequestJson("http://developers.agenciaideias.com.br/loterias/lotogol/json");
            return deserializaConcurso(obj);
        }

        private Concurso deserializaConcurso(dynamic obj)
        {
            Lotogol loteria = new Lotogol()
            {
                ID = obj.concurso.numero,
                Data = DateTime.ParseExact(obj.concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                ArrecadacaoTotal = Convert.ToDecimal(obj.concurso.arrecadacao_total.ToString().Replace(".", "")),
                ValorAcumuladoFaixa1 = Convert.ToDecimal(obj.concurso.valor_acumulado_faixa_1),
                ValorAcumuladoFaixa2 = Convert.ToDecimal(obj.concurso.valor_acumulado_faixa_2),
            };

            loteria.ProximoConcurso = new ProximoConcurso()
            {
                Data = DateTime.ParseExact(obj.proximo_concurso.data.ToString(), "dd/MM/yyyy", new CultureInfo("pt-BR")),
                ValorEstimado = Convert.ToDecimal(obj.proximo_concurso.valor_estimado.ToString().Replace(".", ""))
            };

            loteria.Jogos = new List<JogoLotogol>()
            {
                new JogoLotogol(obj.concurso.jogos.jogo1.data.ToString())
                {
                     NumeroJogo = 1,
                     Time1 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo1.time1.gols,
                         Time = (string)obj.concurso.jogos.jogo1.time1.time
                     },
                     Time2 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo1.time2.gols,
                         Time = (string)obj.concurso.jogos.jogo1.time2.time
                     }
                },
                new JogoLotogol(obj.concurso.jogos.jogo2.data.ToString())
                {
                     NumeroJogo = 2,
                     Time1 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo2.time1.gols,
                         Time = (string)obj.concurso.jogos.jogo2.time1.time
                     },
                     Time2 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo2.time2.gols,
                         Time = (string)obj.concurso.jogos.jogo2.time2.time
                     }
                },
                new JogoLotogol(obj.concurso.jogos.jogo3.data.ToString())
                {
                     NumeroJogo = 3,
                     Time1 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo3.time1.gols,
                         Time = (string)obj.concurso.jogos.jogo3.time1.time
                     },
                     Time2 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo3.time2.gols,
                         Time = (string)obj.concurso.jogos.jogo3.time2.time
                     }
                },
                new JogoLotogol(obj.concurso.jogos.jogo4.data.ToString())
                {
                     NumeroJogo = 4,
                     Time1 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo4.time1.gols,
                         Time = (string)obj.concurso.jogos.jogo4.time1.time
                     },
                     Time2 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo4.time2.gols,
                         Time = (string)obj.concurso.jogos.jogo4.time2.time
                     }
                },
                new JogoLotogol(obj.concurso.jogos.jogo5.data.ToString())
                {
                     NumeroJogo = 5,
                     Time1 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo5.time1.gols,
                         Time = (string)obj.concurso.jogos.jogo5.time1.time
                     },
                     Time2 = new JogoTimePadrao()
                     {
                         Gols = (byte)obj.concurso.jogos.jogo5.time2.gols,
                         Time = (string)obj.concurso.jogos.jogo5.time2.time
                     }
                },
            };


            loteria.Premios = new List<PremioPadrao>()
            {
                new PremioPadrao()
                {
                    Acertos = 5,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.premio_1.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.premio_1.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 4,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.premio_2.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.premio_2.ganhadores.ToString().Replace(".", ""))
                },
                new PremioPadrao()
                {
                    Acertos = 3,
                    ValorPago = Convert.ToDecimal(obj.concurso.premiacao.premio_3.valor_pago.ToString().Replace(".", "")),
                    Ganhadores = Convert.ToInt32(obj.concurso.premiacao.premio_3.ganhadores.ToString().Replace(".", ""))
                },
            };

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
