using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.Entities
{
    public class JogoTimePadrao
    {
        public JogoTimePadrao()
        {}

        public JogoTimePadrao(string time, byte gols)
        {
            this.Time = time;
            this.Gols = gols;
        }

        public string Time { get; set; }
        public byte Gols { get; set; }
    }
}
