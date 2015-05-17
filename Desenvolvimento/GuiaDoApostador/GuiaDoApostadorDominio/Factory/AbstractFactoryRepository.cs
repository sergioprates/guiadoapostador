using GuiaDoApostadorDominio.Interfaces.Repository;
using GuiaDoApostadorDominio.Repository;
using GuiaDoApostadorDominio.UnitTest.Mock;
namespace GuiaDoApostadorDominio.Factory
{
    public static class AbstractFactoryRepository
    {
        private static bool _isTeste = false;

        public static ILotecaRepository InstanciarLoteca()
        {
            if (_isTeste)
            {
                return null;
            }
            else
            {
                return new LotecaRepository();
            }
        }

        public static ILotogolRepository InstanciarLotogol()
        {
            if (_isTeste)
            {
                return null;
            }
            else
            {
                return new LotogolRepository();
            }
        }

        public static IDuplaSenaRepository InstanciarDuplaSena()
        {
            if (_isTeste)
            {
                return null;
            }
            else
            {
                return new DuplaSenaRepository();
            }
        }

        public static ILotomaniaRepository InstanciarLotomania()
        {
            if (_isTeste)
            {
                return null;
            }
            else
            {
                return new LotomaniaRepository();
            }
        }

        public static ITimemaniaRepository InstanciarTimemania()
        {
            if (_isTeste)
            {
                return null;
            }
            else
            {
                return new TimemaniaRepository();
            }
        }

        public static IMegaSenaRepository InstanciarMegaSena()
        {
            if (_isTeste)
            {
                return new MegaSenaRepositoryMock();
            }
            else
            {
                return new MegaSenaRepository();
            }
        }

        public static ILotofacilRepository InstanciarLotofacil()
        {
            if (_isTeste)
            {
                return null;
            }
            else
            {
                return new LotofacilRepository();
            }
        }

        public static IQuinaRepository InstanciarQuina()
        {
            if (_isTeste)
            {
                return null;
            }
            else
            {
                return new QuinaRepository();
            }
        }

        public static IFederalRepository InstanciarFederal()
        {
            if (_isTeste)
            {
                return null;
            }
            else
            {
                return new FederalRepository();
            }
        }
    }
}
