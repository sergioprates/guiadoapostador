using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class JogoLoteca
    {
        public JogoLoteca()
        {

        }
        public JogoLoteca(string diaDaSemana)
        {
            IdentificaDiaDaSemana(diaDaSemana);
        }

        public JogoTimePadrao Coluna1 { get; set; }
        public bool Empate { get; set; }
        public JogoTimePadrao Coluna2 { get; set; }
        public Semana DiaDaSemana { get; set; }

        public void IdentificaDiaDaSemana(string dia)
        {
            switch (dia)
            {
                case "SEG":
                    this.DiaDaSemana = Semana.Segunda;
                    break;
                case "TER":
                    this.DiaDaSemana = Semana.Terça;
                    break;
                case "QUA":
                    this.DiaDaSemana = Semana.Quarta;
                    break;
                case "QUI":
                    this.DiaDaSemana = Semana.Quinta;
                    break;
                case "SEX":
                    this.DiaDaSemana = Semana.Sexta;
                    break;
                case "SÁB":
                    this.DiaDaSemana = Semana.Sábado;
                    break;
                case "DOM":
                    this.DiaDaSemana = Semana.Domingo;
                    break;
                default:
                    throw new Exception("Dia da semana desconhecido. Dia: " + dia);
            }
        }
    }
}
