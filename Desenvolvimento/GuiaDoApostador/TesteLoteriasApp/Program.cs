using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Controllers;
using GuiaDoApostadorDominio.Entities;

namespace TesteLoteriasApp
{
    class Program
    {
        static void Main(string[] args)
        {
            lotecaTeste();
        }

        private static Loteca lotecaTeste()
        {
            Concurso concursoX = new ConcursoController(Loteria.Loteca).ConsultaApi();

            Loteca mega = (Loteca)concursoX;

            return mega;
        }

        private static Lotogol lotogolTeste()
        {
            Concurso concursoX = new ConcursoController(Loteria.Lotogol).ConsultaApi();

            Lotogol mega = (Lotogol)concursoX;

            return mega;
        }

        private static DuplaSena duplaSenaTeste()
        {
            Concurso concursoX = new ConcursoController(Loteria.DuplaSena).ConsultaApi();

            DuplaSena mega = (DuplaSena)concursoX;

            return mega;
        }

        private static Lotomania lotomaniaTeste()
        {
            Concurso concursoX = new ConcursoController(Loteria.Lotomania).ConsultaApi();

            Lotomania mega = (Lotomania)concursoX;

            return mega;
        }

        private static Timemania timemaniaTeste()
        {
            Concurso concursoX = new ConcursoController(Loteria.Timemania).ConsultaApi();

            Timemania mega = (Timemania)concursoX;

            return mega;
        }

        private static Lotofacil lotofacilTeste()
        {
            Concurso concursoX = new ConcursoController(Loteria.Lotofacil).ConsultaApi();

            Lotofacil mega = (Lotofacil)concursoX;

            return mega;
        }

        private static Federal federalTeste()
        {
            Concurso concursoX = new ConcursoController(Loteria.Federal).ConsultaApi();

            Federal mega = (Federal)concursoX;

            return mega;
        }

        private static Quina quinaTeste()
        {
            Concurso concursoX = new ConcursoController(Loteria.Quina).ConsultaApi();

            Quina mega = (Quina)concursoX;

            return mega;
        }

        private static MegaSena megaSenaTeste()
        {
            Concurso concursoX = new ConcursoController(Loteria.MegaSena).ConsultaApi();

            MegaSena mega = (MegaSena)concursoX;

            return mega;
        }
    }
}
