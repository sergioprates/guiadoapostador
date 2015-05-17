using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class PremioFederal
    {
        public PremioFederal(byte premio, int bilhete, decimal valorPago)
        {
            this.Premio = premio;
            this.Bilhete = bilhete;
            this.ValorPago = valorPago;
        }

        public PremioFederal()
        { }


        public byte Premio { get; set; }
        public int Bilhete { get; set; }
        public decimal ValorPago { get; set; }
    }
}
