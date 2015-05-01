using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Controllers;
using GuiaDoApostadorDominio.Entities;

namespace GuiaDoApostadorDominio.Interfaces.Controllers
{
    public interface IConcursoController
    {
        Concurso BuscaConcurso(Loteria loteria, int concurso);
    }
}
