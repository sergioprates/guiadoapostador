using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GuiaDoApostadorWebApp.ViewModels
{
    public class Aposta
    {
        public int ApostaID { get; set; }

        public int ConcursoID { get; set; }

        public GuiaDoApostadorDominio.Entities.Loteria TipoConcurso { get; set; }
    }
}