using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class Lotogol : Concurso
    {
        public Lotogol()
        {
            base.TipoConcurso = Loteria.Lotogol;
            this.Jogos = new List<JogoLotogol>();
            this.Premios = new List<PremioPadrao>();
        }

        public List<JogoLotogol> Jogos { get; set; }
        public List<PremioPadrao> Premios { get; set; }

        public decimal ValorAcumuladoFaixa1 { get; set; }
        public decimal ValorAcumuladoFaixa2 { get; set; }
    }
}
