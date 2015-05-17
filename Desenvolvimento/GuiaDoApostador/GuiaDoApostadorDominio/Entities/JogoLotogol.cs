using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class JogoLotogol
    {
        public JogoLotogol()
        {}

        public JogoLotogol(string diaDaSemana)
        {
            IdentificaDiaDaSemana(diaDaSemana);
        }

        public JogoLotogol(int numeroJogo, JogoTimePadrao time1, JogoTimePadrao time2, string dia)
        {
            this.NumeroJogo = numeroJogo;
            this.Time1 = time1;
            this.Time2 = time2;
            IdentificaDiaDaSemana(dia);
        }

        public int NumeroJogo { get; set; }
        public JogoTimePadrao Time1 { get; set; }
        public JogoTimePadrao Time2 { get; set; }
        public Semana DiaDaSemana { get; set; }

        public void IdentificaDiaDaSemana(string dia)
        {
            switch (dia)
            {
                case "SEGUNDA-FEIRA":
                    this.DiaDaSemana = Semana.Segunda;
                    break;
                case "TERCA-FEIRA":
                    this.DiaDaSemana = Semana.Terça;
                    break;
                case "TERÇA-FEIRA":
                    this.DiaDaSemana = Semana.Terça;
                    break;
                case "QUARTA-FEIRA":
                    this.DiaDaSemana = Semana.Quarta;
                    break;
                case "QUINTA-FEIRA":
                    this.DiaDaSemana = Semana.Quinta;
                    break;
                case "SEXTA-FEIRA":
                    this.DiaDaSemana = Semana.Sexta;
                    break;
                case "SABADO":
                    this.DiaDaSemana = Semana.Sábado;
                    break;
                case "SÁBADO":
                    this.DiaDaSemana = Semana.Sábado;
                    break;
                case "DOMINGO":
                    this.DiaDaSemana = Semana.Domingo;
                    break;
                default:
                    throw new Exception("Dia da semana desconhecido. Dia: " + dia);
            }
        }
    }
}
