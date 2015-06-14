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
        //IMegaSenaController _repository = new MegaSenaControllerMock();
        IMegaSenaController _repository = new MegaSenaController();

        [Test]
        public void ConsultaApi()
        {
            var concurso = _repository.ConsultaApi();

            Assert.AreNotEqual(concurso, null);
        }

        [Test]
        public void Inserir()
        {
            var concurso = _repository.Inserir(_repository.ConsultaApi());

            Assert.AreNotEqual(0, concurso);
        }

        [Test]
        public void Existe()
        {
            var concurso = _repository.Existe(_repository.ConsultaApi().ID);

            Assert.AreEqual(true, concurso);
        }

        [Test]
        public void Buscar()
        {
            int id = 1711;
            var concurso = _repository.Buscar(id);

            Assert.AreNotEqual(null, concurso);
        }

        [Test]
        public void BuscarMaisRecente()
        {
            var concurso = _repository.BuscarMaisRecente();

            Assert.AreNotEqual(null, concurso);
        }
    }
}
