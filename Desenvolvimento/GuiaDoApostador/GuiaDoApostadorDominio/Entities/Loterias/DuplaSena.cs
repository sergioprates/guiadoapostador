using System.Collections.Generic;

namespace GuiaDoApostadorDominio.Entities
{
    public class DuplaSena : Concurso
    {
        public DuplaSena()
        {
            base.TipoConcurso = Loteria.DuplaSena;            
        }

        public List<DezenaDuplaSena> Dezenas { get; set; }        
        public List<PremioDuplaSena> Premios { get; set; }
    }
}
