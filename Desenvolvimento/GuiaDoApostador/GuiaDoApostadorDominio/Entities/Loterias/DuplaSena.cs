using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class DuplaSena : Concurso
    {
        public DuplaSena()
        {
            base.tipoConcurso = Loteria.DuplaSena;            
        }

        public List<byte> dezenas1 { get; set; }
        public List<byte> dezenas2 { get; set; }
        public List<PremioPadrao> premiacao1 { get; set; }
        public List<PremioPadrao> premiacao2 { get; set; }
    }
}
