using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Entities;
using System.Reflection;
using GuiaDoApostadorDominio.Interfaces;

namespace teste
{
    class Program
    {
        /// <summary>
        /// Rodar em modo debug para identificar melhor a populaçao dos objetos.
        /// O certo seria criar um teste unitario na pasta GuiaDoApostadorDominio/UnitTest, 
        /// mas tava com preguiça de baixar o NUnit.
        /// </summary>
        /// <param name="args"></param>
        static void Main(string[] args)
        {
            IConcursoController cont = new ConcursoControllerMock();

            Concurso lotofacil = cont.BuscaConcurso(Loteria.Lotofacil, 1);
            Concurso lotomania = cont.BuscaConcurso(Loteria.Lotomania, 2);
            Concurso lotogol = cont.BuscaConcurso(Loteria.Lotogol, 3);
            Concurso loteca = cont.BuscaConcurso(Loteria.Loteca, 4);
            Concurso federal = cont.BuscaConcurso(Loteria.Federal, 5);
            Concurso megaSena = cont.BuscaConcurso(Loteria.MegaSena, 6);
            Concurso quina = cont.BuscaConcurso(Loteria.Quina, 7);
            Concurso duplaSena = cont.BuscaConcurso(Loteria.DuplaSena, 8);
            Concurso timemania = cont.BuscaConcurso(Loteria.Timemania, 9);

            List<Concurso> concursos = new List<Concurso>();
            concursos.Add(lotofacil);
            concursos.Add(lotomania);
            concursos.Add(lotogol);
            concursos.Add(loteca);
            concursos.Add(federal);
            concursos.Add(megaSena);
            concursos.Add(quina);
            concursos.Add(duplaSena);
            concursos.Add(timemania);

            foreach (var concurso in concursos.Where(c => c.GetType() == typeof(Lotofacil)))
            {
                var con = concurso as Lotofacil;

                IList<PropertyInfo> propertyInfos = con.GetType().GetProperties();

                List<Lotofacil> l = new List<Lotofacil>();
                l.Add(con);

                foreach (Lotofacil obj in l)
                {
                    foreach (PropertyInfo propertyInfo in propertyInfos)
                    {
                        string linha = string.Format("{0}: {1}", propertyInfo.Name, propertyInfo.GetValue(obj, null));
                        Console.WriteLine(linha); 
                    }                        
                }
            }

            Console.ReadKey();
        }
    }
}
