using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Entities;

namespace GuiaDoApostadorDominio.Interfaces.Repository
{
    public interface IConcursoRepository<TEntity> where TEntity : class
    {
        TEntity ConsultaApi();
        TEntity BuscarMaisRecente();
        int Inserir(TEntity obj);
        TEntity Buscar(int id);
        IList<TEntity> Listar();
        bool Existe(int id);
    }
}
