using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public abstract class Concurso
    {
        public int idConcurso { get; set; }
        public Loteria tipoConcurso { get; protected set; }
        public DateTime data { get; set; }
        public string cidade { get; set; }
        public string local { get; set; }
        public decimal valorAcumulado { get; set; }
        public decimal? arrecadacaoTotal { get; set; }
        public ProximoConcurso proximoConcursoData { get; set; }
        public decimal? especialValorAcumulado { get; set; }
    }
}
