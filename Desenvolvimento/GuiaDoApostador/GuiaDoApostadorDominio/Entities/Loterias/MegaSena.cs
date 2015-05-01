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
            base.TipoConcurso = Loteria.MegaSena;
        }

        public List<byte> Dezenas { get; set; }
        public List<PremioPadrao> Premios { get; set; }
    }
}
