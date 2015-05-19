using System.Collections.Generic;

namespace GuiaDoApostadorDominio.Interfaces.Repository
{
    public interface IRepositoryBase<TEntity>
         where TEntity : class
    {
        int Inserir(TEntity obj);

        TEntity Buscar(int id);

        IList<TEntity> Listar();

        bool Existe(int id);
    }
}
