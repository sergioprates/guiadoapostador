using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class Timemania : Concurso
    {
        public Timemania()
        {
            base.tipoConcurso = Loteria.Timemania;            
        }

        public List<byte> dezenas { get; set; }
        public List<PremioPadrao> premios { get; set; }
        public TimeCoracao timeCoracao { get; set; }
    }
}
