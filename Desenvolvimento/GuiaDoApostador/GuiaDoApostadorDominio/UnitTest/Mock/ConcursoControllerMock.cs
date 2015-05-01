using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Controllers;
using GuiaDoApostadorDominio.Entities;

namespace GuiaDoApostadorDominio.Interfaces
{
    public class ConcursoControllerMock : IConcursoController
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
                        idConcurso = idConcurso
                    };
                    break;
                case Loteria.Federal:
                    con = new Federal()
                    {
                        idConcurso = idConcurso
                    };
                    break;
                case Loteria.Loteca:
                    con = new Loteca()
                    {
                        idConcurso = idConcurso
                    };
                    break;
                case Loteria.Lotofacil:

                    #region Dados Lotofacil
		            con = new Lotofacil()
                    {
                        idConcurso = idConcurso,
                        data = DateTime.Now,
                        cidade = "São Paulo",
                        local = "Caminhão da Sorte",
                        valorAcumulado = 0,
                        proximoConcursoData = new ProximoConcurso()
                        {
                            data = DateTime.Now.AddDays(7),
                            valorEstimado = 2800000
                        },
                        especialValorAcumulado = 1500000,
                        dezenas = new List<byte>()
                        {
                            1,25,21,3,6,7,10,12,13,16,17,19,22,24,9
                        },
                        premios = new List<PremioPadrao>()
                        {
                            new PremioPadrao()
                            {
                                acertos = 15,
                                ganhadores = 1,
                                valorPago = 1643460.78m
                            },
                            new PremioPadrao()
                            {
                                acertos = 14,
                                ganhadores = 1,
                                valorPago = 660.93m
                            },
                            new PremioPadrao()
                            {
                                acertos = 13,
                                ganhadores = 1,
                                valorPago = 12.50m
                            },
                            new PremioPadrao()
                            {
                                acertos = 12,
                                ganhadores = 1,
                                valorPago = 5
                            },
                            new PremioPadrao()
                            {
                                acertos = 11,
                                ganhadores = 1,
                                valorPago = 2.50m
                            },
                        }
                    }; 
	#endregion
                    
                    break;
                case Loteria.Lotogol:
                    con = new Lotogol()
                    {
                        idConcurso = idConcurso
                    };
                    break;
                case Loteria.Lotomania:
                    con = new Lotomania()
                    {
                        idConcurso = idConcurso
                    };
                    break;
                case Loteria.MegaSena:
                    con = new MegaSena()
                    {
                        idConcurso = idConcurso
                    };
                    break;
                case Loteria.Quina:
                    con = new Quina()
                    {
                        idConcurso = idConcurso
                    };
                    break;
                case Loteria.Timemania:
                    con = new Timemania()
                    {
                        idConcurso = idConcurso
                    };
                    break;
                default:
                    break;
            }

            return con;
        }
    }
}
