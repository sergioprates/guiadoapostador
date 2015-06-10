using System.Configuration;
using System.Data.SqlClient;

namespace GuiaDoApostadorDominio.Repository
{
    internal class RepositoryBase
    {
        protected readonly SqlConnection cn;

        internal RepositoryBase()
        {
            cn = new SqlConnection(ConfigurationManager.ConnectionStrings["guiadoapostador"].ToString());
        }
    }
}
