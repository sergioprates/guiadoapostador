using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces;
using GuiaDoApostadorDominio.Repository;
using System.Collections.Generic;
using System.Linq;

namespace GuiaDoApostadorDominio.Controllers
{
    public class LotomaniaController : ILotomaniaController
    {
        private readonly LotomaniaRepository _repository = new LotomaniaRepository();

        public LotomaniaController()
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
                    estatistica = _repository.GetPalpiteProximoSorteio(null).OrderBy(n => n);
                    break;
            }

            return estatistica;
        }

        public void GeraPalpiteProximoSorteio(int idConcurso)
        {
            int sorteiosAnteriores = 8;
            int quantidadePalpite = 70;
            Dictionary<byte, byte> numerosLoteria = new Dictionary<byte, byte>(Lotomania.TotalNumerosLoteria);
            Dictionary<byte, byte> ultimosNumeros = _repository.GeraPalpiteProxSorteio(sorteiosAnteriores);

            for (byte i = 1; i <= Lotomania.TotalNumerosLoteria; i++)
            {
                byte? value = ultimosNumeros.FirstOrDefault(n => n.Key == i).Value;
                numerosLoteria.Add(i, value == null ? (byte)0 : (byte)value);
            }

            var primeirosMenosSairam = numerosLoteria.OrderBy(n => n.Value).ToList().Take(quantidadePalpite);

            List<byte> palpite = new List<byte>();

            while (palpite.Count != Lotomania.QuantidadePadraoAposta)
            {
                int random = new System.Random().Next(0, quantidadePalpite);

                byte numero = primeirosMenosSairam.ElementAt(random).Key;

                if (!palpite.Contains(numero))
                    palpite.Add(numero);
            }

            _repository.InserirPalpite(idConcurso, palpite);
        }
    }
}
