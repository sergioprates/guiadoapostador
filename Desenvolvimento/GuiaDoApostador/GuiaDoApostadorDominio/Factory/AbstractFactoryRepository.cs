using GuiaDoApostadorDominio.Interfaces.Repository;
using GuiaDoApostadorDominio.Repository;
using GuiaDoApostadorDominio.UnitTest.Mock;
namespace GuiaDoApostadorDominio.Factory
{
    public static class AbstractFactoryRepository
    {
        private static bool _isTeste = false;

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
    }
}
