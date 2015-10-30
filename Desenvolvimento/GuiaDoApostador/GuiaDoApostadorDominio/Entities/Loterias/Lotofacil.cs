using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class Lotofacil : Concurso
    {
        public Lotofacil()
        {
            base.TipoConcurso = Loteria.Lotofacil;
        }

        public static byte TotalNumerosLoteria = 25;
        public static byte QuantidadePadraoAposta = 15;
        public List<byte> Dezenas { get; set; }
        public List<PremioPadrao> Premios { get; set; }
    }
}
