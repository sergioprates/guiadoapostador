using System.Configuration;
using System.Data.SqlClient;

namespace GuiaDoApostadorDominio.Repository
{
    internal class RepositoryBase
    {
        protected readonly SqlConnection cn;

        public RepositoryBase()
        {
            cn = new SqlConnection(ConfigurationManager.ConnectionStrings["guiadoapostador"].ToString());
        }
    }
}
