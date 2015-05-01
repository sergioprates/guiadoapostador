using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class Lotogol : Concurso
    {
        public Lotogol()
        {
            base.TipoConcurso = Loteria.Lotogol;            
        }

        public JogoLotogol Jogos { get; set; }
        public List<PremioPadrao> Premios { get; set; }        
    }
}
