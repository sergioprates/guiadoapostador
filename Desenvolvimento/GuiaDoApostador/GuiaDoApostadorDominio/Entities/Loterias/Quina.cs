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
            base.TipoConcurso = Loteria.Quina;
        }

        public List<byte> Dezenas { get; set; }
        public List<PremioPadrao> Premios { get; set; }
    }
}
