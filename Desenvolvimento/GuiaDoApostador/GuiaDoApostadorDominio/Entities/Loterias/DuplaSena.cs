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
            base.TipoConcurso = Loteria.DuplaSena;            
        }

        public List<byte> Dezenas1 { get; set; }
        public List<byte> Dezenas2 { get; set; }
        public List<PremioPadrao> Premiacao1 { get; set; }
        public List<PremioPadrao> Premiacao2 { get; set; }
    }
}
