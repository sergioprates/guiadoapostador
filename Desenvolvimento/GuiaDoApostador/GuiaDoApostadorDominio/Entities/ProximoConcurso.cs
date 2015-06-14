using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class ProximoConcurso
    {
        public ProximoConcurso()
        {}

        public ProximoConcurso(DateTime data, decimal valorEstimado)
        {
            Data = data;
            ValorEstimado = valorEstimado;
        }
        public DateTime? Data { get; set; }
        public decimal? ValorEstimado { get; set; }
    }
}
