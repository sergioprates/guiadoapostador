using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class Federal : Concurso
    {
        public Federal()
        {
            base.TipoConcurso = Loteria.Federal;            
        }

        public List<PremioFederal> Premios { get; set; }        
    }
}
