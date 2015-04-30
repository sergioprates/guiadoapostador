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
            base.tipoConcurso = Loteria.Lotogol;            
        }

        public JogoLotogol jogos { get; set; }
        public List<PremioPadrao> premios { get; set; }        
    }
}
