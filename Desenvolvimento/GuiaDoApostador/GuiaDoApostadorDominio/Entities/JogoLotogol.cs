using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class JogoLotogol
    {
        public JogoTimePadrao Time1 { get; set; }
        public JogoTimePadrao Time2 { get; set; }
        public Semana DiaDaSemana { get; set; }
    }
}
