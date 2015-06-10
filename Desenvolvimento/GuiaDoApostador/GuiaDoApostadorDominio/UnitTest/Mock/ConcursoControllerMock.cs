using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Controllers;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces;
using GuiaDoApostadorDominio.UnitTest.Mock;

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
                                       
                    con = new LotofacilControllerMock().Buscar(idConcurso);

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

                    con = new MegaSenaControllerMock().Buscar(idConcurso);

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
