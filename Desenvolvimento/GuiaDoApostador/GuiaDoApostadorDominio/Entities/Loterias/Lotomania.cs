using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class Lotomania : Concurso
    {
        public Lotomania()
        {
            base.TipoConcurso = Loteria.Lotomania;            
        }

        public static byte TotalNumerosLoteria = 100;
        public static byte QuantidadePadraoAposta = 50;
        public List<byte> Dezenas { get; set; }
        public List<PremioPadrao> Premios { get; set; }        
    }
}
