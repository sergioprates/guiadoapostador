using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces;

namespace GuiaDoApostadorDominio.Controllers
{
    public class ConcursoController : IConcursoController
    {
        /// <summary>
        /// Apenas um método de exemplo
        /// </summary>
        /// <param name="loteria"></param>
        /// <returns></returns>
        public Concurso BuscaConcurso(Loteria loteria, int concurso)
        {
            Concurso con = null;

            con.idConcurso = concurso;

            // acessar banco ou api para receber os dados

            return con;
        }
    }
}
