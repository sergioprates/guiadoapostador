using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class Quina : Concurso
    {
        public Quina()
        {
            base.tipoConcurso = Loteria.Quina;
        }

        public List<byte> dezenas { get; set; }
        public List<PremioPadrao> premios { get; set; }
    }
}
