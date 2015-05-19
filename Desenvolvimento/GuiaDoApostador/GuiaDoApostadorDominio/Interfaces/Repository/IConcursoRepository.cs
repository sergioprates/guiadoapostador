using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Entities;

namespace GuiaDoApostadorDominio.Interfaces.Repository
{
    public interface IConcursoRepository : IRepositoryBase<Concurso>
    {
        Concurso ConsultaApi();
        Concurso BuscarMaisRecente();
    }
}
