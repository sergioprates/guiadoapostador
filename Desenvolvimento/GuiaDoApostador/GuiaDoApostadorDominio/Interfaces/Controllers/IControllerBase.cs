using System.Collections.Generic;
namespace GuiaDoApostadorDominio.Interfaces.Controllers
{
    public interface IControllerBase<TEntity>
         where TEntity : class
    {
        TEntity Buscar(int id);

        int Inserir(TEntity entidade);

        IList<TEntity> Listar();

        bool Existe(int id);
    }
}
