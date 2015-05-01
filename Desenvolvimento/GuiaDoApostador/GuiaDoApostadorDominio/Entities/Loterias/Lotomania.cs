using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class Lotomania : Concurso
    {
        public Lotomania()
        {
            base.tipoConcurso = Loteria.Lotomania;            
        }

        public List<byte> dezenas { get; set; }
        public List<PremioPadrao> premios { get; set; }        
    }
}
