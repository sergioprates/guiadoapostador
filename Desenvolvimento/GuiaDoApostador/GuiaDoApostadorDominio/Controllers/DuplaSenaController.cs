using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Interfaces;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Repository;

namespace GuiaDoApostadorDominio.Controllers
{
    public class DuplaSenaController : IDuplaSenaController
    {
        private readonly DuplaSenaRepository _repository = new DuplaSenaRepository();

        public DuplaSenaController()
        { }

        public Concurso ConsultaApi()
        {
            return _repository.ConsultaApi();
        }

        public Concurso BuscarMaisRecente()
        {
            return _repository.BuscarMaisRecente();
        }

        public Concurso Buscar(int id)
        {
            return _repository.Buscar(id);
        }

        public int Inserir(Concurso entidade)
        {
            return _repository.Inserir(entidade);
        }

        public System.Collections.Generic.IList<Concurso> Listar()
        {
            return _repository.Listar();
        }

        public bool Existe(int id)
        {
            return _repository.Existe(id);
        }

        public object ObtemEstatistica(Estatistica estat)
        {
            object estatistica = null;

            switch (estat)
            {
                case Estatistica.NumerosQueMenosSairam:
                    estatistica = _repository.GetNumerosQueMenosSairam().OrderBy(n => n.Value);
                    break;
                case Estatistica.NumerosQueMaisSairam:
                    estatistica = _repository.GetNumerosQueMaisSairam().OrderByDescending(n => n.Value);
                    break;
                case Estatistica.PalpiteProximoSorteio:
                    estatistica = _repository.GetPalpiteProximoSorteio(null).OrderBy(d => d.Sorteio).ThenBy(d => d.Dezena);                    
                    break;
            }

            return estatistica;
        }

        public void GeraPalpiteProximoSorteio(int idConcurso)
        {
            int sorteiosAnteriores = 5;
            int quantidadePalpite = 40;
            Dictionary<byte, byte> numerosLoteria = new Dictionary<byte, byte>(DuplaSena.TotalNumerosLoteria);
            Dictionary<byte, byte> ultimosNumeros = _repository.GeraPalpiteProxSorteio(sorteiosAnteriores);

            for (byte i = 1; i <= DuplaSena.TotalNumerosLoteria; i++)
            {
                byte? value = ultimosNumeros.FirstOrDefault(n => n.Key == i).Value;
                numerosLoteria.Add(i, value == null ? (byte)0 : (byte)value);
            }

            var primeirosMenosSairam = numerosLoteria.OrderBy(n => n.Value).ToList().Take(quantidadePalpite);

            List<DezenaDuplaSena> palpite = new List<DezenaDuplaSena>();

            while (palpite.Count != DuplaSena.QuantidadePadraoAposta)
            {
                int random = new System.Random().Next(0, quantidadePalpite);

                DezenaDuplaSena numero = new DezenaDuplaSena()
                {
                    Dezena = primeirosMenosSairam.ElementAt(random).Key                    
                };

                if (!palpite.Any(p => p.Dezena == numero.Dezena))
                    palpite.Add(numero);
            }

            for (int i = 0; i < palpite.Count; i++)
                palpite[i].Sorteio = i % 2 == 0 ? (byte)1 : (byte)2;

            _repository.InserirPalpite(idConcurso, palpite);
        }
    }
}
