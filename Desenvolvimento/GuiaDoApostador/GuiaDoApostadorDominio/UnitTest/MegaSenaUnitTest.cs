using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using GuiaDoApostadorDominio.Interfaces;
using GuiaDoApostadorDominio.Controllers;
using GuiaDoApostadorDominio.UnitTest.Mock;

namespace GuiaDoApostadorDominio.UnitTest
{
    [TestFixture]
    public class MegaSenaUnitTest
    {
        IMegaSenaController _megaRepository = new MegaSenaControllerMock();
        //IMegaSenaController _megaRepository = new MegaSenaController();

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
