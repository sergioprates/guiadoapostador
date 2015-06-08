using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces.Controllers;
using GuiaDoApostadorDominio.Interfaces.Repository;
using GuiaDoApostadorDominio.Repository;

namespace GuiaDoApostadorDominio.Controllers
{
    public class ConcursoController<TEntity> where TEntity : class
    {
        private readonly IConcursoController<TEntity> _controller;
        
        public TEntity Buscar(int id)
        {
            return _controller.Buscar(id);
        }

        public int Inserir(TEntity entidade)
        {
            return _controller.Inserir(entidade);
        }

        public IList<TEntity> Listar()
        {
            return _controller.Listar();
        }

        /// <summary>
        /// Método deverá ser implementado em todas as classes filhas
        /// </summary>
        /// <returns></returns>
        public TEntity ConsultaApi()
        {
            return _controller.ConsultaApi();
        }


        public bool Existe(int id)
        {
            return _controller.Existe(id);
        }
    }
}
