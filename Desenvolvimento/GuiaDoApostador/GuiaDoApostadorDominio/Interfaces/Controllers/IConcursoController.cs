using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Controllers;
using GuiaDoApostadorDominio.Entities;

namespace GuiaDoApostadorDominio.Interfaces.Controllers
{
    public interface IConcursoController
    {
        Concurso ConsultaApi();
        Concurso Buscar(int id);
        int Inserir(Concurso entidade);
        IList<Concurso> Listar();
        bool Existe(int id);
    }
}
