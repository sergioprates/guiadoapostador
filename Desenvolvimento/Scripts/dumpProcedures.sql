USE [GuiaDoApostador]
GO
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoDuplaSena]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoFederal]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoLoteca]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoLotofacil]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoLotogol]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoLotomania]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoMegaSena]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoQuina]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaConcursoTimemania]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasDuplaSena]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasLoteca]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasLotofacil]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasLotogol]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasLotomania]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasMegaSena]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasQuina]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaDezenasTimemania]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosDuplaSena]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosFederal]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosLoteca]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosLotofacil]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosLotogol]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosLotomania]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosMegaSena]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosQuina]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_buscaPremiosTimemania]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoDuplaSena]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoFederal]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoLoteca]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoLotofacil]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoLotogol]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoLotomania]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoMegaSena]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoQuina]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoTimemania]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaDuplaSena]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaLotofacil]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaLotomania]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaMegaSena]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaQuina]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaTimemania]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraJogoLoteca]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraJogoLotogol]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioDuplaSena]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioFederal]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioLoteca]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioLotofacil]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioLotogol]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioLotomania]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioMegaSena]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioQuina]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioTimemania]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraTimeCoracaoTimemania]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoDuplaSena]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoFederal]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoLoteca]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoLotofacil]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoLotogol]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoLotomania]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoMegaSena]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoQuina]    Script Date: 14/06/2015 01:33:06 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_existeConcursoTimemania]    Script Date: 14/06/2015 01:33:06 ******/
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
