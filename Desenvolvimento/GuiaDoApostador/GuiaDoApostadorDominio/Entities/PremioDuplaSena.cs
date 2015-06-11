using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class PremioDuplaSena
    {
        public byte Sorteio { get; set; }
        public byte Acertos { get; set; }
        public decimal ValorPago { get; set; }
        public int Ganhadores { get; set; }
    }
}
