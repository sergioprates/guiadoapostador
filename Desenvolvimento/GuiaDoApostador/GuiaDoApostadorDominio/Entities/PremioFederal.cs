using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class PremioFederal
    {
        public byte premio { get; set; }
        public int bilhete { get; set; }
        public decimal valorPago { get; set; }
    }
}
