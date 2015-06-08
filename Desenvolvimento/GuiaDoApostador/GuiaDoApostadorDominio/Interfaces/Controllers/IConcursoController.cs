using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Controllers;
using GuiaDoApostadorDominio.Entities;

namespace GuiaDoApostadorDominio.Interfaces.Controllers
{
    public interface IConcursoController<TEntity> where TEntity : class
    {
        TEntity ConsultaApi();
        TEntity Buscar(int id);
        int Inserir(TEntity entidade);
        IList<TEntity> Listar();
        bool Existe(int id);
    }
}
