using System.Collections.Generic;

namespace GuiaDoApostadorDominio.Entities
{
    public class DuplaSena : Concurso
    {
        public DuplaSena()
        {
            base.TipoConcurso = Loteria.DuplaSena;            
        }

        public static byte TotalNumerosLoteria = 60;
        public static byte QuantidadePadraoAposta = 12;
        public List<DezenaDuplaSena> Dezenas { get; set; }        
        public List<PremioDuplaSena> Premios { get; set; }
    }
}
