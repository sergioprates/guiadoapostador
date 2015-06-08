using log4net;
using log4net.Config;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GuiaDoApostadorDominio.Controllers;
using GuiaDoApostadorDominio.Entities;
using GuiaDoApostadorDominio.Interfaces;
using GuiaDoApostadorDominio.Interfaces.Repository;

namespace ObtemDadosAtuais
{
    public class Program
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(Program));

        static void Main(string[] args)
        {
            XmlConfigurator.Configure();

            log.Info("##### INÍCIO #####");
            
            #region Mega Sena

            try
            {   
                MegaSenaController mega = new MegaSenaController();
                log.Info("Iniciando atualização de Mega Sena.");

                var concurso = mega.ConsultaApi();
                log.InfoFormat("Concurso {0} obtido.", concurso.ID);

                if (mega.Existe(concurso.ID) == false)
                {
                    mega.Inserir(concurso);
                    log.InfoFormat("Concurso {0} inserido com sucesso.");
                }
                else
                {
                    log.InfoFormat("Concurso {0} já existe na base de dados.");
                }
            }
            catch (Exception ex)
            {
                log.ErrorFormat("Não foi possível atualizar Mega Sena, motivo: {0}", ex.Message);                
            }

            #endregion

            log.Info("##### FIM #####");
        }
    }
}
