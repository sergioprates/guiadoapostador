using GuiaDoApostadorDominio.Interfaces;
using System.Net;
using System.IO;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Repository;
using System.Collections.Generic;
using System.Linq;

namespace GuiaDoApostadorDominio.Controllers
{
    public class MegaSenaController : IMegaSenaController
    {
        private MegaSenaRepository _repository = new MegaSenaRepository();
        
        public MegaSenaController()
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
            entidade.ID = _repository.Inserir(entidade);

            return entidade.ID;
        }

        public IList<Concurso> Listar()
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
                    estatistica = _repository.GetNumerosQueMenosSairam().OrderBy(n => n.Key);
                    break;
                case Estatistica.NumerosQueMaisSairam:
                    estatistica = _repository.GetNumerosQueMaisSairam().OrderBy(n => n.Key);
                    break;
                case Estatistica.PalpiteProximoSorteio:
                    estatistica = _repository.GetPalpiteProximoSorteio(null);
                    break;
            }

            return estatistica;
        }

        public void GeraPalpiteProximoSorteio(int idConcurso)
        {
            int sorteiosAnteriores = 5;
            int quantidadePalpite = 20;
            Dictionary<byte, byte> numerosLoteria = new Dictionary<byte, byte>(MegaSena.TotalNumerosLoteria);
            Dictionary<byte, byte> ultimosNumeros = _repository.GeraPalpiteProxSorteio(sorteiosAnteriores);

            for (byte i = 1; i <= MegaSena.TotalNumerosLoteria; i++)
            {
                byte? value = ultimosNumeros.FirstOrDefault(n => n.Key == i).Value;
                numerosLoteria.Add(i, value == null ? (byte)0 : (byte)value);
            }

            var primeirosMenosSairam = numerosLoteria.OrderBy(n => n.Value).ToList().Take(quantidadePalpite);

            List<byte> palpite = new List<byte>();

            while (palpite.Count != MegaSena.QuantidadePadraoAposta)
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
