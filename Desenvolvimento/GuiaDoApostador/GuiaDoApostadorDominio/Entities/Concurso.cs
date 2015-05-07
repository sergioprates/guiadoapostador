using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public abstract class Concurso
    {
        public int ID { get; set; }
        public Loteria TipoConcurso { get; protected set; }
        public DateTime Data { get; set; }
        public string Cidade { get; set; }
        public string Local { get; set; }
        public decimal ValorAcumulado { get; set; }
        public decimal? ArrecadacaoTotal { get; set; }
        public ProximoConcurso ProximoConcurso { get; set; }
        public decimal? EspecialValorAcumulado { get; set; }
    }
}
