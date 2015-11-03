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
                MegaSenaController controller = new MegaSenaController();
                log.Info("Iniciando atualização de Mega Sena.");

                var concurso = controller.ConsultaApi();
                log.InfoFormat("Concurso {0} obtido.", concurso.ID);

                if (controller.Existe(concurso.ID) == false)
                {
                    controller.Inserir(concurso);
                    log.InfoFormat("Concurso {0} inserido com sucesso.", concurso.ID);

                    int proxSorteio = concurso.ID + 1;
                    controller.GeraPalpiteProximoSorteio(proxSorteio);
                    log.InfoFormat("Palpite para o concurso {0} inserido com sucesso.", proxSorteio);
                }
                else
                {
                    log.InfoFormat("Concurso {0} já existe na base de dados.", concurso.ID);
                }
            }
            catch (Exception ex)
            {
                log.ErrorFormat("Não foi possível atualizar Mega Sena, motivo: {0}", ex.Message);
            }

            #endregion

            #region Lotofácil

            try
            {
                LotofacilController controller = new LotofacilController();
                log.Info("Iniciando atualização de Lotofácil.");

                var concurso = controller.ConsultaApi();
                log.InfoFormat("Concurso {0} obtido.", concurso.ID);

                if (controller.Existe(concurso.ID) == false)
                {
                    controller.Inserir(concurso);
                    log.InfoFormat("Concurso {0} inserido com sucesso.", concurso.ID);

                    int proxSorteio = concurso.ID + 1;
                    controller.GeraPalpiteProximoSorteio(proxSorteio);
                    log.InfoFormat("Palpite para o concurso {0} inserido com sucesso.", proxSorteio);
                }
                else
                {
                    log.InfoFormat("Concurso {0} já existe na base de dados.", concurso.ID);
                }
            }
            catch (Exception ex)
            {
                log.ErrorFormat("Não foi possível atualizar Lotofácil, motivo: {0}", ex.Message);
            }

            #endregion

            #region Quina

            try
            {
                QuinaController controller = new QuinaController();
                log.Info("Iniciando atualização de Quina.");

                var concurso = controller.ConsultaApi();
                log.InfoFormat("Concurso {0} obtido.", concurso.ID);

                if (controller.Existe(concurso.ID) == false)
                {
                    controller.Inserir(concurso);
                    log.InfoFormat("Concurso {0} inserido com sucesso.", concurso.ID);

                    int proxSorteio = concurso.ID + 1;
                    controller.GeraPalpiteProximoSorteio(proxSorteio);
                    log.InfoFormat("Palpite para o concurso {0} inserido com sucesso.", proxSorteio);
                }
                else
                {
                    log.InfoFormat("Concurso {0} já existe na base de dados.", concurso.ID);
                }
            }
            catch (Exception ex)
            {
                log.ErrorFormat("Não foi possível atualizar Quina, motivo: {0}", ex.Message);
            }

            #endregion

            #region Lotomania

            try
            {
                LotomaniaController controller = new LotomaniaController();
                log.Info("Iniciando atualização de Lotomania.");

                var concurso = controller.ConsultaApi();
                log.InfoFormat("Concurso {0} obtido.", concurso.ID);

                if (controller.Existe(concurso.ID) == false)
                {
                    controller.Inserir(concurso);
                    log.InfoFormat("Concurso {0} inserido com sucesso.", concurso.ID);

                    int proxSorteio = concurso.ID + 1;
                    controller.GeraPalpiteProximoSorteio(proxSorteio);
                    log.InfoFormat("Palpite para o concurso {0} inserido com sucesso.", proxSorteio);
                }
                else
                {
                    log.InfoFormat("Concurso {0} já existe na base de dados.", concurso.ID);
                }
            }
            catch (Exception ex)
            {
                log.ErrorFormat("Não foi possível atualizar Lotomania, motivo: {0}", ex.Message);
            }

            #endregion

            #region Dupla Sena

            try
            {
                DuplaSenaController controller = new DuplaSenaController();
                log.Info("Iniciando atualização de Dupla Sena.");

                var concurso = controller.ConsultaApi();
                log.InfoFormat("Concurso {0} obtido.", concurso.ID);

                if (controller.Existe(concurso.ID) == false)
                {
                    controller.Inserir(concurso);
                    log.InfoFormat("Concurso {0} inserido com sucesso.", concurso.ID);

                    int proxSorteio = concurso.ID + 1;
                    controller.GeraPalpiteProximoSorteio(proxSorteio);
                    log.InfoFormat("Palpite para o concurso {0} inserido com sucesso.", proxSorteio);
                }
                else
                {
                    log.InfoFormat("Concurso {0} já existe na base de dados.", concurso.ID);
                }
            }
            catch (Exception ex)
            {
                log.ErrorFormat("Não foi possível atualizar Dupla Sena, motivo: {0}", ex.Message);
            }

            #endregion

            #region Lotogol

            try
            {
                LotogolController controller = new LotogolController();
                log.Info("Iniciando atualização de Lotogol.");

                var concurso = controller.ConsultaApi();
                log.InfoFormat("Concurso {0} obtido.", concurso.ID);

                if (controller.Existe(concurso.ID) == false)
                {
                    controller.Inserir(concurso);
                    log.InfoFormat("Concurso {0} inserido com sucesso.", concurso.ID);
                }
                else
                {
                    log.InfoFormat("Concurso {0} já existe na base de dados.", concurso.ID);
                }
            }
            catch (Exception ex)
            {
                log.ErrorFormat("Não foi possível atualizar Lotogol, motivo: {0}", ex.Message);
            }

            #endregion

            #region Loteca

            try
            {
                LotecaController controller = new LotecaController();
                log.Info("Iniciando atualização de Loteca.");

                var concurso = controller.ConsultaApi();
                log.InfoFormat("Concurso {0} obtido.", concurso.ID);

                if (controller.Existe(concurso.ID) == false)
                {
                    controller.Inserir(concurso);
                    log.InfoFormat("Concurso {0} inserido com sucesso.", concurso.ID);
                }
                else
                {
                    log.InfoFormat("Concurso {0} já existe na base de dados.", concurso.ID);
                }
            }
            catch (Exception ex)
            {
                log.ErrorFormat("Não foi possível atualizar Loteca, motivo: {0}", ex.Message);
            }

            #endregion

            #region Timemania

            try
            {
                TimemaniaController controller = new TimemaniaController();
                log.Info("Iniciando atualização de Timemania.");

                var concurso = controller.ConsultaApi();
                log.InfoFormat("Concurso {0} obtido.", concurso.ID);

                if (controller.Existe(concurso.ID) == false)
                {
                    controller.Inserir(concurso);
                    log.InfoFormat("Concurso {0} inserido com sucesso.", concurso.ID);

                    int proxSorteio = concurso.ID + 1;
                    controller.GeraPalpiteProximoSorteio(proxSorteio);
                    log.InfoFormat("Palpite para o concurso {0} inserido com sucesso.", proxSorteio);
                }
                else
                {
                    log.InfoFormat("Concurso {0} já existe na base de dados.", concurso.ID);
                }
            }
            catch (Exception ex)
            {
                log.ErrorFormat("Não foi possível atualizar Timemania, motivo: {0}", ex.Message);
            }

            #endregion

            #region Federal

            try
            {
                FederalController controller = new FederalController();
                log.Info("Iniciando atualização de Federal.");

                var concurso = controller.ConsultaApi();
                log.InfoFormat("Concurso {0} obtido.", concurso.ID);

                if (controller.Existe(concurso.ID) == false)
                {
                    controller.Inserir(concurso);
                    log.InfoFormat("Concurso {0} inserido com sucesso.", concurso.ID);
                }
                else
                {
                    log.InfoFormat("Concurso {0} já existe na base de dados.", concurso.ID);
                }
            }
            catch (Exception ex)
            {
                log.ErrorFormat("Não foi possível atualizar Federal, motivo: {0}", ex.Message);
            }

            #endregion

            log.Info("##### FIM #####");
        }
    }
}
