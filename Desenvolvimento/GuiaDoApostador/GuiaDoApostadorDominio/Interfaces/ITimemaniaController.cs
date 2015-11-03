
namespace GuiaDoApostadorDominio.Interfaces
{
    public interface ITimemaniaController : IConcursoController
    {
        void GeraPalpiteProximoSorteio(int idConcurso);
    }
}
