using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NUnit.Framework;
using GuiaDoApostadorDominio.Interfaces.Repository;
using GuiaDoApostadorDominio.UnitTest.Mock;

namespace GuiaDoApostadorDominio.UnitTest
{
    [TestFixture]
    public class MegaSenaUnitTest
    {
        IMegaSenaRepository _megaRepository = new MegaSenaRepositoryMock();

        [Test]
        public void ConsultaApi()
        {
            var concurso = _megaRepository.ConsultaApi();

            Assert.AreNotEqual(concurso, null);
        }
    }
}
