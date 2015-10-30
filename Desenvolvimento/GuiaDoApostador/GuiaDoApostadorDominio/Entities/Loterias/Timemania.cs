using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class Timemania : Concurso
    {
        public Timemania()
        {
            base.TipoConcurso = Loteria.Timemania;            
        }

        public static byte TotalNumerosLoteria = 80;
        public static byte QuantidadePadraoAposta = 10;
        public List<byte> Dezenas { get; set; }
        public List<PremioPadrao> Premios { get; set; }
        public TimeCoracao TimeCoracao { get; set; }
        public ConcursoFinalCinco ProximoConcursoFinalCinco { get; set; }
    }
}
