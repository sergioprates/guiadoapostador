using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class JogoLoteca
    {
        public JogoTimePadrao Coluna1 { get; set; }
        public bool Empate { get; set; }
        public JogoTimePadrao Coluna2 { get; set; }
        public Semana DiaDaSemana { get; set; }
    }
}
