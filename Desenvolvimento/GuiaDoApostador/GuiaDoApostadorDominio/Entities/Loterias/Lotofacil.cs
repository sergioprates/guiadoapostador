using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class Lotofacil : Concurso
    {
        public Lotofacil()
        {
            base.tipoConcurso = Loteria.Lotofacil;
        }

        public List<byte> dezenas { get; set; }
        public List<PremioPadrao> premios { get; set; }
    }
}
