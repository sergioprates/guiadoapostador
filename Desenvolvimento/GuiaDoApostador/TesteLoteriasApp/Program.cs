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
            Concurso concursoX = new ConcursoController(Loteria.MegaSena).ConsultaApi();

            MegaSena mega = (MegaSena)concursoX;
        }
    }
}
