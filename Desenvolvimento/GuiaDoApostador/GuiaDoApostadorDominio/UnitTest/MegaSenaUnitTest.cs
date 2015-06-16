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
        //IMegaSenaController _controller = new MegaSenaControllerMock();
        IMegaSenaController _controller = new MegaSenaController();

        [Test]
        public void ConsultaApi()
        {
            var concurso = _controller.ConsultaApi();

            Assert.AreNotEqual(concurso, null);
        }

        [Test]
        public void Inserir()
        {
            var concurso = _controller.Inserir(_controller.ConsultaApi());

            Assert.AreNotEqual(0, concurso);
        }

        [Test]
        public void Existe()
        {
            var concurso = _controller.Existe(_controller.ConsultaApi().ID);

            Assert.AreEqual(true, concurso);
        }

        [Test]
        public void Buscar()
        {
            int id = 1711;
            var concurso = _controller.Buscar(id);

            Assert.AreNotEqual(null, concurso);
        }

        [Test]
        public void BuscarMaisRecente()
        {
            var concurso = _controller.BuscarMaisRecente();

            Assert.AreNotEqual(null, concurso);
        }

        [Test]
        public void ObtemEstatistica()
        {
            var estatistica = _controller.ObtemEstatistica(Entities.Estatistica.NumerosQueMenosSairam);

            Assert.AreNotEqual(null, estatistica);
        }
    }
}
