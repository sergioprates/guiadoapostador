using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class JogoLoteca
    {
        public JogoTimePadrao coluna1 { get; set; }
        public bool Empate { get; set; }
        public JogoTimePadrao coluna2 { get; set; }
        public Semana diaDaSemana { get; set; }
    }
}
