/****** Object:  Database [GuiaDoApostador]    Script Date: 07/01/2016 06:44:44 ******/
CREATE DATABASE [GuiaDoApostador] 
GO
ALTER DATABASE [GuiaDoApostador] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GuiaDoApostador].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GuiaDoApostador] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET ARITHABORT OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [GuiaDoApostador] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GuiaDoApostador] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GuiaDoApostador] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GuiaDoApostador] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GuiaDoApostador] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GuiaDoApostador] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GuiaDoApostador] SET  MULTI_USER 
GO
ALTER DATABASE [GuiaDoApostador] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GuiaDoApostador] SET DB_CHAINING OFF 
GO
USE [GuiaDoApostador]
GO
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoDuplaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaConcursoDuplaSena]
@idConcurso int = null
AS
BEGIN

IF (@idConcurso IS NULL)
BEGIN
	SELECT TOP 1
	idConcurso,
	data,
	cidade,
	local,
	valorAcumulado,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado,
	especialValorAcumulado
	FROM DuplaSenaConcursos
	ORDER BY idConcurso DESC
END
ELSE
BEGIN
	SELECT 
	idConcurso,
	data,
	cidade,
	local,
	valorAcumulado,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado,
	especialValorAcumulado
	FROM DuplaSenaConcursos
	WHERE idConcurso = @idConcurso
END

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoFederal]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaConcursoFederal]
@idConcurso int = null
AS
BEGIN

IF (@idConcurso IS NULL)
BEGIN
	SELECT TOP 1
	idConcurso,
	data,
	cidade,
	local,
	observacao
	FROM FederalConcursos
	ORDER BY idConcurso DESC
END
ELSE
BEGIN
	SELECT 
	idConcurso,
	data,
	cidade,
	local,
	observacao
	FROM FederalConcursos
	WHERE idConcurso = @idConcurso
END

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoLoteca]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaConcursoLoteca]
@idConcurso int = null
AS
BEGIN

IF (@idConcurso IS NULL)
BEGIN
	SELECT TOP 1
	idConcurso,
	data,
	valorAcumulado,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado,
	especialValorAcumulado,
	especialNumero
	FROM LotecaConcursos
	ORDER BY idConcurso DESC
END
ELSE
BEGIN
	SELECT 
	idConcurso,
	data,
	valorAcumulado,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado,
	especialValorAcumulado,
	especialNumero
	FROM LotecaConcursos
	WHERE idConcurso = @idConcurso
END

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoLotofacil]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscaConcursoLotofacil]
@idConcurso int = null
AS
BEGIN

IF (@idConcurso IS NULL)
BEGIN
	SELECT TOP 1
	idConcurso,
	data,
	cidade,
	local,
	valorAcumulado,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado,
	especialValorAcumulado
	FROM LotofacilConcursos
	ORDER BY idConcurso DESC
END
ELSE
BEGIN
	SELECT 
	idConcurso,
	data,
	cidade,
	local,
	valorAcumulado,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado,
	especialValorAcumulado
	FROM LotofacilConcursos
	WHERE idConcurso = @idConcurso
END

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoLotogol]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaConcursoLotogol]
@idConcurso int = null
AS
BEGIN

IF (@idConcurso IS NULL)
BEGIN
	SELECT TOP 1
	idConcurso,
	data,
	valorAcumulado1,
	valorAcumulado2,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado
	FROM LotogolConcursos
	ORDER BY idConcurso DESC
END
ELSE
BEGIN
	SELECT 
	idConcurso,
	data,
	valorAcumulado1,
	valorAcumulado2,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado
	FROM LotogolConcursos
	WHERE idConcurso = @idConcurso
END

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoLotomania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscaConcursoLotomania]
@idConcurso int = null
AS
BEGIN

IF (@idConcurso IS NULL)
BEGIN
	SELECT TOP 1
	idConcurso,
	data,
	cidade,
	local,
	valorAcumulado,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado,
	especialValorAcumulado
	FROM LotomaniaConcursos
	ORDER BY idConcurso DESC
END
ELSE
BEGIN
	SELECT 
	idConcurso,
	data,
	cidade,
	local,
	valorAcumulado,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado,
	especialValorAcumulado
	FROM LotomaniaConcursos
	WHERE idConcurso = @idConcurso
END

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoMegaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscaConcursoMegaSena]
@idConcurso int = null
AS
BEGIN

IF (@idConcurso IS NULL)
BEGIN
	SELECT TOP 1
	idConcurso,
	data,
	cidade,
	local,
	valorAcumulado,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado,
	especialValorAcumulado
	FROM MegasenaConcursos
	ORDER BY idConcurso DESC
END
ELSE
BEGIN
	SELECT 
	idConcurso,
	data,
	cidade,
	local,
	valorAcumulado,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado,
	especialValorAcumulado
	FROM MegasenaConcursos
	WHERE idConcurso = @idConcurso
END

END

GO
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoQuina]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaConcursoQuina]
@idConcurso int = null
AS
BEGIN

IF (@idConcurso IS NULL)
BEGIN
	SELECT TOP 1
	idConcurso,
	data,
	cidade,
	local,
	valorAcumulado,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado,
	especialValorAcumulado
	FROM QuinaConcursos
	ORDER BY idConcurso DESC
END
ELSE
BEGIN
	SELECT 
	idConcurso,
	data,
	cidade,
	local,
	valorAcumulado,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado,
	especialValorAcumulado
	FROM QuinaConcursos
	WHERE idConcurso = @idConcurso
END

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoTimemania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaConcursoTimemania]
@idConcurso int = null
AS
BEGIN

IF (@idConcurso IS NULL)
BEGIN
	SELECT TOP 1
	c.idConcurso,
	data,
	cidade,
	local,
	valorAcumulado,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado,
	especialValorAcumulado,
	t.timeCoracao,
	t.valorPago,
	t.ganhadores
	FROM TimemaniaConcursos c
	INNER JOIN TimemaniaTimesCoracao t ON c.idConcurso = t.idConcurso
	ORDER BY idConcurso DESC
END
ELSE
BEGIN
	SELECT 
	c.idConcurso,
	data,
	cidade,
	local,
	valorAcumulado,
	arrecadacaoTotal,
	proximoConcursoData,
	proximoConcursoValorEstimado,
	especialValorAcumulado,
	t.timeCoracao,
	t.valorPago,
	t.ganhadores
	FROM TimemaniaConcursos c
	INNER JOIN TimemaniaTimesCoracao t ON c.idConcurso = t.idConcurso
	WHERE c.idConcurso = @idConcurso
END

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasDuplaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaDezenasDuplaSena]
@idConcurso int
AS
BEGIN

SELECT sorteio, dezena from DuplaSenaDezenas
WHERE IdConcurso = @idConcurso

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasLoteca]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaDezenasLoteca]
@idConcurso int
AS
BEGIN

SELECT time1, gols1, time2, gols2, diaSemana from LotecaJogos
WHERE IdConcurso = @idConcurso

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasLotofacil]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaDezenasLotofacil]
@idConcurso int
AS
BEGIN

SELECT dezena from LotofacilDezenas
WHERE IdConcurso = @idConcurso

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasLotogol]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaDezenasLotogol]
@idConcurso int
AS
BEGIN

SELECT jogo, time1, gols1, time2, gols2, diaSemana from LotogolJogos
WHERE IdConcurso = @idConcurso

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasLotomania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaDezenasLotomania]
@idConcurso int
AS
BEGIN

SELECT dezena from LotomaniaDezenas
WHERE IdConcurso = @idConcurso

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasMegaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaDezenasMegaSena]
@idConcurso int
AS
BEGIN

SELECT dezena from MegasenaDezenas
WHERE IdConcurso = @idConcurso

END

GO
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasQuina]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaDezenasQuina]
@idConcurso int
AS
BEGIN

SELECT dezena from QuinaDezenas
WHERE IdConcurso = @idConcurso

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasTimemania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaDezenasTimemania]
@idConcurso int
AS
BEGIN

SELECT dezena from TimemaniaDezenas
WHERE IdConcurso = @idConcurso

END



GO
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosDuplaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaPremiosDuplaSena]
@idConcurso int
AS
BEGIN

SELECT sorteio, acertos, ganhadores, valorPago from DuplaSenaPremiacoes
WHERE IdConcurso = @idConcurso

END

GO
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosFederal]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaPremiosFederal]
@idConcurso int
AS
BEGIN

SELECT premio, bilhete, valorPago from FederalPremiacoes
WHERE IdConcurso = @idConcurso

END

GO
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosLoteca]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaPremiosLoteca]
@idConcurso int
AS
BEGIN

SELECT acertos, ganhadores, valorPago from LotecaPremiacoes
WHERE IdConcurso = @idConcurso

END

GO
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosLotofacil]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaPremiosLotofacil]
@idConcurso int
AS
BEGIN

SELECT acertos, ganhadores, valorPago from LotofacilPremiacoes
WHERE IdConcurso = @idConcurso

END

GO
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosLotogol]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaPremiosLotogol]
@idConcurso int
AS
BEGIN

SELECT acertos, ganhadores, valorPago from LotogolPremiacoes
WHERE IdConcurso = @idConcurso

END

GO
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosLotomania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaPremiosLotomania]
@idConcurso int
AS
BEGIN

SELECT acertos, ganhadores, valorPago from LotomaniaPremiacoes
WHERE IdConcurso = @idConcurso

END

GO
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosMegaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaPremiosMegaSena]
@idConcurso int
AS
BEGIN

SELECT acertos, ganhadores, valorPago from MegasenaPremiacoes
WHERE IdConcurso = @idConcurso

END

GO
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosQuina]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaPremiosQuina]
@idConcurso int
AS
BEGIN

SELECT acertos, ganhadores, valorPago from QuinaPremiacoes
WHERE IdConcurso = @idConcurso

END

GO
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosTimemania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_buscaPremiosTimemania]
@idConcurso int
AS
BEGIN

SELECT acertos, ganhadores, valorPago from TimemaniaPremiacoes
WHERE IdConcurso = @idConcurso

END

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoDuplaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cadastraConcursoDuplaSena]
@IdConcurso int,
@Data date,
@Cidade varchar(50),
@Local varchar(50),
@ValorAcumulado decimal(18,2),
@ArrecadacaoTotal decimal(18,2),
@EspecialValorAcumulado decimal(18,2),
@ProximoConcursoData date,
@ProximoConcursoValorEstimado decimal(18,2)
AS
insert into DuplaSenaConcursos
VALUES
(
@IdConcurso,
@Data,
@Cidade,
@Local,
@ValorAcumulado,
@ArrecadacaoTotal,
@ProximoConcursoData,
@ProximoConcursoValorEstimado,
@EspecialValorAcumulado
)

SELECT @IdConcurso

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoFederal]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraConcursoFederal]
@IdConcurso int,
@Data date,
@Cidade varchar(50),
@Local varchar(50),
@Observacao varchar(150)
AS
insert into FederalConcursos
VALUES
(
@IdConcurso,
@Data,
@Cidade,
@Local,
@Observacao
)

SELECT @IdConcurso

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoLoteca]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraConcursoLoteca]
@IdConcurso int,
@Data date,
@ValorAcumulado decimal(18,2),
@ArrecadacaoTotal decimal(18,2),
@ProximoConcursoData date,
@ProximoConcursoValorEstimado decimal(18,2),
@especialValorAcumulado decimal(18,2),
@EspecialNumero int
AS
BEGIN
insert into LotecaConcursos
VALUES
(
@IdConcurso,
@Data,
@ValorAcumulado,
@ArrecadacaoTotal,
@ProximoConcursoData,
@ProximoConcursoValorEstimado,
@especialValorAcumulado,
@EspecialNumero
)

SELECT @IdConcurso

END

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoLotofacil]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraConcursoLotofacil]
@IdConcurso int,
@Data date,
@Cidade varchar(50),
@Local varchar(50),
@ValorAcumulado decimal(18,2),
@ArrecadacaoTotal decimal(18,2),
@EspecialValorAcumulado decimal(18,2),
@ProximoConcursoData date,
@ProximoConcursoValorEstimado decimal(18,2)
AS
BEGIN
insert into LotofacilConcursos
VALUES
(
@IdConcurso,
@Data,
@Cidade,
@Local,
@ValorAcumulado,
@ArrecadacaoTotal,
@ProximoConcursoData,
@ProximoConcursoValorEstimado,
@EspecialValorAcumulado
)

SELECT @IdConcurso

END



GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoLotogol]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraConcursoLotogol]
@IdConcurso int,
@Data date,
@ValorAcumulado1 decimal(18,2),
@ValorAcumulado2 decimal(18,2),
@ArrecadacaoTotal decimal(18,2),
@ProximoConcursoData date,
@ProximoConcursoValorEstimado decimal(18,2)
AS
BEGIN
insert into LotogolConcursos
VALUES
(
@IdConcurso,
@Data,
@ValorAcumulado1,
@ValorAcumulado2,
@ArrecadacaoTotal,
@ProximoConcursoData,
@ProximoConcursoValorEstimado
)

SELECT @IdConcurso

END


GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoLotomania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraConcursoLotomania]
@IdConcurso int,
@Data date,
@Cidade varchar(50),
@Local varchar(50),
@ValorAcumulado decimal(18,2),
@ArrecadacaoTotal decimal(18,2),
@EspecialValorAcumulado decimal(18,2),
@ProximoConcursoData date,
@ProximoConcursoValorEstimado decimal(18,2)
AS
BEGIN
insert into LotomaniaConcursos
VALUES
(
@IdConcurso,
@Data,
@Cidade,
@Local,
@ValorAcumulado,
@ArrecadacaoTotal,
@ProximoConcursoData,
@ProximoConcursoValorEstimado,
@EspecialValorAcumulado
)

SELECT @IdConcurso

END

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoMegaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraConcursoMegaSena]
@IdConcurso int,
@Data date,
@Cidade varchar(50),
@Local varchar(50),
@ValorAcumulado decimal(18,2),
@ArrecadacaoTotal decimal(18,2),
@EspecialValorAcumulado decimal(18,2),
@ProximoConcursoData date,
@ProximoConcursoValorEstimado decimal(18,2)
AS
BEGIN
insert into MegasenaConcursos
VALUES
(
@IdConcurso,
@Data,
@Cidade,
@Local,
@ValorAcumulado,
@ArrecadacaoTotal,
@ProximoConcursoData,
@ProximoConcursoValorEstimado,
@EspecialValorAcumulado
)

SELECT @IdConcurso

END



GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoQuina]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraConcursoQuina]
@IdConcurso int,
@Data date,
@Cidade varchar(50),
@Local varchar(50),
@ValorAcumulado decimal(18,2),
@ArrecadacaoTotal decimal(18,2),
@EspecialValorAcumulado decimal(18,2),
@ProximoConcursoData date,
@ProximoConcursoValorEstimado decimal(18,2)
AS
insert into QuinaConcursos
VALUES
(
@IdConcurso,
@Data,
@Cidade,
@Local,
@ValorAcumulado,
@ArrecadacaoTotal,
@ProximoConcursoData,
@ProximoConcursoValorEstimado,
@EspecialValorAcumulado
)

SELECT @IdConcurso

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoTimemania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraConcursoTimemania]
@IdConcurso int,
@Data date,
@Cidade varchar(50),
@Local varchar(50),
@ValorAcumulado decimal(18,2),
@ArrecadacaoTotal decimal(18,2),
@EspecialValorAcumulado decimal(18,2),
@ProximoConcursoData date,
@ProximoConcursoValorEstimado decimal(18,2)
AS
BEGIN
insert into TimemaniaConcursos
VALUES
(
@IdConcurso,
@Data,
@Cidade,
@Local,
@ValorAcumulado,
@ArrecadacaoTotal,
@ProximoConcursoData,
@ProximoConcursoValorEstimado,
@EspecialValorAcumulado
)

SELECT @IdConcurso

END


GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaDuplaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraDezenaDuplaSena]
@IdConcurso int,
@Sorteio tinyint,
@Dezena tinyint
AS
insert into DuplaSenaDezenas
VALUES
(
@IdConcurso,
@Sorteio,
@Dezena
)

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaLotofacil]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_cadastraDezenaLotofacil]
@IdConcurso int,
@Dezena tinyint
AS
BEGIN
insert into LotofacilDezenas
VALUES
(
@IdConcurso,
@Dezena
)
END



GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaLotomania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraDezenaLotomania]
@IdConcurso int,
@Dezena tinyint
AS
BEGIN
insert into LotomaniaDezenas
VALUES
(
@IdConcurso,
@Dezena
)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaMegaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraDezenaMegaSena]
@IdConcurso int,
@Dezena tinyint
AS
BEGIN
insert into MegasenaDezenas
VALUES
(
@IdConcurso,
@Dezena
)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaQuina]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cadastraDezenaQuina]
@IdConcurso int,
@Dezena tinyint
AS
insert into QuinaDezenas
VALUES
(
@IdConcurso,
@Dezena
)

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaTimemania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraDezenaTimemania]
@IdConcurso int,
@Dezena tinyint
AS
BEGIN
insert into TimemaniaDezenas
VALUES
(
@IdConcurso,
@Dezena
)
END



GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraJogoLoteca]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraJogoLoteca]
@IdConcurso int,
@Time1 varchar(40),
@Gols1 tinyint,
@Time2 varchar(40),
@Gols2 tinyint,
@DiaSemana tinyint
AS
BEGIN
insert into LotecaJogos
VALUES
(
@IdConcurso,
@Time1,
@Gols1,
@Time2,
@Gols2,
@DiaSemana
)

END



GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraJogoLotogol]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraJogoLotogol]
@IdConcurso int,
@Jogo tinyint,
@Time1 varchar(40),
@Gols1 tinyint,
@Time2 varchar(40),
@Gols2 tinyint,
@DiaSemana tinyint
AS
BEGIN
insert into LotogolJogos
VALUES
(
@IdConcurso,
@Jogo,
@Time1,
@Gols1,
@Time2,
@Gols2,
@DiaSemana
)

END



GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPalpiteDuplaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_cadastraPalpiteDuplaSena]
@IdConcurso int,
@Sorteio int,
@Dezena tinyint
as
begin
	insert into DuplaSenaPalpites
	VALUES
	(
		@IdConcurso,
		@Sorteio,
		@Dezena
	)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPalpiteLotofacil]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_cadastraPalpiteLotofacil]
@IdConcurso int,
@Dezena tinyint
as
begin
	insert into LotofacilPalpites
	VALUES
	(
		@IdConcurso,
		@Dezena
	)
end

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPalpiteLotomania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_cadastraPalpiteLotomania]
@IdConcurso int,
@Dezena tinyint
as
begin
	insert into LotomaniaPalpites
	VALUES
	(
		@IdConcurso,
		@Dezena
	)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPalpiteMegaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_cadastraPalpiteMegaSena]
@IdConcurso int,
@Dezena tinyint
as
begin
	insert into MegasenaPalpites
	VALUES
	(
		@IdConcurso,
		@Dezena
	)
end


GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPalpiteQuina]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_cadastraPalpiteQuina]
@IdConcurso int,
@Dezena tinyint
as
begin
	insert into QuinaPalpites
	VALUES
	(
		@IdConcurso,
		@Dezena
	)
end

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPalpiteTimemania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_cadastraPalpiteTimemania]
@IdConcurso int,
@Dezena tinyint
as
begin
	insert into TimemaniaPalpites
	VALUES
	(
		@IdConcurso,
		@Dezena
	)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioDuplaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraPremioDuplaSena]
@IdConcurso int,
@Sorteio tinyint,
@Acertos tinyint,
@ValorPago decimal(18,2),
@Ganhadores int
AS
insert into DuplaSenaPremiacoes
VALUES
(
@IdConcurso,
@Sorteio,
@Acertos,
@ValorPago,
@Ganhadores
)

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioFederal]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraPremioFederal]
@IdConcurso int,
@Premio tinyint,
@Bilhete int,
@ValorPago decimal(18,2)
AS
insert into FederalPremiacoes
VALUES
(
@IdConcurso,
@Premio,
@Bilhete,
@ValorPago
)

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioLoteca]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraPremioLoteca]
@IdConcurso int,
@Acertos tinyint,
@ValorPago decimal(18,2),
@Ganhadores int
AS
BEGIN
insert into LotecaPremiacoes
VALUES
(
@IdConcurso,
@Acertos,
@ValorPago,
@Ganhadores
)
END



GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioLotofacil]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraPremioLotofacil]
@IdConcurso int,
@Acertos tinyint,
@ValorPago decimal(18,2),
@Ganhadores int
AS
BEGIN
insert into LotofacilPremiacoes
VALUES
(
@IdConcurso,
@Acertos,
@ValorPago,
@Ganhadores
)
END



GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioLotogol]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraPremioLotogol]
@IdConcurso int,
@Acertos tinyint,
@ValorPago decimal(18,2),
@Ganhadores int
AS
BEGIN
insert into LotogolPremiacoes
VALUES
(
@IdConcurso,
@Acertos,
@ValorPago,
@Ganhadores
)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioLotomania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraPremioLotomania]
@IdConcurso int,
@Acertos tinyint,
@ValorPago decimal(18,2),
@Ganhadores int
AS
BEGIN
insert into LotomaniaPremiacoes
VALUES
(
@IdConcurso,
@Acertos,
@ValorPago,
@Ganhadores
)
END



GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioMegaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraPremioMegaSena]
@IdConcurso int,
@Acertos tinyint,
@ValorPago decimal(18,2),
@Ganhadores int
AS
BEGIN
insert into MegasenaPremiacoes
VALUES
(
@IdConcurso,
@Acertos,
@ValorPago,
@Ganhadores
)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioQuina]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraPremioQuina]
@IdConcurso int,
@Acertos tinyint,
@ValorPago decimal(18,2),
@Ganhadores int
AS
BEGIN
insert into QuinaPremiacoes
VALUES
(
@IdConcurso,
@Acertos,
@ValorPago,
@Ganhadores
)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioTimemania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraPremioTimemania]
@IdConcurso int,
@Acertos tinyint,
@ValorPago decimal(18,2),
@Ganhadores int
AS
BEGIN
insert into TimemaniaPremiacoes
VALUES
(
@IdConcurso,
@Acertos,
@ValorPago,
@Ganhadores
)
END



GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraTimeCoracaoTimemania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraTimeCoracaoTimemania]
@IdConcurso int,
@TimeCoracao varchar(40),
@ValorPago decimal(18,2),
@Ganhadores int
AS
BEGIN
insert into TimemaniaTimesCoracao
VALUES
(
@IdConcurso,
@TimeCoracao,
@ValorPago,
@Ganhadores
)

END



GO
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoDuplaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_existeConcursoDuplaSena]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM DuplaSenaConcursos WHERE idConcurso = @IdConcurso 
END



GO
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoFederal]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_existeConcursoFederal]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM FederalConcursos WHERE idConcurso = @IdConcurso 
END



GO
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoLoteca]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_existeConcursoLoteca]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM LotecaConcursos WHERE idConcurso = @IdConcurso 
END



GO
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoLotofacil]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_existeConcursoLotofacil]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM LotofacilConcursos WHERE idConcurso = @IdConcurso 
END



GO
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoLotogol]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_existeConcursoLotogol]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM LotogolConcursos WHERE idConcurso = @IdConcurso 
END



GO
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoLotomania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_existeConcursoLotomania]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM LotomaniaConcursos WHERE idConcurso = @IdConcurso 
END



GO
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoMegaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_existeConcursoMegaSena]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM MegasenaConcursos WHERE idConcurso = @IdConcurso 
END



GO
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoQuina]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_existeConcursoQuina]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM QuinaConcursos WHERE idConcurso = @IdConcurso 
END



GO
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoTimemania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_existeConcursoTimemania]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM TimemaniaConcursos WHERE idConcurso = @IdConcurso 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_geraPalpiteProximoSorteioDuplaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_geraPalpiteProximoSorteioDuplaSena]
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from DuplaSenaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from DuplaSenaDezenas)
	group by dezena

end


GO
/****** Object:  StoredProcedure [dbo].[sp_geraPalpiteProximoSorteioLotofacil]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_geraPalpiteProximoSorteioLotofacil]
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from LotoFacilDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from LotoFacilDezenas)
	group by dezena

end


GO
/****** Object:  StoredProcedure [dbo].[sp_geraPalpiteProximoSorteioLotomania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_geraPalpiteProximoSorteioLotomania]
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from LotomaniaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from LotomaniaDezenas)
	group by dezena

end


GO
/****** Object:  StoredProcedure [dbo].[sp_geraPalpiteProximoSorteioMegaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_geraPalpiteProximoSorteioMegaSena]
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from MegasenaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from MegasenaDezenas)
	group by dezena

end


GO
/****** Object:  StoredProcedure [dbo].[sp_geraPalpiteProximoSorteioQuina]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_geraPalpiteProximoSorteioQuina]
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from QuinaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from QuinaDezenas)
	group by dezena

end


GO
/****** Object:  StoredProcedure [dbo].[sp_geraPalpiteProximoSorteioTimemania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_geraPalpiteProximoSorteioTimemania]
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from TimeManiaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from TimeManiaDezenas)
	group by dezena

end


GO
/****** Object:  StoredProcedure [dbo].[sp_numerosQueMaisSairamDuplaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_numerosQueMaisSairamDuplaSena]
as
begin

	select top 15 count(*) as 'quantidade', dezena 
	from DuplaSenaDezenas
	group by dezena
	order by 1 desc

end
GO
/****** Object:  StoredProcedure [dbo].[sp_numerosQueMaisSairamLotofacil]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_numerosQueMaisSairamLotofacil]
as
begin

	select top 18 count(*) as 'quantidade', dezena 
	from LotofacilDezenas
	group by dezena
	order by 1 desc

end


GO
/****** Object:  StoredProcedure [dbo].[sp_numerosQueMaisSairamLotomania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_numerosQueMaisSairamLotomania]
as
begin

	select top 50 count(*) as 'quantidade', dezena 
	from LotomaniaDezenas
	group by dezena
	order by 1 desc

end


GO
/****** Object:  StoredProcedure [dbo].[sp_numerosQueMaisSairamMegaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_numerosQueMaisSairamMegaSena]
as
begin

	select top 15 count(*) as 'quantidade', dezena 
	from MegasenaDezenas
	group by dezena
	order by 1 desc

end


GO
/****** Object:  StoredProcedure [dbo].[sp_numerosQueMaisSairamQuina]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_numerosQueMaisSairamQuina]
as
begin

	select top 7 count(*) as 'quantidade', dezena 
	from QuinaDezenas
	group by dezena
	order by 1 desc

end


GO
/****** Object:  StoredProcedure [dbo].[sp_numerosQueMaisSairamTimemania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_numerosQueMaisSairamTimemania]
as
begin

	select top 10 count(*) as 'quantidade', dezena 
	from TimeManiaDezenas
	group by dezena
	order by 1 desc

end


GO
/****** Object:  StoredProcedure [dbo].[sp_numerosQueMenosSairamDuplaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_numerosQueMenosSairamDuplaSena]
as
begin

	select top 15 count(*) as 'quantidade', dezena 
	from DuplaSenaDezenas
	group by dezena
	order by 1

end

GO
/****** Object:  StoredProcedure [dbo].[sp_numerosQueMenosSairamLotofacil]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_numerosQueMenosSairamLotofacil]
as
begin

	select top 18 count(*) as 'quantidade', dezena 
	from LotofacilDezenas
	group by dezena
	order by 1

end


GO
/****** Object:  StoredProcedure [dbo].[sp_numerosQueMenosSairamLotomania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_numerosQueMenosSairamLotomania]
as
begin

	select top 50 count(*) as 'quantidade', dezena 
	from LotomaniaDezenas
	group by dezena
	order by 1

end


GO
/****** Object:  StoredProcedure [dbo].[sp_numerosQueMenosSairamMegaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_numerosQueMenosSairamMegaSena]
as
begin

	select top 15 count(*) as 'quantidade', dezena 
	from MegasenaDezenas
	group by dezena
	order by 1

end


GO
/****** Object:  StoredProcedure [dbo].[sp_numerosQueMenosSairamQuina]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_numerosQueMenosSairamQuina]
as
begin

	select top 7 count(*) as 'quantidade', dezena 
	from QuinaDezenas
	group by dezena
	order by 1

end


GO
/****** Object:  StoredProcedure [dbo].[sp_numerosQueMenosSairamTimemania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_numerosQueMenosSairamTimemania]
as
begin

	select top 10 count(*) as 'quantidade', dezena 
	from TimeManiaDezenas
	group by dezena
	order by 1

end


GO
/****** Object:  StoredProcedure [dbo].[sp_palpiteProximoSorteioDuplaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_palpiteProximoSorteioDuplaSena]
@idConcurso int
as
begin
	IF (@idConcurso is null)
	begin
		select idConcurso, dezena, sorteio from DuplaSenaPalpites
		where idConcurso = (select max(idConcurso) from DuplaSenaPalpites)
		order by dezena
	end
	ELSE
	begin
		select idConcurso, dezena, sorteio from DuplaSenaPalpites
		where idConcurso = @idConcurso
		order by dezena
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_palpiteProximoSorteioLotofacil]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_palpiteProximoSorteioLotofacil]
@idConcurso int
as
begin
	IF (@idConcurso is null)
	begin
		select idConcurso, dezena from LotofacilPalpites
		where idConcurso = (select max(idConcurso) from LotofacilPalpites)
		order by dezena
	end
	ELSE
	begin
		select idConcurso, dezena from LotofacilPalpites
		where idConcurso = @idConcurso
		order by dezena
	end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_palpiteProximoSorteioLotomania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_palpiteProximoSorteioLotomania]
@idConcurso int
as
begin
	IF (@idConcurso is null)
	begin
		select idConcurso, dezena from LotomaniaPalpites
		where idConcurso = (select max(idConcurso) from LotomaniaPalpites)
		order by dezena
	end
	ELSE
	begin
		select idConcurso, dezena from LotomaniaPalpites
		where idConcurso = @idConcurso
		order by dezena
	end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_palpiteProximoSorteioMegaSena]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_palpiteProximoSorteioMegaSena]
@idConcurso int
as
begin
	IF (@idConcurso is null)
	begin
		select idConcurso, dezena from MegasenaPalpites
		where idConcurso = (select max(idConcurso) from MegasenaPalpites)
		order by dezena
	end
	ELSE
	begin
		select idConcurso, dezena from MegasenaPalpites
		where idConcurso = @idConcurso
		order by dezena
	end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_palpiteProximoSorteioQuina]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_palpiteProximoSorteioQuina]
@idConcurso int
as
begin
	IF (@idConcurso is null)
	begin
		select idConcurso, dezena from QuinaPalpites
		where idConcurso = (select max(idConcurso) from QuinaPalpites)
		order by dezena
	end
	ELSE
	begin
		select idConcurso, dezena from QuinaPalpites
		where idConcurso = @idConcurso
		order by dezena
	end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_palpiteProximoSorteioTimemania]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_palpiteProximoSorteioTimemania]
@idConcurso int
as
begin
	IF (@idConcurso is null)
	begin
		select idConcurso, dezena from TimemaniaPalpites
		where idConcurso = (select max(idConcurso) from TimemaniaPalpites)
		order by dezena
	end
	ELSE
	begin
		select idConcurso, dezena from TimemaniaPalpites
		where idConcurso = @idConcurso
		order by dezena
	end
end


GO
/****** Object:  Table [dbo].[DuplaSenaConcursos]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[DuplaSenaConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL,
	[valorAcumulado] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
	[especialValorAcumulado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_DuplaSena] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DuplaSenaDezenas]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuplaSenaDezenas](
	[IdConcurso] [int] NOT NULL,
	[sorteio] [tinyint] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DuplasenaPalpites]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuplasenaPalpites](
	[idConcurso] [int] NOT NULL,
	[sorteio] [tinyint] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DuplaSenaPremiacoes]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuplaSenaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[sorteio] [tinyint] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FederalConcursos]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[FederalConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[FederalConcursos] ADD [observacao] [varchar](150) NOT NULL
 CONSTRAINT [PK_Federal] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FederalPremiacoes]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FederalPremiacoes](
	[idConcurso] [int] NOT NULL,
	[premio] [tinyint] NOT NULL,
	[bilhete] [int] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotecaConcursos]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotecaConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[valorAcumulado] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
	[especialValorAcumulado] [decimal](18, 2) NULL,
	[especialNumero] [int] NULL,
 CONSTRAINT [PK_Loteca] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotecaJogos]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LotecaJogos](
	[IdConcurso] [int] NOT NULL,
	[time1] [varchar](40) NOT NULL,
	[gols1] [tinyint] NOT NULL,
	[time2] [varchar](40) NOT NULL,
	[gols2] [tinyint] NOT NULL,
	[diaSemana] [tinyint] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LotecaPremiacoes]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotecaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotofacilConcursos]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LotofacilConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL,
	[valorAcumulado] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
	[especialValorAcumulado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Lotofacil] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LotofacilDezenas]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotofacilDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotofacilPalpites]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotofacilPalpites](
	[idConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotofacilPremiacoes]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotofacilPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotogolConcursos]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotogolConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[valorAcumulado1] [decimal](18, 2) NOT NULL,
	[valorAcumulado2] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Lotogol] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotogolJogos]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LotogolJogos](
	[IdConcurso] [int] NOT NULL,
	[jogo] [tinyint] NOT NULL,
	[time1] [varchar](40) NOT NULL,
	[gols1] [tinyint] NOT NULL,
	[time2] [varchar](40) NOT NULL,
	[gols2] [tinyint] NOT NULL,
	[diaSemana] [tinyint] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LotogolPremiacoes]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotogolPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotomaniaConcursos]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LotomaniaConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL,
	[valorAcumulado] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
	[especialValorAcumulado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Lotomania] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LotomaniaDezenas]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotomaniaDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotomaniaPalpites]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotomaniaPalpites](
	[idConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LotomaniaPremiacoes]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotomaniaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MegasenaConcursos]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MegasenaConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL,
	[valorAcumulado] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
	[especialValorAcumulado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Megasena] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MegasenaDezenas]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MegasenaDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MegasenaPalpites]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MegasenaPalpites](
	[idConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MegasenaPremiacoes]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MegasenaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuinaConcursos]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[QuinaConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL,
	[valorAcumulado] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
	[especialValorAcumulado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Quina] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuinaDezenas]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuinaDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuinaPalpites]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuinaPalpites](
	[idConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuinaPremiacoes]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuinaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimemaniaConcursos]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TimemaniaConcursos](
	[idConcurso] [int] NOT NULL,
	[data] [date] NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[local] [varchar](50) NOT NULL,
	[valorAcumulado] [decimal](18, 2) NOT NULL,
	[arrecadacaoTotal] [decimal](18, 2) NOT NULL,
	[proximoConcursoData] [date] NULL,
	[proximoConcursoValorEstimado] [decimal](18, 2) NULL,
	[especialValorAcumulado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Timemania] PRIMARY KEY CLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimemaniaDezenas]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimemaniaDezenas](
	[IdConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimemaniaPalpites]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimemaniaPalpites](
	[idConcurso] [int] NOT NULL,
	[dezena] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimemaniaPremiacoes]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimemaniaPremiacoes](
	[idConcurso] [int] NOT NULL,
	[acertos] [tinyint] NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimemaniaTimesCoracao]    Script Date: 07/01/2016 06:44:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimemaniaTimesCoracao](
	[idConcurso] [int] NOT NULL,
	[timeCoracao] [varchar](40) NOT NULL,
	[valorPago] [decimal](18, 2) NOT NULL,
	[ganhadores] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DuplaSenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1392, CAST(0x0D3A0B00 AS Date), N'OSASCO-SP', N'Caminhão da Sorte', CAST(9565217.27 AS Decimal(18, 2)), CAST(7196670.00 AS Decimal(18, 2)), CAST(0x103A0B00 AS Date), CAST(10500000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DuplaSenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1393, CAST(0x103A0B00 AS Date), N'ITABAIANA-SE', N'Caminhão da Sorte', CAST(10787481.18 AS Decimal(18, 2)), CAST(7933328.00 AS Decimal(18, 2)), CAST(0x143A0B00 AS Date), CAST(11600000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DuplaSenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1432, CAST(0x993A0B00 AS Date), N'UBATUBA-SP', N'Caminhão da Sorte', CAST(771845.06 AS Decimal(18, 2)), CAST(2788102.00 AS Decimal(18, 2)), CAST(0x9C3A0B00 AS Date), CAST(1000000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DuplaSenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1433, CAST(0x9C3A0B00 AS Date), N'UBATUBA-SP', N'Caminhão da Sorte', CAST(1234098.98 AS Decimal(18, 2)), CAST(3000344.00 AS Decimal(18, 2)), CAST(0xA03A0B00 AS Date), CAST(1600000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DuplaSenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1435, CAST(0xA33A0B00 AS Date), N'PRESIDENTE FIGUEIREDO-AM', N'Caminhão da Sorte', CAST(2190454.33 AS Decimal(18, 2)), CAST(3610116.00 AS Decimal(18, 2)), CAST(0xA73A0B00 AS Date), CAST(2600000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DuplaSenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1438, CAST(0xAE3A0B00 AS Date), N'SANTO ANASTÁCIO-SP', N'Caminhão da Sorte', CAST(3892362.60 AS Decimal(18, 2)), CAST(3826074.00 AS Decimal(18, 2)), CAST(0xB13A0B00 AS Date), CAST(4300000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DuplaSenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1441, CAST(0xB83A0B00 AS Date), N'CÂNDIDO MOTA-SP', N'Caminhão da Sorte', CAST(5873082.21 AS Decimal(18, 2)), CAST(4706866.00 AS Decimal(18, 2)), CAST(0xBC3A0B00 AS Date), CAST(6300000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DuplaSenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1443, CAST(0xBF3A0B00 AS Date), N'JI-PARANÁ-RO', N'Caminhão da Sorte', CAST(757800.31 AS Decimal(18, 2)), CAST(2855926.00 AS Decimal(18, 2)), CAST(0xC33A0B00 AS Date), CAST(1000000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DuplaSenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1444, CAST(0xC33A0B00 AS Date), N'VILHENA-RO', N'Caminhão da Sorte', CAST(1178636.10 AS Decimal(18, 2)), CAST(2731512.00 AS Decimal(18, 2)), CAST(0xC63A0B00 AS Date), CAST(1500000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 1, 1)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 1, 6)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 1, 11)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 1, 15)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 1, 24)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 1, 40)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 2, 9)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 2, 18)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 2, 30)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 2, 31)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 2, 32)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1392, 2, 36)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 1, 3)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 1, 8)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 1, 11)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 1, 19)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 1, 29)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 1, 35)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 2, 5)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 2, 17)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 2, 23)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 2, 29)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 2, 43)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1393, 2, 49)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1432, 1, 9)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1432, 1, 23)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1432, 1, 27)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1432, 1, 36)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1432, 1, 40)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1432, 1, 46)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1432, 2, 4)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1432, 2, 20)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1432, 2, 26)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1432, 2, 30)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1432, 2, 32)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1432, 2, 39)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1433, 1, 5)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1433, 1, 6)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1433, 1, 23)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1433, 1, 30)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1433, 1, 33)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1433, 1, 41)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1433, 2, 11)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1433, 2, 12)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1433, 2, 30)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1433, 2, 32)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1433, 2, 45)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1433, 2, 50)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1435, 1, 1)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1435, 1, 7)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1435, 1, 33)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1435, 1, 36)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1435, 1, 42)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1435, 1, 46)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1435, 2, 6)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1435, 2, 7)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1435, 2, 24)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1435, 2, 36)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1435, 2, 43)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1435, 2, 50)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1438, 1, 2)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1438, 1, 5)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1438, 1, 26)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1438, 1, 27)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1438, 1, 30)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1438, 1, 46)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1438, 2, 8)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1438, 2, 13)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1438, 2, 19)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1438, 2, 21)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1438, 2, 23)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1438, 2, 38)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1441, 1, 2)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1441, 1, 4)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1441, 1, 11)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1441, 1, 22)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1441, 1, 24)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1441, 1, 45)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1441, 2, 11)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1441, 2, 22)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1441, 2, 24)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1441, 2, 29)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1441, 2, 46)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1441, 2, 50)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1443, 1, 3)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1443, 1, 12)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1443, 1, 15)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1443, 1, 17)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1443, 1, 18)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1443, 1, 41)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1443, 2, 4)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1443, 2, 5)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1443, 2, 16)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1443, 2, 20)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1443, 2, 24)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1443, 2, 45)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1444, 1, 12)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1444, 1, 20)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1444, 1, 35)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1444, 1, 39)
GO
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1444, 1, 40)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1444, 1, 42)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1444, 2, 9)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1444, 2, 14)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1444, 2, 16)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1444, 2, 34)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1444, 2, 37)
INSERT [dbo].[DuplaSenaDezenas] ([IdConcurso], [sorteio], [dezena]) VALUES (1444, 2, 49)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1434, 1, 2)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1434, 2, 25)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1434, 1, 51)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1434, 2, 42)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1434, 1, 59)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1434, 2, 52)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1434, 1, 13)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1434, 2, 34)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1434, 1, 22)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1434, 2, 48)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1434, 1, 35)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1434, 2, 57)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1439, 1, 54)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1439, 2, 14)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1439, 1, 3)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1439, 2, 28)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1439, 1, 49)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1439, 2, 40)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1439, 1, 58)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1439, 2, 52)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1439, 1, 11)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1439, 2, 34)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1439, 1, 22)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1439, 2, 47)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1445, 1, 33)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1445, 2, 26)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1445, 1, 52)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1445, 2, 17)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1445, 1, 60)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1445, 2, 19)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1445, 1, 1)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1445, 2, 31)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1445, 1, 56)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1445, 2, 48)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1445, 1, 9)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1445, 2, 58)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1436, 1, 48)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1436, 2, 34)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1436, 1, 57)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1436, 2, 51)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1436, 1, 11)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1436, 2, 25)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1436, 1, 16)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1436, 2, 44)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1436, 1, 29)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1436, 2, 55)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1436, 1, 10)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1436, 2, 5)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1442, 1, 55)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1442, 2, 16)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1442, 1, 7)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1442, 2, 33)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1442, 1, 51)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1442, 2, 42)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1442, 1, 59)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1442, 2, 53)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1442, 1, 14)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1442, 2, 37)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1442, 1, 31)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1442, 2, 48)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1444, 1, 6)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1444, 2, 30)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1444, 1, 47)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1444, 2, 38)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1444, 1, 56)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1444, 2, 48)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1444, 1, 10)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1444, 2, 34)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1444, 1, 27)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1444, 2, 43)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1444, 1, 35)
INSERT [dbo].[DuplasenaPalpites] ([idConcurso], [sorteio], [dezena]) VALUES (1444, 2, 54)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1392, 6, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1392, 5, 5, CAST(6522.17 AS Decimal(18, 2)), 51)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1392, 4, 4, CAST(110.30 AS Decimal(18, 2)), 2872)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1392, 6, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1392, 5, 5, CAST(6652.62 AS Decimal(18, 2)), 50)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1392, 4, 4, CAST(121.74 AS Decimal(18, 2)), 2602)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1393, 6, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1393, 5, 5, CAST(5392.34 AS Decimal(18, 2)), 68)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1393, 4, 4, CAST(87.87 AS Decimal(18, 2)), 3974)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1393, 6, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1393, 5, 5, CAST(2756.99 AS Decimal(18, 2)), 133)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1393, 4, 4, CAST(72.55 AS Decimal(18, 2)), 4813)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1432, 1, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1432, 1, 5, CAST(5602.89 AS Decimal(18, 2)), 23)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1432, 1, 4, CAST(108.13 AS Decimal(18, 2)), 1135)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1432, 2, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1432, 2, 5, CAST(14318.48 AS Decimal(18, 2)), 9)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1432, 2, 4, CAST(130.56 AS Decimal(18, 2)), 940)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1433, 1, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1433, 1, 5, CAST(12606.93 AS Decimal(18, 2)), 11)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1433, 1, 4, CAST(116.05 AS Decimal(18, 2)), 1138)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1433, 2, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1433, 2, 5, CAST(6933.81 AS Decimal(18, 2)), 20)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1433, 2, 4, CAST(112.68 AS Decimal(18, 2)), 1172)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1435, 1, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1435, 1, 5, CAST(7945.71 AS Decimal(18, 2)), 21)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1435, 1, 4, CAST(124.93 AS Decimal(18, 2)), 1272)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1435, 2, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1435, 2, 5, CAST(6180.00 AS Decimal(18, 2)), 27)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1435, 2, 4, CAST(95.04 AS Decimal(18, 2)), 1672)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1444, 1, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1444, 1, 5, CAST(10520.89 AS Decimal(18, 2)), 12)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1444, 1, 4, CAST(131.55 AS Decimal(18, 2)), 914)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1444, 2, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1444, 2, 5, CAST(4072.60 AS Decimal(18, 2)), 31)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1444, 2, 4, CAST(93.79 AS Decimal(18, 2)), 1282)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1438, 1, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1438, 1, 5, CAST(7073.66 AS Decimal(18, 2)), 25)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1438, 1, 4, CAST(106.79 AS Decimal(18, 2)), 1577)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1438, 2, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1438, 2, 5, CAST(5052.62 AS Decimal(18, 2)), 35)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1438, 2, 4, CAST(90.64 AS Decimal(18, 2)), 1858)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1441, 1, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1441, 1, 5, CAST(4028.74 AS Decimal(18, 2)), 54)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1441, 1, 4, CAST(82.64 AS Decimal(18, 2)), 2507)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1441, 2, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1441, 2, 5, CAST(7017.80 AS Decimal(18, 2)), 31)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1441, 2, 4, CAST(102.72 AS Decimal(18, 2)), 2017)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1443, 1, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1443, 1, 5, CAST(8800.08 AS Decimal(18, 2)), 15)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1443, 1, 4, CAST(98.83 AS Decimal(18, 2)), 1272)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1443, 2, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1443, 2, 5, CAST(6285.77 AS Decimal(18, 2)), 21)
INSERT [dbo].[DuplaSenaPremiacoes] ([idConcurso], [sorteio], [acertos], [valorPago], [ganhadores]) VALUES (1443, 2, 4, CAST(81.05 AS Decimal(18, 2)), 1551)
INSERT [dbo].[FederalConcursos] ([idConcurso], [data], [cidade], [local], [observacao]) VALUES (4978, CAST(0x0E3A0B00 AS Date), N'ITABAIANA-SE', N'Caminhão da Sorte', N'O VALOR DO 1º PREMIO FOI DISTRIBUÍDO PARA A CIDADE DE CATANDUVA/SP')
INSERT [dbo].[FederalConcursos] ([idConcurso], [data], [cidade], [local], [observacao]) VALUES (5018, CAST(0x9A3A0B00 AS Date), N'UBATUBA-SP', N'CAMINHÃO DA SORTE', N'O BILHETE GANHADOR DO PRIMEIRO PREMIO FOI DISTRIBUÍDO PARA CASCAVEL/PR.')
INSERT [dbo].[FederalConcursos] ([idConcurso], [data], [cidade], [local], [observacao]) VALUES (5019, CAST(0x9D3A0B00 AS Date), N'UBATUBA-SP', N'CAMINHÃO DA SORTE', N'OS BILHETES GANHADORES DO PRIMEIRO PRÊMIO FORAM DISTRIBUÍDOS PARA PATO BRANCO/PR (SÉRIES A e B).')
INSERT [dbo].[FederalConcursos] ([idConcurso], [data], [cidade], [local], [observacao]) VALUES (5021, CAST(0xA43A0B00 AS Date), N'PRESIDENTE FIGUEIREDO-AM', N'Caminhão da Sorte', N'O BILHETE GANHADOR DO PRIMEIRO PRÊMIO FOI DISTRIBUÍDO PARA SÃO JOÃO DA BOA VISTA/SP (SÉRIE A) E SEROPÉDICA/RJ (SÉRIE B).')
INSERT [dbo].[FederalConcursos] ([idConcurso], [data], [cidade], [local], [observacao]) VALUES (5023, CAST(0xAB3A0B00 AS Date), N'MANACAPURU-AM', N'Caminhão da Sorte', N'O BILHETE GANHADOR DO PRIMEIRO PRÊMIO FOI DISTRIBUÍDO PARA SÃO PAULO/SP.')
INSERT [dbo].[FederalConcursos] ([idConcurso], [data], [cidade], [local], [observacao]) VALUES (5027, CAST(0xB93A0B00 AS Date), N'CÂNDIDO MOTA-SP', N'Caminhão da Sorte', N'OS BILHETES GANHADORES DO 1º PRÊMIO FORAM DISTRIBUÍDOS PARA CANOAS/RS (SÉRIE A) E SÃO PAULO/SP (SÉRIE B)')
INSERT [dbo].[FederalConcursos] ([idConcurso], [data], [cidade], [local], [observacao]) VALUES (5029, CAST(0xC03A0B00 AS Date), N'JI-PARANÁ-RO', N'Caminhão da Sorte', N'OS BILHETES DOS GANHADORES DO PRIMEIRO PRÊMIO FORAM DISTRIBUÍDOS PARA SÃO PAULO/SP (SÉRIE A E SÉRIE B).')
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (4978, 1, 59932, CAST(300000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (4978, 2, 13587, CAST(18600.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (4978, 3, 76788, CAST(18300.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (4978, 4, 35989, CAST(18000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (4978, 5, 22245, CAST(17067.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5018, 1, 25444, CAST(300000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5018, 2, 26663, CAST(18600.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5018, 3, 72335, CAST(18300.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5018, 4, 90475, CAST(18000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5018, 5, 60060, CAST(17067.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5019, 1, 59960, CAST(600000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5019, 2, 41229, CAST(37200.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5019, 3, 29807, CAST(37000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5019, 4, 22745, CAST(36800.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5019, 5, 58845, CAST(36608.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5021, 1, 47743, CAST(600000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5021, 2, 96078, CAST(37200.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5021, 3, 59874, CAST(37000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5021, 4, 69253, CAST(36800.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5021, 5, 89804, CAST(36608.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5023, 1, 19808, CAST(1000000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5023, 2, 87666, CAST(21500.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5023, 3, 20235, CAST(17700.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5023, 4, 81338, CAST(16500.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5023, 5, 19017, CAST(15085.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5027, 1, 42168, CAST(600000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5027, 2, 7, CAST(37200.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5027, 3, 93669, CAST(37000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5027, 4, 70654, CAST(36800.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5027, 5, 68668, CAST(36608.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5029, 1, 38312, CAST(600000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5029, 2, 49090, CAST(37200.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5029, 3, 11233, CAST(37000.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5029, 4, 39131, CAST(36800.00 AS Decimal(18, 2)))
INSERT [dbo].[FederalPremiacoes] ([idConcurso], [premio], [bilhete], [valorPago]) VALUES (5029, 5, 17727, CAST(36608.00 AS Decimal(18, 2)))
INSERT [dbo].[LotecaConcursos] ([idConcurso], [data], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado], [especialNumero]) VALUES (656, CAST(0x0C3A0B00 AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(3055752.00 AS Decimal(18, 2)), CAST(0x133A0B00 AS Date), CAST(2300000.00 AS Decimal(18, 2)), CAST(217509.93 AS Decimal(18, 2)), 660)
INSERT [dbo].[LotecaConcursos] ([idConcurso], [data], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado], [especialNumero]) VALUES (676, CAST(0x983A0B00 AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(2884710.00 AS Decimal(18, 2)), CAST(0xA03A0B00 AS Date), CAST(2000000.00 AS Decimal(18, 2)), CAST(212496.18 AS Decimal(18, 2)), 680)
INSERT [dbo].[LotecaConcursos] ([idConcurso], [data], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado], [especialNumero]) VALUES (677, CAST(0xA03A0B00 AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(3611483.00 AS Decimal(18, 2)), CAST(0xA63A0B00 AS Date), CAST(400000.00 AS Decimal(18, 2)), CAST(357646.69 AS Decimal(18, 2)), 680)
INSERT [dbo].[LotecaConcursos] ([idConcurso], [data], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado], [especialNumero]) VALUES (679, CAST(0xAF3A0B00 AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(2453374.00 AS Decimal(18, 2)), CAST(0xB43A0B00 AS Date), CAST(900000.00 AS Decimal(18, 2)), CAST(544516.47 AS Decimal(18, 2)), 680)
INSERT [dbo].[LotecaConcursos] ([idConcurso], [data], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado], [especialNumero]) VALUES (680, CAST(0xB43A0B00 AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(2025243.00 AS Decimal(18, 2)), CAST(0xBB3A0B00 AS Date), CAST(924370.63 AS Decimal(18, 2)), CAST(81397.33 AS Decimal(18, 2)), 680)
INSERT [dbo].[LotecaConcursos] ([idConcurso], [data], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado], [especialNumero]) VALUES (681, CAST(0xBB3A0B00 AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(2863807.00 AS Decimal(18, 2)), CAST(0xC23A0B00 AS Date), CAST(300000.00 AS Decimal(18, 2)), CAST(196497.71 AS Decimal(18, 2)), 685)
INSERT [dbo].[LotecaConcursos] ([idConcurso], [data], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado], [especialNumero]) VALUES (682, CAST(0xC23A0B00 AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(1992505.00 AS Decimal(18, 2)), CAST(0xDE3A0B00 AS Date), CAST(400000.00 AS Decimal(18, 2)), CAST(276579.25 AS Decimal(18, 2)), 685)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'BRASIL', 2, N'MÉXICO', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'ATLÉTICO/MG', 1, N'CRUZEIRO/MG', 3, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'SÃO PAULO/SP', 2, N'GRÊMIO/RS', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'PAYSANDU/PA', 2, N'PARANÁ/PR', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'BRAGANTINO/SP', 2, N'BAHIA/BA', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'CEARÁ/CE', 1, N'SAMPAIO CORRÊA/MA', 3, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'GOIÁS/GO', 0, N'AVAÍ/SC', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'FIGUEIRENSE/SC', 2, N'PALMEIRAS/SP', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'SANTOS/SP', 2, N'PONTE PRETA/SP', 2, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'FLAMENGO/RJ', 1, N'CHAPECOENSE/SC', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'INTERNACIONAL/RS', 2, N'CORITIBA/PR', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'FLUMINENSE/RJ', 0, N'SPORT/PE', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'JOINVILLE/SC', 0, N'CORINTHIANS/SP', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (656, N'ATLÉTICO/PR', 2, N'VASCO DA GAMA/RJ', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (676, N'CORINTHIANS/SP', 1, N'FLAMENGO/RJ', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (676, N'VASCO DA GAMA/RJ', 0, N'GRÊMIO/RS', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (676, N'GOIÁS/GO', 0, N'CRUZEIRO/MG', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (676, N'SAMPAIO CORRÊA/MA', 2, N'PAYSANDU/PA', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (676, N'NÁUTICO/PE', 1, N'BOTAFOGO/RJ', 4, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (676, N'ATLÉTICO/GO', 0, N'SANTA CRUZ/PE', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (676, N'CRB/AL', 0, N'VITÓRIA/BA', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (676, N'FIGUEIRENSE/SC', 0, N'SANTOS/SP', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (676, N'CHAPECOENSE/SC', 0, N'AVAÍ/SC', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (676, N'INTERNACIONAL/RS', 1, N'JOINVILLE/SC', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (676, N'FLUMINENSE/RJ', 0, N'ATLÉTICO/PR', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (676, N'PALMEIRAS/SP', 0, N'SPORT/PE', 2, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (676, N'CORITIBA/PR', 1, N'SÃO PAULO/SP', 2, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (676, N'ATLÉTICO/MG', 2, N'PONTE PRETA/SP', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (679, N'CRUZEIRO/MG', 3, N'SPORT/PE', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (679, N'BOTAFOGO/RJ', 0, N'SANTA CRUZ/PE', 3, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (679, N'PARANÁ/PR', 1, N'AMÉRICA/MG', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (679, N'BRAGANTINO/SP', 3, N'SAMPAIO CORRÊA/MA', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (679, N'VITÓRIA/BA', 1, N'CEARÁ/CE', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (679, N'ATLÉTICO/GO', 3, N'MACAÉ/RJ', 4, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (679, N'NÁUTICO/PE', 1, N'CRB/AL', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (679, N'BOA ESPORTE/MG', 3, N'BAHIA/BA', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (679, N'RIVER/PI', 0, N'BOTAFOGO/SP', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (679, N'VENEZUELA', 1, N'EQUADOR', 3, 3)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (679, N'PARAGUAI', 2, N'BOLÍVIA', 1, 3)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (679, N'COLÔMBIA', 0, N'ARGENTINA', 1, 3)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (679, N'URUGUAI', 3, N'CHILE', 0, 3)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (679, N'BRASIL', 3, N'PERU', 0, 3)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (680, N'CORINTHIANS/SP', 6, N'SÃO PAULO/SP', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (680, N'INTERNACIONAL/RS', 1, N'GRÊMIO/RS', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (680, N'PALMEIRAS/SP', 1, N'CRUZEIRO/MG', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (680, N'AMÉRICA/MG', 1, N'CEARÁ/CE', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (680, N'NÁUTICO/PE', 1, N'BAHIA/BA', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (680, N'PAYSANDU/PA', 1, N'CRICIÚMA/SC', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (680, N'VILA NOVA/GO', 4, N'LONDRINA/PR', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (680, N'FIGUEIRENSE/SC', 0, N'CHAPECOENSE/SC', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (680, N'SPORT/PE', 0, N'ATLÉTICO/PR', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (680, N'JOINVILLE/SC', 1, N'VASCO DA GAMA/RJ', 2, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (680, N'FLUMINENSE/RJ', 3, N'AVAÍ/SC', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (680, N'CORITIBA/PR', 1, N'SANTOS/SP', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (680, N'FLAMENGO/RJ', 1, N'PONTE PRETA/SP', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (680, N'ATLÉTICO/MG', 2, N'GOIÁS/GO', 2, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (681, N'GRÊMIO/RS', 2, N'ATLÉTICO/MG', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (681, N'VASCO DA GAMA/RJ', 1, N'SANTOS/SP', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (681, N'SPORT/PE', 2, N'CORINTHIANS/SP', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (681, N'BOTAFOGO/RJ', 0, N'AMÉRICA/MG', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (681, N'SANTA CRUZ/PE', 3, N'VITÓRIA/BA', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (681, N'BRAGANTINO/SP', 0, N'NÁUTICO/PE', 2, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (681, N'CEARÁ/CE', 1, N'MACAÉ/RJ', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (681, N'CHAPECOENSE/SC', 1, N'GOIÁS/GO', 3, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (681, N'SÃO PAULO/SP', 3, N'FIGUEIRENSE/SC', 2, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (681, N'AVAÍ/SC', 1, N'PONTE PRETA/SP', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (681, N'CRUZEIRO/MG', 3, N'JOINVILLE/SC', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (681, N'PALMEIRAS/SP', 0, N'CORITIBA/PR', 2, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (681, N'ATLÉTICO/PR', 3, N'FLAMENGO/RJ', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (681, N'FLUMINENSE/RJ', 1, N'INTERNACIONAL/RS', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (677, N'ATLÉTICO/MG', 0, N'CORINTHIANS/SP', 3, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (677, N'VASCO DA GAMA/RJ', 0, N'FLUMINENSE/RJ', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (677, N'SANTOS/SP', 2, N'PALMEIRAS/SP', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (677, N'VITÓRIA/BA', 2, N'NÁUTICO/PE', 3, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (677, N'BOTAFOGO/RJ', 1, N'BAHIA/BA', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (677, N'ABC/RN', 2, N'SAMPAIO CORRÊA/MA', 3, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (677, N'PAYSANDU/PA', 5, N'CRB/AL', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (677, N'PONTE PRETA/SP', 1, N'JOINVILLE/SC', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (677, N'CHAPECOENSE/SC', 0, N'ATLÉTICO/PR', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (677, N'AVAÍ/SC', 1, N'CRUZEIRO/MG', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (677, N'CORITIBA/PR', 1, N'FIGUEIRENSE/SC', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (677, N'GOIÁS/GO', 2, N'INTERNACIONAL/RS', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (677, N'SÃO PAULO/SP', 3, N'SPORT/PE', 0, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (677, N'GRÊMIO/RS', 2, N'FLAMENGO/RJ', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (682, N'INTERNACIONAL/RS', 2, N'CRUZEIRO/MG', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (682, N'GOIÁS/GO', 0, N'SÃO PAULO/SP', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (682, N'CORITIBA/PR', 0, N'VASCO DA GAMA/RJ', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (682, N'FLAMENGO/RJ', 1, N'PALMEIRAS/SP', 2, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (682, N'FIGUEIRENSE/SC', 1, N'FLUMINENSE/RJ', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (682, N'JOINVILLE/SC', 0, N'GRÊMIO/RS', 2, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (682, N'SANTOS/SP', 5, N'ATLÉTICO/PR', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (682, N'ATLÉTICO/MG', 3, N'CHAPECOENSE/SC', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (682, N'PONTE PRETA/SP', 0, N'SPORT/PE', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (682, N'CORINTHIANS/SP', 1, N'AVAÍ/SC', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (682, N'F EUCLIDES DA CUNHA/BA', 2, N'F MUNDO NOVO/BA', 1, 7)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (682, N'F LUSACA/BA', 16, N'F CATU/BA', 1, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (682, N'F JUVENTUDE/BA', 4, N'F ITABUNA/BA', 0, 1)
INSERT [dbo].[LotecaJogos] ([IdConcurso], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (682, N'F VITORIA/BA', 9, N'F REDENÇÃO/BA', 0, 1)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (656, 14, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (656, 13, CAST(2791.25 AS Decimal(18, 2)), 44)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (676, 14, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (676, 13, CAST(11594.05 AS Decimal(18, 2)), 10)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (677, 14, CAST(1071115.62 AS Decimal(18, 2)), 2)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (679, 14, CAST(872058.89 AS Decimal(18, 2)), 1)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (679, 13, CAST(6162.78 AS Decimal(18, 2)), 16)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (680, 14, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (680, 13, CAST(11628.19 AS Decimal(18, 2)), 7)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (681, 14, CAST(20878.65 AS Decimal(18, 2)), 70)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (681, 13, CAST(108.39 AS Decimal(18, 2)), 1517)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (677, 13, CAST(2044.38 AS Decimal(18, 2)), 71)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (682, 14, CAST(10677.54 AS Decimal(18, 2)), 35)
INSERT [dbo].[LotecaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (682, 13, CAST(94.39 AS Decimal(18, 2)), 1212)
INSERT [dbo].[LotofacilConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1220, CAST(0x0E3A0B00 AS Date), N'Itabaiana-SE', N'Caminhão Da Sorte', CAST(0.00 AS Decimal(18, 2)), CAST(28675268.00 AS Decimal(18, 2)), CAST(0x103A0B00 AS Date), CAST(1700000.00 AS Decimal(18, 2)), CAST(48741081.74 AS Decimal(18, 2)))
INSERT [dbo].[LotofacilConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1221, CAST(0x103A0B00 AS Date), N'Osasco-SP', N'Estúdio De Tv', CAST(0.00 AS Decimal(18, 2)), CAST(22670382.00 AS Decimal(18, 2)), CAST(0x133A0B00 AS Date), CAST(1700000.00 AS Decimal(18, 2)), CAST(49154967.68 AS Decimal(18, 2)))
INSERT [dbo].[LotofacilConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1277, CAST(0x9A3A0B00 AS Date), N'Ubatuba-SP', N'Caminhão Da Sorte', CAST(0.00 AS Decimal(18, 2)), CAST(20907398.00 AS Decimal(18, 2)), CAST(0x9C3A0B00 AS Date), CAST(1700000.00 AS Decimal(18, 2)), CAST(9267485.38 AS Decimal(18, 2)))
INSERT [dbo].[LotofacilConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1278, CAST(0x9C3A0B00 AS Date), N'Ubatuba-SP', N'Caminhão Da Sorte', CAST(0.00 AS Decimal(18, 2)), CAST(21611388.00 AS Decimal(18, 2)), CAST(0xA03A0B00 AS Date), CAST(1700000.00 AS Decimal(18, 2)), CAST(9774120.75 AS Decimal(18, 2)))
INSERT [dbo].[LotofacilConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1281, CAST(0xA33A0B00 AS Date), N'Presidente Figueiredo-AM', N'Caminhão Da Sorte', CAST(0.00 AS Decimal(18, 2)), CAST(22707396.00 AS Decimal(18, 2)), CAST(0xA63A0B00 AS Date), CAST(1700000.00 AS Decimal(18, 2)), CAST(10638890.34 AS Decimal(18, 2)))
INSERT [dbo].[LotofacilConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1285, CAST(0xAD3A0B00 AS Date), N'Santo Anastácio-SP', N'Caminhão Da Sorte', CAST(0.00 AS Decimal(18, 2)), CAST(21323890.00 AS Decimal(18, 2)), CAST(0xAF3A0B00 AS Date), CAST(1700000.00 AS Decimal(18, 2)), CAST(12364904.35 AS Decimal(18, 2)))
INSERT [dbo].[LotofacilConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1290, CAST(0xB83A0B00 AS Date), N'Cândido Mota-SP', N'Caminhão Da Sorte', CAST(0.00 AS Decimal(18, 2)), CAST(20334992.00 AS Decimal(18, 2)), CAST(0xBB3A0B00 AS Date), CAST(4500000.00 AS Decimal(18, 2)), CAST(14208360.02 AS Decimal(18, 2)))
INSERT [dbo].[LotofacilConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1291, CAST(0xBB3A0B00 AS Date), N'Ji-paraná-RO', N'Caminhão Da Sorte', CAST(0.00 AS Decimal(18, 2)), CAST(27585058.00 AS Decimal(18, 2)), CAST(0xBD3A0B00 AS Date), CAST(7500000.00 AS Decimal(18, 2)), CAST(14784195.65 AS Decimal(18, 2)))
INSERT [dbo].[LotofacilConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1293, CAST(0xBF3A0B00 AS Date), N'Ji-paraná-RO', N'Caminhão Da Sorte', CAST(0.00 AS Decimal(18, 2)), CAST(24707432.00 AS Decimal(18, 2)), CAST(0xC23A0B00 AS Date), CAST(1700000.00 AS Decimal(18, 2)), CAST(15771401.76 AS Decimal(18, 2)))
INSERT [dbo].[LotofacilConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1294, CAST(0xC23A0B00 AS Date), N'Vilhena-RO', N'Caminhão Da Sorte', CAST(0.00 AS Decimal(18, 2)), CAST(23110372.00 AS Decimal(18, 2)), CAST(0xC43A0B00 AS Date), CAST(1700000.00 AS Decimal(18, 2)), CAST(16134125.38 AS Decimal(18, 2)))
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 2)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 3)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 4)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 5)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 6)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 7)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 9)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 13)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 14)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 17)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 18)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 19)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 20)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 23)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1220, 25)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 2)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 3)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 4)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 6)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 9)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 10)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 12)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 14)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 15)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 18)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 19)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 21)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 22)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 23)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1221, 24)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 1)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 2)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 3)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 4)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 6)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 9)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 10)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 12)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 13)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 15)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 17)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 18)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 21)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 22)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1277, 25)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 4)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 6)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 7)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 9)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 10)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 12)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 15)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 16)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 17)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 18)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 19)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 20)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 21)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 22)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1278, 24)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 1)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 3)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 5)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 6)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 8)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 9)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 12)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 13)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 15)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 19)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 21)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 22)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 23)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 24)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1281, 25)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 1)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 2)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 6)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 7)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 10)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 11)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 12)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 15)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 16)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 17)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 18)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 20)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 22)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 24)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1285, 25)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 1)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 3)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 4)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 5)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 6)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 11)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 13)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 14)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 16)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 19)
GO
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 20)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 21)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 22)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 23)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1290, 25)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 1)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 6)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 7)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 8)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 10)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 11)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 12)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 13)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 15)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 16)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 18)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 19)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 20)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 21)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1291, 24)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 1)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 2)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 7)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 8)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 9)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 10)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 11)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 12)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 13)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 15)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 17)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 18)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 20)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 22)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1293, 24)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 2)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 5)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 6)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 7)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 8)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 10)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 11)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 12)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 13)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 14)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 16)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 18)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 20)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 23)
INSERT [dbo].[LotofacilDezenas] ([IdConcurso], [dezena]) VALUES (1294, 25)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 7)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 1)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 20)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 12)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 6)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 14)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 5)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 3)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 25)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 19)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 10)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 4)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 11)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 13)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1279, 2)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 7)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 19)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 16)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 10)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 1)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 13)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 8)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 4)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 15)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 14)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 5)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 20)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 12)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 6)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1282, 2)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 1)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 19)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 6)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 7)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 19)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 12)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 2)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 5)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 17)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 1)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 4)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 10)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 8)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 21)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 3)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 14)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1294, 11)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 10)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 16)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 13)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 5)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 23)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 7)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 3)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 12)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 9)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 21)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 11)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 2)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1286, 17)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 17)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 11)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 8)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 19)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 15)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 1)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 6)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 7)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 14)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 12)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 4)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 24)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 13)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 2)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1291, 10)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 4)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 9)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 10)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 18)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 11)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 24)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 3)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 8)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 23)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 14)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 6)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 17)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 12)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 5)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1292, 22)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 8)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 5)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 4)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 15)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 22)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 3)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 2)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 1)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 9)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 25)
GO
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 17)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 10)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 19)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 16)
INSERT [dbo].[LotofacilPalpites] ([idConcurso], [dezena]) VALUES (1295, 6)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1220, 15, CAST(1026828.47 AS Decimal(18, 2)), 4)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1220, 14, CAST(1371.62 AS Decimal(18, 2)), 473)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1220, 13, CAST(20.00 AS Decimal(18, 2)), 20133)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1220, 12, CAST(8.00 AS Decimal(18, 2)), 266061)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1220, 11, CAST(4.00 AS Decimal(18, 2)), 1364338)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1221, 15, CAST(896752.87 AS Decimal(18, 2)), 2)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1221, 14, CAST(1395.31 AS Decimal(18, 2)), 565)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1221, 13, CAST(20.00 AS Decimal(18, 2)), 17566)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1221, 12, CAST(8.00 AS Decimal(18, 2)), 198564)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1221, 11, CAST(4.00 AS Decimal(18, 2)), 1024426)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1277, 15, CAST(615929.93 AS Decimal(18, 2)), 3)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1277, 14, CAST(1862.87 AS Decimal(18, 2)), 436)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1277, 13, CAST(20.00 AS Decimal(18, 2)), 14412)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1277, 12, CAST(8.00 AS Decimal(18, 2)), 161841)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1277, 11, CAST(4.00 AS Decimal(18, 2)), 889803)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1285, 15, CAST(961810.09 AS Decimal(18, 2)), 2)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1285, 14, CAST(1883.17 AS Decimal(18, 2)), 449)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1285, 13, CAST(20.00 AS Decimal(18, 2)), 15313)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1285, 12, CAST(8.00 AS Decimal(18, 2)), 163114)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1285, 11, CAST(4.00 AS Decimal(18, 2)), 886921)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1290, 15, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1290, 14, CAST(2186.98 AS Decimal(18, 2)), 255)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1290, 13, CAST(20.00 AS Decimal(18, 2)), 11112)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1290, 12, CAST(8.00 AS Decimal(18, 2)), 147112)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1290, 11, CAST(4.00 AS Decimal(18, 2)), 892183)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1291, 15, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1291, 14, CAST(2132.72 AS Decimal(18, 2)), 360)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1291, 13, CAST(20.00 AS Decimal(18, 2)), 14360)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1291, 12, CAST(8.00 AS Decimal(18, 2)), 208756)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1291, 11, CAST(4.00 AS Decimal(18, 2)), 1175327)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1294, 15, CAST(785901.18 AS Decimal(18, 2)), 2)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1294, 14, CAST(1384.57 AS Decimal(18, 2)), 499)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1294, 13, CAST(20.00 AS Decimal(18, 2)), 20787)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1294, 12, CAST(8.00 AS Decimal(18, 2)), 233089)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1294, 11, CAST(4.00 AS Decimal(18, 2)), 1109506)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1278, 15, CAST(1097709.98 AS Decimal(18, 2)), 2)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1278, 14, CAST(2874.53 AS Decimal(18, 2)), 235)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1278, 13, CAST(20.00 AS Decimal(18, 2)), 10251)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1278, 12, CAST(8.00 AS Decimal(18, 2)), 147529)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1278, 11, CAST(4.00 AS Decimal(18, 2)), 825699)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1293, 15, CAST(295302.17 AS Decimal(18, 2)), 5)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1293, 14, CAST(777.26 AS Decimal(18, 2)), 835)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1293, 13, CAST(20.00 AS Decimal(18, 2)), 24797)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1293, 12, CAST(8.00 AS Decimal(18, 2)), 278959)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1293, 11, CAST(4.00 AS Decimal(18, 2)), 1225827)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1281, 15, CAST(539833.86 AS Decimal(18, 2)), 3)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1281, 14, CAST(1240.18 AS Decimal(18, 2)), 574)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1281, 13, CAST(20.00 AS Decimal(18, 2)), 18293)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1281, 12, CAST(8.00 AS Decimal(18, 2)), 211250)
INSERT [dbo].[LotofacilPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1281, 11, CAST(4.00 AS Decimal(18, 2)), 1095099)
INSERT [dbo].[LotogolConcursos] ([idConcurso], [data], [valorAcumulado1], [valorAcumulado2], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado]) VALUES (704, CAST(0x0C3A0B00 AS Date), CAST(95210.13 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(345192.00 AS Decimal(18, 2)), CAST(0x0F3A0B00 AS Date), CAST(140000.00 AS Decimal(18, 2)))
INSERT [dbo].[LotogolConcursos] ([idConcurso], [data], [valorAcumulado1], [valorAcumulado2], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado]) VALUES (705, CAST(0x0F3A0B00 AS Date), CAST(126934.51 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(296000.00 AS Decimal(18, 2)), CAST(0x133A0B00 AS Date), CAST(160000.00 AS Decimal(18, 2)))
INSERT [dbo].[LotogolConcursos] ([idConcurso], [data], [valorAcumulado1], [valorAcumulado2], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado]) VALUES (745, CAST(0x9B3A0B00 AS Date), CAST(191415.80 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(323929.00 AS Decimal(18, 2)), CAST(0xA03A0B00 AS Date), CAST(230000.00 AS Decimal(18, 2)))
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (704, 1, N'BRASIL', 2, N'MÉXICO', 0, 1)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (704, 2, N'ATLÉTICO/MG', 1, N'CRUZEIRO/MG', 3, 7)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (704, 3, N'SÃO PAULO/SP', 2, N'GRÊMIO/RS', 0, 7)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (704, 4, N'PAYSANDU/PA', 2, N'PARANÁ/PR', 1, 7)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (704, 5, N'BRAGANTINO/SP', 2, N'BAHIA/BA', 0, 7)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (705, 1, N'BRASIL', 1, N'HONDURAS', 0, 4)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (705, 2, N'ATLÉTICO/MG', 2, N'SANTOS/SP', 2, 4)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (705, 3, N'TREZE/PB', 2, N'BOTAFOGO/PB', 0, 4)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (705, 4, N'AUTO ESPORTE/PB', 0, N'CAMPINENSE/PB', 2, 4)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (705, 5, N'ALEMANHA', 1, N'ESTADOS UNIDOS', 2, 4)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (745, 1, N'PALMEIRAS/SP', 2, N'FLUMINENSE/RJ', 1, 4)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (745, 2, N'SANTOS/SP', 3, N'SÃO PAULO/SP', 1, 4)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (745, 3, N'FRIBURGUENSE/RJ', 0, N'ANGRA DOS REIS/RJ', 1, 4)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (745, 4, N'NOVA IGUAÇU/RJ', 3, N'TIGRES/RJ', 1, 4)
INSERT [dbo].[LotogolJogos] ([IdConcurso], [jogo], [time1], [gols1], [time2], [gols2], [diaSemana]) VALUES (745, 5, N'ATLÉTICO/MG', 2, N'FIGUEIRENSE/SC', 0, 4)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (704, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (704, 4, CAST(509.46 AS Decimal(18, 2)), 135)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (704, 3, CAST(9.07 AS Decimal(18, 2)), 4369)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (705, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (705, 4, CAST(2974.16 AS Decimal(18, 2)), 8)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (705, 3, CAST(85.83 AS Decimal(18, 2)), 396)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (745, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (745, 4, CAST(361.14 AS Decimal(18, 2)), 103)
INSERT [dbo].[LotogolPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (745, 3, CAST(15.19 AS Decimal(18, 2)), 2448)
INSERT [dbo].[LotomaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1562, CAST(0x0E3A0B00 AS Date), N'ITABAIANA-SE', N'Caminhão da Sorte', CAST(1222487.05 AS Decimal(18, 2)), CAST(4816929.00 AS Decimal(18, 2)), CAST(0x113A0B00 AS Date), CAST(1800000.00 AS Decimal(18, 2)), CAST(6118928.54 AS Decimal(18, 2)))
INSERT [dbo].[LotomaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1602, CAST(0x9A3A0B00 AS Date), N'UBATUBA-SP', N'Caminhão da Sorte', CAST(0.00 AS Decimal(18, 2)), CAST(4969693.50 AS Decimal(18, 2)), CAST(0x9D3A0B00 AS Date), CAST(500000.00 AS Decimal(18, 2)), CAST(16886469.81 AS Decimal(18, 2)))
INSERT [dbo].[LotomaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1603, CAST(0x9D3A0B00 AS Date), N'UBATUBA-SP', N'Caminhão da Sorte', CAST(591947.71 AS Decimal(18, 2)), CAST(4231936.50 AS Decimal(18, 2)), CAST(0xA13A0B00 AS Date), CAST(1000000.00 AS Decimal(18, 2)), CAST(17121190.43 AS Decimal(18, 2)))
INSERT [dbo].[LotomaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1605, CAST(0xA43A0B00 AS Date), N'PRESIDENTE FIGUEIREDO-AM', N'Caminhão da Sorte', CAST(0.00 AS Decimal(18, 2)), CAST(4930737.00 AS Decimal(18, 2)), CAST(0xA83A0B00 AS Date), CAST(400000.00 AS Decimal(18, 2)), CAST(17611351.85 AS Decimal(18, 2)))
INSERT [dbo].[LotomaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1607, CAST(0xAB3A0B00 AS Date), N'MANACAPURU-AM', N'Caminhão da Sorte', CAST(975933.49 AS Decimal(18, 2)), CAST(4622974.50 AS Decimal(18, 2)), CAST(0xAF3A0B00 AS Date), CAST(1500000.00 AS Decimal(18, 2)), CAST(18099318.63 AS Decimal(18, 2)))
INSERT [dbo].[LotomaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1611, CAST(0xB93A0B00 AS Date), N'CÂNDIDO MOTA-SP', N'Caminhão da Sorte', CAST(971259.80 AS Decimal(18, 2)), CAST(4375756.50 AS Decimal(18, 2)), CAST(0xBD3A0B00 AS Date), CAST(1400000.00 AS Decimal(18, 2)), CAST(19095638.83 AS Decimal(18, 2)))
INSERT [dbo].[LotomaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1613, CAST(0xC03A0B00 AS Date), N'JI-PARANÁ-RO', N'Caminhão da Sorte', CAST(2057998.12 AS Decimal(18, 2)), CAST(5186160.00 AS Decimal(18, 2)), CAST(0xC43A0B00 AS Date), CAST(2600000.00 AS Decimal(18, 2)), CAST(19639008.00 AS Decimal(18, 2)))
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 2)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 7)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 16)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 17)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 21)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 26)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 33)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 50)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 54)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 57)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 63)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 64)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 71)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 72)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 74)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 79)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 84)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 85)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 92)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1562, 97)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 18)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 19)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 24)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 32)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 34)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 35)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 37)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 41)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 47)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 61)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 62)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 66)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 72)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 77)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 79)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 88)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 93)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 95)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 97)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1602, 99)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 20)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 24)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 30)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 32)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 34)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 37)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 42)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 52)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 53)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 62)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 66)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 69)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 76)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 80)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 81)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 86)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 88)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 91)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 93)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1603, 96)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 3)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 15)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 18)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 24)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 31)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 32)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 35)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 37)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 39)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 40)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 45)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 48)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 52)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 54)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 55)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 57)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 58)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 59)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 60)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1605, 96)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 10)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 11)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 12)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 14)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 17)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 30)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 31)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 34)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 36)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 42)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 47)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 52)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 54)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 58)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 65)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 69)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 71)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 75)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 96)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1607, 99)
GO
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 0)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 1)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 2)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 5)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 11)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 13)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 21)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 22)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 28)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 30)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 45)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 46)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 48)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 54)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 64)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 71)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 80)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 89)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 96)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1611, 97)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 3)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 12)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 17)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 23)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 32)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 36)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 45)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 48)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 56)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 65)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 72)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 73)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 74)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 75)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 78)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 80)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 84)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 90)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 91)
INSERT [dbo].[LotomaniaDezenas] ([IdConcurso], [dezena]) VALUES (1613, 97)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 8)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 44)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 26)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 63)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 46)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 84)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 15)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 4)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 38)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 21)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 57)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 100)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 75)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 12)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 19)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 29)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 67)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 51)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 90)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 71)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 25)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 60)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 17)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 11)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 70)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 7)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 56)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 98)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 50)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 43)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 45)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 3)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 36)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 18)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 89)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 83)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 74)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 28)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 65)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 23)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 59)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 14)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 16)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 10)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 68)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 6)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 55)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 94)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 49)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1604, 40)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 56)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 19)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 84)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 2)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 43)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 17)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 73)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 46)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 98)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 10)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 48)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 29)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 13)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 67)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 39)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 89)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 6)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 41)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 25)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 78)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 83)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 71)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 12)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 65)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 1)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 38)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 47)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 31)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 51)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 15)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 44)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 28)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 40)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 23)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 94)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 9)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 87)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 75)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 16)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 70)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 11)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 5)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 82)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 54)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 45)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 64)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 30)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 50)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 3)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1606, 36)
GO
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 61)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 20)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 70)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 3)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 87)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 32)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 61)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 29)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 81)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 66)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 98)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 19)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 21)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 50)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 23)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 76)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 12)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 92)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 7)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 14)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 43)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 85)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 2)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 63)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 95)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 41)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 84)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 27)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 16)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 91)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 6)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 86)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 79)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 20)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 74)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 28)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 56)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 18)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 10)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 68)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 1)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 62)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 49)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 13)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 38)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 26)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 94)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 9)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 90)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 4)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 83)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1612, 78)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 57)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 1)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 82)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 34)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 3)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 26)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 68)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 50)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 94)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 76)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 23)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 39)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 19)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 62)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 43)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 87)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 7)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 13)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 33)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 9)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 100)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 2)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 93)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 41)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 86)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 25)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 67)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 18)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 6)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 81)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 32)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 70)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 61)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 8)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 55)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 22)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 38)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 10)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 98)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 49)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 92)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 40)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 29)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 24)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 85)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 4)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 79)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 66)
GO
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 16)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1614, 60)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 16)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 82)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 49)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 11)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 84)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 55)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 29)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 8)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 70)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 38)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 98)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 72)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 41)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 25)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 4)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 63)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 17)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 89)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 78)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 7)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 68)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 2)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 60)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 83)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 53)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 56)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 15)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 46)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 28)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 40)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 23)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 19)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 10)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 33)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 94)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 13)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 74)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 6)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 71)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 87)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 59)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 67)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 1)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 51)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 48)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 27)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 39)
INSERT [dbo].[LotomaniaPalpites] ([idConcurso], [dezena]) VALUES (1608, 14)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1562, 20, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1562, 19, CAST(15832.10 AS Decimal(18, 2)), 15)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1562, 18, CAST(1730.91 AS Decimal(18, 2)), 196)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1562, 17, CAST(97.52 AS Decimal(18, 2)), 1522)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1562, 16, CAST(20.39 AS Decimal(18, 2)), 7277)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1562, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1602, 20, CAST(3396829.62 AS Decimal(18, 2)), 1)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1602, 19, CAST(49002.60 AS Decimal(18, 2)), 5)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1602, 18, CAST(1353.66 AS Decimal(18, 2)), 181)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1602, 17, CAST(99.69 AS Decimal(18, 2)), 1536)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1602, 16, CAST(17.46 AS Decimal(18, 2)), 8770)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1602, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1603, 20, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1603, 19, CAST(18967.32 AS Decimal(18, 2)), 11)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1603, 18, CAST(1768.14 AS Decimal(18, 2)), 118)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1603, 17, CAST(139.31 AS Decimal(18, 2)), 936)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1603, 16, CAST(24.38 AS Decimal(18, 2)), 5347)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1603, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1607, 20, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1607, 19, CAST(45583.86 AS Decimal(18, 2)), 5)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1607, 18, CAST(1663.65 AS Decimal(18, 2)), 137)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1607, 17, CAST(117.14 AS Decimal(18, 2)), 1216)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1607, 16, CAST(21.17 AS Decimal(18, 2)), 6728)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1607, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1605, 20, CAST(1354420.97 AS Decimal(18, 2)), 1)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1605, 19, CAST(4961.07 AS Decimal(18, 2)), 49)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1605, 18, CAST(313.42 AS Decimal(18, 2)), 1108)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1605, 17, CAST(54.65 AS Decimal(18, 2)), 2780)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1605, 16, CAST(11.22 AS Decimal(18, 2)), 13535)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1605, 0, CAST(40515.40 AS Decimal(18, 2)), 3)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1611, 20, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1611, 19, CAST(11354.27 AS Decimal(18, 2)), 19)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1611, 18, CAST(1247.72 AS Decimal(18, 2)), 247)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1611, 17, CAST(138.85 AS Decimal(18, 2)), 971)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1611, 16, CAST(22.48 AS Decimal(18, 2)), 5997)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1611, 0, CAST(107865.54 AS Decimal(18, 2)), 1)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1613, 20, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1613, 19, CAST(28409.46 AS Decimal(18, 2)), 9)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1613, 18, CAST(2130.71 AS Decimal(18, 2)), 120)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1613, 17, CAST(134.40 AS Decimal(18, 2)), 1189)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1613, 16, CAST(21.86 AS Decimal(18, 2)), 7309)
INSERT [dbo].[LotomaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1613, 0, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[MegasenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1711, CAST(0x0A3A0B00 AS Date), N'PIQUEROBI-SP', N'Caminhão da Sorte', CAST(41133200.24 AS Decimal(18, 2)), CAST(65167424.00 AS Decimal(18, 2)), CAST(0x0E3A0B00 AS Date), CAST(50000000.00 AS Decimal(18, 2)), CAST(29936980.56 AS Decimal(18, 2)))
INSERT [dbo].[MegasenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1712, CAST(0x0E3A0B00 AS Date), N'OSASCO-SP', N'Caminhão da Sorte', CAST(50996825.22 AS Decimal(18, 2)), CAST(91459522.00 AS Decimal(18, 2)), CAST(0x113A0B00 AS Date), CAST(65000000.00 AS Decimal(18, 2)), CAST(31346069.86 AS Decimal(18, 2)))
INSERT [dbo].[MegasenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1755, CAST(0x9A3A0B00 AS Date), N'UBATUBA-SP', N'Caminhão da Sorte', CAST(24144408.92 AS Decimal(18, 2)), CAST(48595981.00 AS Decimal(18, 2)), CAST(0x9D3A0B00 AS Date), CAST(30000000.00 AS Decimal(18, 2)), CAST(62065273.25 AS Decimal(18, 2)))
INSERT [dbo].[MegasenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1756, CAST(0x9D3A0B00 AS Date), N'UBATUBA-SP', N'Caminhão da Sorte', CAST(30571964.48 AS Decimal(18, 2)), CAST(59598896.00 AS Decimal(18, 2)), CAST(0xA13A0B00 AS Date), CAST(39000000.00 AS Decimal(18, 2)), CAST(62983495.49 AS Decimal(18, 2)))
INSERT [dbo].[MegasenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1758, CAST(0xA43A0B00 AS Date), N'PRESIDENTE FIGUEIREDO-AM', N'Caminhão da Sorte', CAST(45892144.25 AS Decimal(18, 2)), CAST(82781160.00 AS Decimal(18, 2)), CAST(0xA73A0B00 AS Date), CAST(55000000.00 AS Decimal(18, 2)), CAST(65172092.63 AS Decimal(18, 2)))
INSERT [dbo].[MegasenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1761, CAST(0xAB3A0B00 AS Date), N'MANACAPURU-AM', N'Caminhão da Sorte', CAST(104328919.97 AS Decimal(18, 2)), CAST(165510502.50 AS Decimal(18, 2)), CAST(0xAF3A0B00 AS Date), CAST(130000000.00 AS Decimal(18, 2)), CAST(70506589.05 AS Decimal(18, 2)))
INSERT [dbo].[MegasenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1765, CAST(0xB93A0B00 AS Date), N'CÂNDIDO MOTA-SP', N'Caminhão da Sorte', CAST(92385569.00 AS Decimal(18, 2)), CAST(88630710.00 AS Decimal(18, 2)), CAST(0xBD3A0B00 AS Date), CAST(105000000.00 AS Decimal(18, 2)), CAST(86300786.31 AS Decimal(18, 2)))
INSERT [dbo].[MegasenaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (1767, CAST(0xC03A0B00 AS Date), N'JI-PARANÁ-RO', N'Caminhão da Sorte', CAST(112374242.31 AS Decimal(18, 2)), CAST(94503941.00 AS Decimal(18, 2)), CAST(0xC43A0B00 AS Date), CAST(125000000.00 AS Decimal(18, 2)), CAST(89156311.09 AS Decimal(18, 2)))
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1711, 22)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1711, 26)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1711, 38)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1711, 39)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1711, 45)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1711, 50)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1712, 2)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1712, 12)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1712, 19)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1712, 29)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1712, 50)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1712, 59)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1755, 2)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1755, 5)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1755, 8)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1755, 18)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1755, 30)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1755, 48)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1756, 6)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1756, 13)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1756, 14)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1756, 28)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1756, 35)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1756, 45)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1758, 6)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1758, 11)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1758, 16)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1758, 23)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1758, 36)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1758, 42)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1761, 9)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1761, 10)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1761, 36)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1761, 50)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1761, 53)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1761, 55)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1765, 1)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1765, 6)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1765, 28)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1765, 37)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1765, 56)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1765, 58)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1767, 16)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1767, 26)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1767, 35)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1767, 39)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1767, 44)
INSERT [dbo].[MegasenaDezenas] ([IdConcurso], [dezena]) VALUES (1767, 45)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1757, 1)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1757, 15)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1757, 23)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1757, 20)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1757, 27)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1757, 7)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1768, 23)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1768, 9)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1768, 5)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1768, 13)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1768, 10)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1768, 18)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1759, 10)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1759, 22)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1759, 19)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1759, 27)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1759, 24)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1759, 1)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1762, 24)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1762, 5)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1762, 2)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1762, 13)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1762, 21)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1762, 18)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1766, 3)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1766, 23)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1766, 8)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1766, 17)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1766, 14)
INSERT [dbo].[MegasenaPalpites] ([idConcurso], [dezena]) VALUES (1766, 21)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1711, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1711, 5, CAST(44885.37 AS Decimal(18, 2)), 85)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1711, 4, CAST(891.74 AS Decimal(18, 2)), 6112)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1712, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1712, 5, CAST(31683.66 AS Decimal(18, 2)), 169)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1712, 4, CAST(810.05 AS Decimal(18, 2)), 9443)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1755, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1755, 5, CAST(23130.69 AS Decimal(18, 2)), 123)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1755, 4, CAST(462.70 AS Decimal(18, 2)), 8784)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1756, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1756, 5, CAST(26039.14 AS Decimal(18, 2)), 134)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1756, 4, CAST(483.47 AS Decimal(18, 2)), 10310)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1767, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1767, 5, CAST(65866.39 AS Decimal(18, 2)), 84)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1767, 4, CAST(1038.90 AS Decimal(18, 2)), 7608)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1758, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1758, 5, CAST(21071.57 AS Decimal(18, 2)), 230)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1758, 4, CAST(501.70 AS Decimal(18, 2)), 13800)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1765, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1765, 5, CAST(28048.25 AS Decimal(18, 2)), 185)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1765, 4, CAST(811.20 AS Decimal(18, 2)), 9138)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1761, 6, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1761, 5, CAST(55056.18 AS Decimal(18, 2)), 176)
INSERT [dbo].[MegasenaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (1761, 4, CAST(776.76 AS Decimal(18, 2)), 17821)
INSERT [dbo].[QuinaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (3809, CAST(0x0E3A0B00 AS Date), N'ITABAIANA-SE', N'Caminhão da Sorte', CAST(658437.00 AS Decimal(18, 2)), CAST(6105294.50 AS Decimal(18, 2)), CAST(0x0F3A0B00 AS Date), CAST(1300000.00 AS Decimal(18, 2)), CAST(97997579.84 AS Decimal(18, 2)))
INSERT [dbo].[QuinaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (3811, CAST(0x103A0B00 AS Date), N'ITABAIANA-SE', N'Caminhão da Sorte', CAST(2215307.49 AS Decimal(18, 2)), CAST(7625335.00 AS Decimal(18, 2)), CAST(0x113A0B00 AS Date), CAST(3000000.00 AS Decimal(18, 2)), CAST(98664810.08 AS Decimal(18, 2)))
INSERT [dbo].[QuinaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (3921, CAST(0x9B3A0B00 AS Date), N'UBATUBA-SP', N'Caminhão da Sorte', CAST(12596599.68 AS Decimal(18, 2)), CAST(13153172.00 AS Decimal(18, 2)), CAST(0x9C3A0B00 AS Date), CAST(14000000.00 AS Decimal(18, 2)), CAST(39303229.15 AS Decimal(18, 2)))
INSERT [dbo].[QuinaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (3923, CAST(0x9D3A0B00 AS Date), N'UBATUBA-SP', N'Caminhão da Sorte', CAST(0.00 AS Decimal(18, 2)), CAST(13546403.00 AS Decimal(18, 2)), CAST(0xA03A0B00 AS Date), CAST(500000.00 AS Decimal(18, 2)), CAST(40609697.03 AS Decimal(18, 2)))
INSERT [dbo].[QuinaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (3928, CAST(0xA43A0B00 AS Date), N'PRESIDENTE FIGUEIREDO-AM', N'Caminhão da Sorte', CAST(4025971.87 AS Decimal(18, 2)), CAST(8769018.50 AS Decimal(18, 2)), CAST(0xA63A0B00 AS Date), CAST(5000000.00 AS Decimal(18, 2)), CAST(42335113.59 AS Decimal(18, 2)))
INSERT [dbo].[QuinaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (3936, CAST(0xAE3A0B00 AS Date), N'SANTO ANASTÁCIO-SP', N'Caminhão da Sorte', CAST(2791114.22 AS Decimal(18, 2)), CAST(7294609.00 AS Decimal(18, 2)), CAST(0xAF3A0B00 AS Date), CAST(3600000.00 AS Decimal(18, 2)), CAST(44733511.71 AS Decimal(18, 2)))
INSERT [dbo].[QuinaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (3946, CAST(0xB93A0B00 AS Date), N'CÂNDIDO MOTA-SP', N'Caminhão da Sorte', CAST(582941.33 AS Decimal(18, 2)), CAST(5405268.00 AS Decimal(18, 2)), CAST(0xBB3A0B00 AS Date), CAST(1200000.00 AS Decimal(18, 2)), CAST(47638849.85 AS Decimal(18, 2)))
INSERT [dbo].[QuinaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (3947, CAST(0xBB3A0B00 AS Date), N'JI-PARANÁ-RO', N'Caminhão da Sorte', CAST(1207061.29 AS Decimal(18, 2)), CAST(5787093.00 AS Decimal(18, 2)), CAST(0xBC3A0B00 AS Date), CAST(2000000.00 AS Decimal(18, 2)), CAST(47906329.85 AS Decimal(18, 2)))
INSERT [dbo].[QuinaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (3952, CAST(0xC03A0B00 AS Date), N'JI-PARANÁ-RO', N'Caminhão da Sorte', CAST(5588910.68 AS Decimal(18, 2)), CAST(8864269.00 AS Decimal(18, 2)), CAST(0xC23A0B00 AS Date), CAST(6500000.00 AS Decimal(18, 2)), CAST(49784265.34 AS Decimal(18, 2)))
INSERT [dbo].[QuinaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (3954, CAST(0xC33A0B00 AS Date), N'VILHENA-RO', N'Caminhão da Sorte', CAST(7611144.60 AS Decimal(18, 2)), CAST(9317741.00 AS Decimal(18, 2)), CAST(0xC43A0B00 AS Date), CAST(8700000.00 AS Decimal(18, 2)), CAST(50650937.04 AS Decimal(18, 2)))
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3809, 30)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3809, 33)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3809, 61)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3809, 66)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3809, 67)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3811, 1)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3811, 16)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3811, 30)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3811, 73)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3811, 80)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3921, 31)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3921, 32)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3921, 49)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3921, 50)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3921, 54)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3923, 4)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3923, 38)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3923, 44)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3923, 49)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3923, 66)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3928, 18)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3928, 41)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3928, 43)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3928, 59)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3928, 71)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3936, 11)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3936, 13)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3936, 29)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3936, 60)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3936, 76)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3946, 12)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3946, 21)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3946, 49)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3946, 56)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3946, 73)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3947, 10)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3947, 54)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3947, 56)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3947, 66)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3947, 80)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3952, 31)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3952, 49)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3952, 56)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3952, 62)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3952, 66)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3954, 4)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3954, 13)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3954, 16)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3954, 49)
INSERT [dbo].[QuinaDezenas] ([IdConcurso], [dezena]) VALUES (3954, 74)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3924, 28)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3924, 23)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3924, 3)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3924, 15)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3924, 10)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3929, 5)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3929, 34)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3929, 11)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3929, 6)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3929, 17)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3937, 16)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3937, 9)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3953, 9)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3953, 5)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3953, 17)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3953, 11)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3953, 24)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3937, 23)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3937, 1)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3937, 30)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3947, 5)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3947, 16)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3947, 28)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3947, 23)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3947, 2)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3948, 19)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3948, 30)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3948, 26)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3948, 3)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3948, 16)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3955, 30)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3955, 6)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3955, 20)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3955, 14)
INSERT [dbo].[QuinaPalpites] ([idConcurso], [dezena]) VALUES (3955, 27)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3809, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3809, 4, CAST(18812.48 AS Decimal(18, 2)), 25)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3809, 3, CAST(270.26 AS Decimal(18, 2)), 2486)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3811, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3811, 4, CAST(8767.26 AS Decimal(18, 2)), 67)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3811, 3, CAST(201.57 AS Decimal(18, 2)), 4163)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3921, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3921, 4, CAST(10032.03 AS Decimal(18, 2)), 101)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3921, 3, CAST(235.86 AS Decimal(18, 2)), 6137)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3923, 5, CAST(7822512.35 AS Decimal(18, 2)), 2)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3923, 4, CAST(8027.13 AS Decimal(18, 2)), 130)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3923, 3, CAST(160.62 AS Decimal(18, 2)), 9281)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3928, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3928, 4, CAST(15011.29 AS Decimal(18, 2)), 45)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3928, 3, CAST(226.84 AS Decimal(18, 2)), 4254)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3936, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3936, 4, CAST(11706.86 AS Decimal(18, 2)), 48)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3936, 3, CAST(174.74 AS Decimal(18, 2)), 4594)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3946, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3946, 4, CAST(9913.97 AS Decimal(18, 2)), 42)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3946, 3, CAST(196.96 AS Decimal(18, 2)), 3020)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3947, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3947, 4, CAST(11731.58 AS Decimal(18, 2)), 38)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3947, 3, CAST(189.87 AS Decimal(18, 2)), 3354)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3954, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3954, 4, CAST(7801.94 AS Decimal(18, 2)), 92)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3954, 3, CAST(147.43 AS Decimal(18, 2)), 6955)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3952, 5, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3952, 4, CAST(11380.76 AS Decimal(18, 2)), 60)
INSERT [dbo].[QuinaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (3952, 3, CAST(236.77 AS Decimal(18, 2)), 4120)
INSERT [dbo].[TimemaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (735, CAST(0x0D3A0B00 AS Date), N'ITABAIANA-SE', N'Caminhão da Sorte', CAST(3875386.13 AS Decimal(18, 2)), CAST(1808252.00 AS Decimal(18, 2)), CAST(0x0F3A0B00 AS Date), CAST(4200000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[TimemaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (736, CAST(0x0F3A0B00 AS Date), N'ITABAIANA-SE', N'Caminhão da Sorte', CAST(4150927.73 AS Decimal(18, 2)), CAST(2041432.00 AS Decimal(18, 2)), CAST(0x113A0B00 AS Date), CAST(4400000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[TimemaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (796, CAST(0x9B3A0B00 AS Date), N'UBATUBA-SP', N'Caminhão da Sorte', CAST(20624068.23 AS Decimal(18, 2)), CAST(4743638.00 AS Decimal(18, 2)), CAST(0x9D3A0B00 AS Date), CAST(21000000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[TimemaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (797, CAST(0x9D3A0B00 AS Date), N'UBATUBA-SP', N'CAMINHÃO DA SORTE', CAST(21206655.87 AS Decimal(18, 2)), CAST(4671022.00 AS Decimal(18, 2)), CAST(0xA03A0B00 AS Date), CAST(21700000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[TimemaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (800, CAST(0xA43A0B00 AS Date), N'PRESIDENTE FIGUEIREDO-AM', N'Caminhão da Sorte', CAST(23885891.27 AS Decimal(18, 2)), CAST(5184664.00 AS Decimal(18, 2)), CAST(0xA73A0B00 AS Date), CAST(24500000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[TimemaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (804, CAST(0xAE3A0B00 AS Date), N'SANTO ANASTÁCIO-SP', N'Caminhão da Sorte', CAST(966076.63 AS Decimal(18, 2)), CAST(1330968.00 AS Decimal(18, 2)), CAST(0xB03A0B00 AS Date), CAST(1200000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[TimemaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (809, CAST(0xB93A0B00 AS Date), N'CÂNDIDO MOTA-SP', N'Caminhão da Sorte', CAST(2185485.36 AS Decimal(18, 2)), CAST(1643306.00 AS Decimal(18, 2)), CAST(0xBC3A0B00 AS Date), CAST(2500000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[TimemaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (812, CAST(0xC03A0B00 AS Date), N'JI-PARANÁ-RO', N'Caminhão da Sorte', CAST(405850.23 AS Decimal(18, 2)), CAST(1354864.00 AS Decimal(18, 2)), CAST(0xC33A0B00 AS Date), CAST(600000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[TimemaniaConcursos] ([idConcurso], [data], [cidade], [local], [valorAcumulado], [arrecadacaoTotal], [proximoConcursoData], [proximoConcursoValorEstimado], [especialValorAcumulado]) VALUES (813, CAST(0xC33A0B00 AS Date), N'VILHENA-RO', N'Caminhão da Sorte', CAST(558738.90 AS Decimal(18, 2)), CAST(1226806.00 AS Decimal(18, 2)), CAST(0xC53A0B00 AS Date), CAST(800000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (735, 4)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (735, 24)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (735, 37)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (735, 64)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (735, 69)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (735, 73)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (735, 74)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (736, 27)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (736, 36)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (736, 41)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (736, 54)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (736, 58)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (736, 72)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (736, 73)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (796, 6)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (796, 23)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (796, 25)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (796, 53)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (796, 61)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (796, 64)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (796, 75)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (797, 6)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (797, 34)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (797, 58)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (797, 61)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (797, 63)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (797, 69)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (797, 71)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (800, 6)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (800, 18)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (800, 24)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (800, 27)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (800, 45)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (800, 51)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (800, 64)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (804, 1)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (804, 6)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (804, 11)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (804, 14)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (804, 22)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (804, 38)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (804, 49)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (809, 7)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (809, 8)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (809, 17)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (809, 20)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (809, 37)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (809, 61)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (809, 69)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (812, 18)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (812, 43)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (812, 44)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (812, 47)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (812, 50)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (812, 58)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (812, 65)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (813, 2)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (813, 24)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (813, 36)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (813, 52)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (813, 54)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (813, 74)
INSERT [dbo].[TimemaniaDezenas] ([IdConcurso], [dezena]) VALUES (813, 79)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (798, 17)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (798, 29)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (798, 22)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (798, 2)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (798, 30)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (798, 9)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (798, 20)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (798, 15)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (798, 28)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (798, 21)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (801, 26)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (801, 1)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (801, 33)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (801, 8)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (801, 20)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (801, 14)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (801, 30)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (801, 21)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (801, 37)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (801, 12)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (805, 34)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (805, 9)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (805, 3)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (805, 16)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (805, 10)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (805, 25)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (805, 37)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (805, 32)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (805, 7)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (805, 39)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (814, 19)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (814, 12)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (814, 27)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (814, 21)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (814, 33)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (814, 9)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (814, 1)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (814, 15)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (814, 10)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (814, 25)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (810, 15)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (810, 5)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (810, 24)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (810, 16)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (810, 29)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (810, 2)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (810, 35)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (810, 12)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (810, 3)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (810, 21)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (813, 13)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (813, 27)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (813, 22)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (813, 33)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (813, 28)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (813, 4)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (813, 19)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (813, 12)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (813, 26)
INSERT [dbo].[TimemaniaPalpites] ([idConcurso], [dezena]) VALUES (813, 21)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (735, 7, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (735, 6, CAST(20231.01 AS Decimal(18, 2)), 5)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (735, 5, CAST(855.07 AS Decimal(18, 2)), 169)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (735, 4, CAST(6.00 AS Decimal(18, 2)), 3154)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (735, 3, CAST(2.00 AS Decimal(18, 2)), 29933)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (736, 7, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (736, 6, CAST(110216.64 AS Decimal(18, 2)), 1)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (736, 5, CAST(791.21 AS Decimal(18, 2)), 199)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (736, 4, CAST(6.00 AS Decimal(18, 2)), 3655)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (736, 3, CAST(2.00 AS Decimal(18, 2)), 33886)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (796, 7, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (796, 6, CAST(26194.42 AS Decimal(18, 2)), 10)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (796, 5, CAST(919.42 AS Decimal(18, 2)), 407)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (796, 4, CAST(6.00 AS Decimal(18, 2)), 8261)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (796, 3, CAST(2.00 AS Decimal(18, 2)), 81111)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (800, 7, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (800, 6, CAST(25765.62 AS Decimal(18, 2)), 11)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (800, 5, CAST(559.23 AS Decimal(18, 2)), 724)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (800, 4, CAST(6.00 AS Decimal(18, 2)), 11455)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (800, 3, CAST(2.00 AS Decimal(18, 2)), 96517)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (804, 7, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (804, 6, CAST(70228.24 AS Decimal(18, 2)), 1)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (804, 5, CAST(627.03 AS Decimal(18, 2)), 160)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (804, 4, CAST(6.00 AS Decimal(18, 2)), 2619)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (804, 3, CAST(2.00 AS Decimal(18, 2)), 24413)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (813, 7, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (813, 6, CAST(61155.47 AS Decimal(18, 2)), 1)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (813, 5, CAST(766.35 AS Decimal(18, 2)), 114)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (813, 4, CAST(6.00 AS Decimal(18, 2)), 2295)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (813, 3, CAST(2.00 AS Decimal(18, 2)), 21218)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (797, 7, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (797, 6, CAST(58258.76 AS Decimal(18, 2)), 4)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (797, 5, CAST(953.88 AS Decimal(18, 2)), 349)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (797, 4, CAST(6.00 AS Decimal(18, 2)), 6884)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (797, 3, CAST(2.00 AS Decimal(18, 2)), 70450)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (809, 7, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (809, 6, CAST(91377.13 AS Decimal(18, 2)), 1)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (809, 5, CAST(1176.02 AS Decimal(18, 2)), 111)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (809, 4, CAST(6.00 AS Decimal(18, 2)), 2643)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (809, 3, CAST(2.00 AS Decimal(18, 2)), 27562)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (812, 7, CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (812, 6, CAST(25047.94 AS Decimal(18, 2)), 3)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (812, 5, CAST(1095.39 AS Decimal(18, 2)), 98)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (812, 4, CAST(6.00 AS Decimal(18, 2)), 2242)
INSERT [dbo].[TimemaniaPremiacoes] ([idConcurso], [acertos], [valorPago], [ganhadores]) VALUES (812, 3, CAST(2.00 AS Decimal(18, 2)), 21677)
INSERT [dbo].[TimemaniaTimesCoracao] ([idConcurso], [timeCoracao], [valorPago], [ganhadores]) VALUES (735, N'TUNA LUSO/PA', CAST(5.00 AS Decimal(18, 2)), 6094)
INSERT [dbo].[TimemaniaTimesCoracao] ([idConcurso], [timeCoracao], [valorPago], [ganhadores]) VALUES (736, N'TREZE/PB', CAST(5.00 AS Decimal(18, 2)), 12419)
INSERT [dbo].[TimemaniaTimesCoracao] ([idConcurso], [timeCoracao], [valorPago], [ganhadores]) VALUES (796, N'VILA NOVA/GO', CAST(5.00 AS Decimal(18, 2)), 19851)
INSERT [dbo].[TimemaniaTimesCoracao] ([idConcurso], [timeCoracao], [valorPago], [ganhadores]) VALUES (797, N'BOTAFOGO/RJ', CAST(5.00 AS Decimal(18, 2)), 60386)
INSERT [dbo].[TimemaniaTimesCoracao] ([idConcurso], [timeCoracao], [valorPago], [ganhadores]) VALUES (800, N'MOTO CLUBE/MA', CAST(5.00 AS Decimal(18, 2)), 19748)
INSERT [dbo].[TimemaniaTimesCoracao] ([idConcurso], [timeCoracao], [valorPago], [ganhadores]) VALUES (804, N'ATLÉTICO/PR', CAST(5.00 AS Decimal(18, 2)), 9215)
INSERT [dbo].[TimemaniaTimesCoracao] ([idConcurso], [timeCoracao], [valorPago], [ganhadores]) VALUES (813, N'FLUMINENSE/RJ', CAST(5.00 AS Decimal(18, 2)), 14260)
INSERT [dbo].[TimemaniaTimesCoracao] ([idConcurso], [timeCoracao], [valorPago], [ganhadores]) VALUES (809, N'SÃO CAETANO/SP', CAST(5.00 AS Decimal(18, 2)), 6449)
INSERT [dbo].[TimemaniaTimesCoracao] ([idConcurso], [timeCoracao], [valorPago], [ganhadores]) VALUES (812, N'IPATINGA/MG', CAST(5.00 AS Decimal(18, 2)), 5938)
/****** Object:  Index [duplaSenaDezenas_concurso_sorteio_dezena]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[DuplaSenaDezenas] ADD  CONSTRAINT [duplaSenaDezenas_concurso_sorteio_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[sorteio] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [federalPremiacoes_concurso_premio]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[FederalPremiacoes] ADD  CONSTRAINT [federalPremiacoes_concurso_premio] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[premio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lotecaPremiacoes_concurso_acertos]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[LotecaPremiacoes] ADD  CONSTRAINT [lotecaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lotofacilDezenas_concurso_dezena]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[LotofacilDezenas] ADD  CONSTRAINT [lotofacilDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lotofacilPremiacoes_concurso_acertos]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[LotofacilPremiacoes] ADD  CONSTRAINT [lotofacilPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lotogolJogos_concurso_jogo]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[LotogolJogos] ADD  CONSTRAINT [lotogolJogos_concurso_jogo] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[jogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lotogolPremiacoes_concurso_acertos]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[LotogolPremiacoes] ADD  CONSTRAINT [lotogolPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lotomaniaDezenas_concurso_dezena]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[LotomaniaDezenas] ADD  CONSTRAINT [lotomaniaDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [lotomaniaPremiacoes_concurso_acertos]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[LotomaniaPremiacoes] ADD  CONSTRAINT [lotomaniaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [megaSenaDezenas_concurso_dezena]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[MegasenaDezenas] ADD  CONSTRAINT [megaSenaDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [megaSenaPremiacoes_concurso_acertos]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[MegasenaPremiacoes] ADD  CONSTRAINT [megaSenaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [quinaDezenas_concurso_dezena]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[QuinaDezenas] ADD  CONSTRAINT [quinaDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [quinaPremiacoes_concurso_acertos]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[QuinaPremiacoes] ADD  CONSTRAINT [quinaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [timemaniaDezenas_concurso_dezena]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[TimemaniaDezenas] ADD  CONSTRAINT [timemaniaDezenas_concurso_dezena] UNIQUE NONCLUSTERED 
(
	[IdConcurso] ASC,
	[dezena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [timemaniaPremiacoes_concurso_acertos]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[TimemaniaPremiacoes] ADD  CONSTRAINT [timemaniaPremiacoes_concurso_acertos] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC,
	[acertos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_TimemaniaConcursos_TimemaniaTimeCoracao]    Script Date: 07/01/2016 06:44:46 ******/
ALTER TABLE [dbo].[TimemaniaTimesCoracao] ADD  CONSTRAINT [FK_TimemaniaConcursos_TimemaniaTimeCoracao] UNIQUE NONCLUSTERED 
(
	[idConcurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DuplaSenaDezenas]  WITH CHECK ADD  CONSTRAINT [FK_DuplaSenaConcursos_DuplaSenaDezenas] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[DuplaSenaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DuplaSenaDezenas] CHECK CONSTRAINT [FK_DuplaSenaConcursos_DuplaSenaDezenas]
GO
ALTER TABLE [dbo].[DuplaSenaPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_DuplaSenaConcursos_DuplaSenaPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[DuplaSenaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DuplaSenaPremiacoes] CHECK CONSTRAINT [FK_DuplaSenaConcursos_DuplaSenaPremiacao]
GO
ALTER TABLE [dbo].[FederalPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_FederalConcursos_FederalPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[FederalConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FederalPremiacoes] CHECK CONSTRAINT [FK_FederalConcursos_FederalPremiacao]
GO
ALTER TABLE [dbo].[LotecaJogos]  WITH CHECK ADD  CONSTRAINT [FK_LotecaConcursos_LotecaJogos] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[LotecaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotecaJogos] CHECK CONSTRAINT [FK_LotecaConcursos_LotecaJogos]
GO
ALTER TABLE [dbo].[LotecaPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_LotecaConcursos_LotecaPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[LotecaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotecaPremiacoes] CHECK CONSTRAINT [FK_LotecaConcursos_LotecaPremiacao]
GO
ALTER TABLE [dbo].[LotofacilDezenas]  WITH CHECK ADD  CONSTRAINT [FK_LotofacilConcursos_LotofacilDezenas] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[LotofacilConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotofacilDezenas] CHECK CONSTRAINT [FK_LotofacilConcursos_LotofacilDezenas]
GO
ALTER TABLE [dbo].[LotofacilPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_LotofacilConcursos_LotofacilPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[LotofacilConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotofacilPremiacoes] CHECK CONSTRAINT [FK_LotofacilConcursos_LotofacilPremiacao]
GO
ALTER TABLE [dbo].[LotogolJogos]  WITH CHECK ADD  CONSTRAINT [FK_LotogolConcursos_LotogolJogos] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[LotogolConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotogolJogos] CHECK CONSTRAINT [FK_LotogolConcursos_LotogolJogos]
GO
ALTER TABLE [dbo].[LotogolPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_LotogolConcursos_LotogolPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[LotogolConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotogolPremiacoes] CHECK CONSTRAINT [FK_LotogolConcursos_LotogolPremiacao]
GO
ALTER TABLE [dbo].[LotomaniaDezenas]  WITH CHECK ADD  CONSTRAINT [FK_LotomaniaConcursos_LotomaniaDezenas] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[LotomaniaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotomaniaDezenas] CHECK CONSTRAINT [FK_LotomaniaConcursos_LotomaniaDezenas]
GO
ALTER TABLE [dbo].[LotomaniaPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_LotomaniaConcursos_LotomaniaPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[LotomaniaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LotomaniaPremiacoes] CHECK CONSTRAINT [FK_LotomaniaConcursos_LotomaniaPremiacao]
GO
ALTER TABLE [dbo].[MegasenaDezenas]  WITH CHECK ADD  CONSTRAINT [FK_MegasenaConcursos_MegasenaDezenas] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[MegasenaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MegasenaDezenas] CHECK CONSTRAINT [FK_MegasenaConcursos_MegasenaDezenas]
GO
ALTER TABLE [dbo].[MegasenaPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_MegasenaConcursos_MegasenaPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[MegasenaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MegasenaPremiacoes] CHECK CONSTRAINT [FK_MegasenaConcursos_MegasenaPremiacao]
GO
ALTER TABLE [dbo].[QuinaDezenas]  WITH CHECK ADD  CONSTRAINT [FK_QuinaConcursos_QuinaDezenas] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[QuinaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuinaDezenas] CHECK CONSTRAINT [FK_QuinaConcursos_QuinaDezenas]
GO
ALTER TABLE [dbo].[QuinaPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_QuinaConcursos_QuinaPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[QuinaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuinaPremiacoes] CHECK CONSTRAINT [FK_QuinaConcursos_QuinaPremiacao]
GO
ALTER TABLE [dbo].[TimemaniaDezenas]  WITH CHECK ADD  CONSTRAINT [FK_TimemaniaConcursos_TimemaniaDezenas] FOREIGN KEY([IdConcurso])
REFERENCES [dbo].[TimemaniaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TimemaniaDezenas] CHECK CONSTRAINT [FK_TimemaniaConcursos_TimemaniaDezenas]
GO
ALTER TABLE [dbo].[TimemaniaPremiacoes]  WITH CHECK ADD  CONSTRAINT [FK_TimemaniaConcursos_TimemaniaPremiacao] FOREIGN KEY([idConcurso])
REFERENCES [dbo].[TimemaniaConcursos] ([idConcurso])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TimemaniaPremiacoes] CHECK CONSTRAINT [FK_TimemaniaConcursos_TimemaniaPremiacao]
GO
USE [master]
GO
ALTER DATABASE [GuiaDoApostador] SET  READ_WRITE 
GO
