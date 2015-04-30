using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class JogoLotogol
    {
        public JogoTimePadrao time1 { get; set; }
        public JogoTimePadrao time2 { get; set; }
        public Semana diaDaSemana { get; set; }
    }
}
