using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class MegaSena : Concurso
    {
        public MegaSena()
        {
            base.tipoConcurso = Loteria.MegaSena;
        }

        public List<byte> dezenas { get; set; }
        public List<PremioPadrao> premios { get; set; }
    }
}
