using System.Collections.Generic;

namespace GuiaDoApostadorDominio.Repository
{
    public interface IRepositorioBase<TEntity>
         where TEntity : class
    {
        int Inserir(TEntity obj);
        TEntity Buscar(int id);
        IList<TEntity> Listar();
        bool Existe(int id);
    }
}
