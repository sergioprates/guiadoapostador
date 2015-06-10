using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Entities;

namespace GuiaDoApostadorDominio.Interfaces.Repository
{
    public interface IConcursoRepository
    {
        Concurso ConsultaApi();
        Concurso BuscarMaisRecente();
        int Inserir(Concurso obj);
        Concurso Buscar(int id);
        IList<Concurso> Listar();
        bool Existe(int id);
    }
}
