using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using GuiaDoApostadorDominio.Interfaces.Repository;
using GuiaDoApostadorDominio.UnitTest.Mock;
using GuiaDoApostadorDominio.Repository;

namespace GuiaDoApostadorDominio.UnitTest
{
    [TestFixture]
    public class MegaSenaUnitTest
    {
        //IMegaSenaRepository _megaRepository = new MegaSenaRepositoryMock();
        IMegaSenaRepository _megaRepository = new MegaSenaRepository();

        [Test]
        public void ConsultaApi()
        {
            var concurso = _megaRepository.ConsultaApi();

            Assert.AreNotEqual(concurso, null);
        }

        [Test]
        public void Inserir()
        {
            var concurso = _megaRepository.Inserir(_megaRepository.ConsultaApi());

            Assert.AreNotEqual(0, concurso);
        }

        [Test]
        public void Existe()
        {
            var concurso = _megaRepository.Existe(_megaRepository.ConsultaApi().ID);

            Assert.AreEqual(true, concurso);
        }
    }
}
