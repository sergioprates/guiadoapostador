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
            base.TipoConcurso = Loteria.Loteca;            
        }

        public List<JogoLoteca> Jogos { get; set; }
        public List<PremioPadrao> Premios { get; set; }
    }
}
