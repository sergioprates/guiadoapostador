using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class PremioFederal
    {
        public byte Premio { get; set; }
        public int Bilhete { get; set; }
        public decimal ValorPago { get; set; }
    }
}
