using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Interfaces
{
    interface ILotofacilController : IConcursoController
    {
        void GeraPalpiteProximoSorteio(int idConcurso);
    }
}
