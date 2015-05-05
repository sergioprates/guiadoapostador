using System;
using System.Linq;
using System.Reflection;
using System.Collections.Generic;
using GuiaDoApostadorDominio.Repository;
using System.Data.SqlClient;
using System.Configuration;
using Dapper;
using System.Data;

namespace GuiaDoApostadorData.Repositories
{
    public class RepositoryBase<TEntity> : IRepositorioBase<TEntity>
where TEntity : class
    {
        protected readonly SqlConnection conn;

        public RepositoryBase()
            : this(ConfigurationManager.ConnectionStrings["GuiaDoApostador"].ToString())
        { }


        public RepositoryBase(string strCn)
        {
            conn = new SqlConnection(strCn);
        }

        public virtual TEntity Buscar(int id)
        {
            using (conn)
            {
                conn.Open();
                return conn.Query<TEntity>("sp_buscar" + typeof(TEntity).GetType().Name, new { ID = id }, null, true, null, CommandType.StoredProcedure).FirstOrDefault();
            }
        }

        public virtual bool Existe(int id)
        {
            using (conn)
            {
                conn.Open();
                return conn.Execute("sp_buscar" + typeof(TEntity).GetType().Name, new { ID = id }, null, null, CommandType.StoredProcedure) > 0;
            }
        }

        public virtual int Inserir(TEntity obj)
        {
            using (conn)
            {
                conn.Open();
                int id = conn.Query<int>("sp_inserir" + obj.GetType().Name, obj, null, true, null, CommandType.StoredProcedure).FirstOrDefault();
                return (int)obj.GetType().GetProperty("ID").GetValue(obj, null);
            }
        }

        public virtual IList<TEntity> Listar()
        {
            using (conn)
            {
                conn.Open();
                return conn.Query<TEntity>("sp_listar" + typeof(TEntity).GetType().Name, null, null, true, null, CommandType.StoredProcedure).ToList();
            }
        }
    }

}