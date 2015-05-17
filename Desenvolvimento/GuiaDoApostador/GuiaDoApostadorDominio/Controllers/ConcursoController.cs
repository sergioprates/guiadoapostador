using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces;
using GuiaDoApostadorDominio.Interfaces.Controllers;
using GuiaDoApostadorDominio.Factory;

namespace GuiaDoApostadorDominio.Controllers
{
    public class ConcursoController : IConcursoController
    {
        private readonly IConcursoController _controller;

        public ConcursoController(Loteria loteria)
        {
            switch (loteria)
            {
                case Loteria.DuplaSena:
                    _controller = new DuplaSenaController(AbstractFactoryRepository.InstanciarDuplaSena());
                    break;
                case Loteria.Federal:
                    _controller = new FederalController(AbstractFactoryRepository.InstanciarFederal());
                    break;
                case Loteria.Loteca:
                    _controller = new LotecaController(AbstractFactoryRepository.InstanciarLoteca());
                    break;
                case Loteria.Lotofacil:
                    _controller = new LotofacilController(AbstractFactoryRepository.InstanciarLotofacil());
                    break;
                case Loteria.Lotogol:
                    _controller = new LotogolController(AbstractFactoryRepository.InstanciarLotogol());
                    break;
                case Loteria.Lotomania:
                    _controller = new LotomaniaController(AbstractFactoryRepository.InstanciarLotomania());
                    break;
                case Loteria.MegaSena:
                    _controller = new MegaSenaController(AbstractFactoryRepository.InstanciarMegaSena());
                    break;
                case Loteria.Quina:
                    _controller = new QuinaController(AbstractFactoryRepository.InstanciarQuina());
                    break;
                case Loteria.Timemania:
                    _controller = new TimemaniaController(AbstractFactoryRepository.InstanciarTimemania());
                    break;
                default:
                    _controller = new ConcursoControllerMock();
                    break;
            }
        }

        
        public Concurso Buscar(int id)
        {
            return _controller.Buscar(id);
        }

        public int Inserir(Concurso entidade)
        {
            return _controller.Inserir(entidade);
        }

        public IList<Concurso> Listar()
        {
            return _controller.Listar();
        }

        /// <summary>
        /// Método deverá ser implementado em todas as classes filhas
        /// </summary>
        /// <returns></returns>
        public Concurso ConsultaApi()
        {
            return _controller.ConsultaApi();
        }


        public bool Existe(int id)
        {
            return _controller.Existe(id);
        }
    }
}
