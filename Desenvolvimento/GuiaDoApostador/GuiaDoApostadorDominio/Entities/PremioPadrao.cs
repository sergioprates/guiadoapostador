using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class PremioPadrao
    {
        public PremioPadrao()
        { }

        public PremioPadrao(byte acertos, decimal valorPago, int ganhadores)
        {
            Acertos = acertos;
            ValorPago = valorPago;
            Ganhadores = ganhadores;
        }

        public byte Acertos { get; set; }
        public decimal ValorPago { get; set; }
        public int Ganhadores { get; set; }
    }
}
