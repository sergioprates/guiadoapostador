using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class Loteca : Concurso
    {
        public Loteca()
        {
            base.tipoConcurso = Loteria.Loteca;            
        }

        public List<JogoLoteca> jogos { get; set; }
        public List<PremioPadrao> premios { get; set; }
    }
}
