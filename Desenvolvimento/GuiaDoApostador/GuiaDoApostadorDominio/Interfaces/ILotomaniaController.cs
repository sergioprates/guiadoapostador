
namespace GuiaDoApostadorDominio.Interfaces
{
    public interface ILotomaniaController : IConcursoController
    {
        void GeraPalpiteProximoSorteio(int idConcurso);
    }
}
