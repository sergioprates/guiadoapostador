using GuiaDoApostadorDominio.Controllers;
using GuiaDoApostadorDominio.Interfaces.Controllers;
namespace GuiaDoApostadorDominio.Factory
{
    public static class AbstractFactoryController
    {
        public static IMegaSenaController InstanciarMegaSena()
        {
            return new MegaSenaController(AbstractFactoryRepository.InstanciarMegaSena());
        }
    }
}
