using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Interfaces;
using GuiaDoApostadorDominio.UnitTest.Mock;
using NUnit.Framework;

namespace GuiaDoApostadorDominio.UnitTest
{
    [TestFixture]
    public class LotofacilUnitTest
    {
        ILotofacilController _repository = new LotofacilControllerMock();
        //ILotofacilController _repository = new LotofacilController();

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
    }
}
