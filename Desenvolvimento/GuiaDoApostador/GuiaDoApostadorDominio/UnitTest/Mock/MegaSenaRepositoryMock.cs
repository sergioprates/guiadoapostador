﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Interfaces.Repository;
using GuiaDoApostadorDominio.Entities;

namespace GuiaDoApostadorDominio.UnitTest.Mock
{
    public class MegaSenaRepositoryMock : IMegaSenaRepository
    {
        public Entities.Concurso ConsultaApi()
        {
            MegaSena loteria = new MegaSena();
            loteria.ID = 1700;
            loteria.Cidade = "REGISTRO-SP";
            loteria.Local = "Caminhão da Sorte";
            loteria.Premios = new List<PremioPadrao>();
            loteria.Premios.Add(new PremioPadrao(6, 100000, 10));
            loteria.Premios.Add(new PremioPadrao(4, 100000, 5));
            loteria.Premios.Add(new PremioPadrao(5, 100000, 3));
            loteria.ProximoConcurso = new ProximoConcurso(DateTime.Now.AddDays(2), 500000);
            loteria.ValorAcumulado = 3122222;
            loteria.ArrecadacaoTotal = 500000;
            loteria.Dezenas = 
                new List<byte>(){ 10,20,30,50,70,15 };
            return loteria;
        }

        public int Inserir(Entities.Concurso obj)
        {
            throw new NotImplementedException();
        }

        public Entities.Concurso Buscar(int id)
        {
            throw new NotImplementedException();
        }

        public IList<Entities.Concurso> Listar()
        {
            throw new NotImplementedException();
        }

        public bool Existe(int id)
        {
            throw new NotImplementedException();
        }
    }
}
