using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GuiaDoApostadorDominio.UnitTest.Mock
{
    public class LotofacilControllerMock : ILotofacilController
    {
        public Concurso ConsultaApi()
        {
            Lotofacil loteria = new Lotofacil();
            loteria.ID = 1700;
            loteria.Cidade = "REGISTRO-SP";
            loteria.Local = "Caminhão da Sorte";
            loteria.Premios = new List<PremioPadrao>();
            loteria.Premios.Add(new PremioPadrao(15, 100000, 10));
            loteria.Premios.Add(new PremioPadrao(14, 100000, 5));
            loteria.Premios.Add(new PremioPadrao(13, 100000, 3));
            loteria.Premios.Add(new PremioPadrao(12, 100000, 3));
            loteria.Premios.Add(new PremioPadrao(11, 100000, 3));
            loteria.ProximoConcurso = new ProximoConcurso(DateTime.Now.AddDays(2), 500000);
            loteria.ValorAcumulado = 3122222;
            loteria.ArrecadacaoTotal = 500000;
            loteria.Dezenas =
                new List<byte>() { 1, 2, 4, 6, 7, 8, 9, 10, 11, 13, 14, 17, 19, 20, 21 };
            return loteria;
        }

        public int Inserir(Concurso obj)
        {
            throw new NotImplementedException();
        }

        public Concurso Buscar(int id)
        {
            throw new NotImplementedException();
        }

        public IList<Concurso> Listar()
        {
            throw new NotImplementedException();
        }

        public bool Existe(int id)
        {
            throw new NotImplementedException();
        }

        public Concurso BuscarMaisRecente()
        {
            throw new NotImplementedException();
        }
    }
}
