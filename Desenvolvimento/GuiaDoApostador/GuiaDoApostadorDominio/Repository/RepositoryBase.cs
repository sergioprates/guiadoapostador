using System.Configuration;
using System.Data.SqlClient;

namespace GuiaDoApostadorDominio.Repository
{
    internal class RepositoryBase
    {
        private SqlConnection _cn;

        protected SqlConnection cn
        {
            get
            {
                if (_cn == null || _cn.State == System.Data.ConnectionState.Closed)
                    _cn = new SqlConnection(ConfigurationManager.ConnectionStrings["guiadoapostador"].ToString());

                return _cn;
            }
        }
    }
}
