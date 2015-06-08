using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Controllers;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces.Controllers;

namespace GuiaDoApostadorDominio.Interfaces
{
    public class ConcursoControllerMock : IConcursoController<Concurso>
    {
        /// <summary>
        /// Apenas um método de mock, 
        /// se for implementar algum mock usar um framework voltado para mock.
        /// </summary>
        /// <param name="loteria"></param>
        /// <returns></returns>
        public Concurso BuscaConcurso(Loteria loteria, int idConcurso)
        {
            Concurso con = null;

            // Atribuir valores de exemplo, fiz so o da lotofacil

            switch (loteria)
            {
                case Loteria.DuplaSena:
                    con = new DuplaSena()
                    {
                        ID = idConcurso
                    };
                    break;
                case Loteria.Federal:
                    con = new Federal()
                    {
                        ID = idConcurso
                    };
                    break;
                case Loteria.Loteca:
                    con = new Loteca()
                    {
                        ID = idConcurso
                    };
                    break;
                case Loteria.Lotofacil:

                    #region Dados Lotofacil
		            con = new Lotofacil()
                    {
                        ID = idConcurso,
                        Data = DateTime.Now,
                        Cidade = "São Paulo",
                        Local = "Caminhão da Sorte",
                        ValorAcumulado = 0,
                        ProximoConcurso = new ProximoConcurso()
                        {
                            Data = DateTime.Now.AddDays(7),
                            ValorEstimado = 2800000
                        },
                        EspecialValorAcumulado = 1500000,
                        Dezenas = new List<byte>()
                        {
                            1,25,21,3,6,7,10,12,13,16,17,19,22,24,9
                        },
                        Premios = new List<PremioPadrao>()
                        {
                            new PremioPadrao()
                            {
                                Acertos = 15,
                                Ganhadores = 1,
                                ValorPago = 1643460.78m
                            },
                            new PremioPadrao()
                            {
                                Acertos = 14,
                                Ganhadores = 1,
                                ValorPago = 660.93m
                            },
                            new PremioPadrao()
                            {
                                Acertos = 13,
                                Ganhadores = 1,
                                ValorPago = 12.50m
                            },
                            new PremioPadrao()
                            {
                                Acertos = 12,
                                Ganhadores = 1,
                                ValorPago = 5
                            },
                            new PremioPadrao()
                            {
                                Acertos = 11,
                                Ganhadores = 1,
                                ValorPago = 2.50m
                            },
                        }
                    }; 
	#endregion
                    
                    break;
                case Loteria.Lotogol:
                    con = new Lotogol()
                    {
                        ID = idConcurso
                    };
                    break;
                case Loteria.Lotomania:
                    con = new Lotomania()
                    {
                        ID = idConcurso
                    };
                    break;
                case Loteria.MegaSena:
                    con = new MegaSena()
                    {
                        ID = idConcurso
                    };
                    break;
                case Loteria.Quina:
                    con = new Quina()
                    {
                        ID = idConcurso
                    };
                    break;
                case Loteria.Timemania:
                    con = new Timemania()
                    {
                        ID = idConcurso
                    };
                    break;
                default:
                    break;
            }

            return con;
        }

        public Concurso Buscar(int id)
        {
            throw new NotImplementedException();
        }

        public int Inserir(Concurso entidade)
        {
            throw new NotImplementedException();
        }

        public IList<Concurso> Listar()
        {
            throw new NotImplementedException();
        }

        public Concurso ConsultaApi()
        {
            throw new NotImplementedException();
        }


        public bool Existe(int id)
        {
            throw new NotImplementedException();
        }
    }
}
