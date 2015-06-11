USE [GuiaDoApostador]
GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoDuplaSena]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.DuplaSenaConcursos
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoFederal]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.FederalConcursos
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoLoteca]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.LotecaConcursos
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoLotofacil]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.LotofacilConcursos
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoLotogol]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.LotogolConcursos
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoLotomania]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.LotomaniaConcursos
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoMegaSena]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.MegasenaConcursos
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoQuina]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.QuinaConcursos
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraConcursoTimemania]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.TimemaniaConcursos
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaDuplaSena]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraDezenaDuplaSena]
@IdConcurso int,
@Sorteio tinyint,
@Dezena tinyint
AS
insert into GuiaDoApostador.dbo.DuplaSenaDezenas
VALUES
(
@IdConcurso,
@Sorteio,
@Dezena
)
GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaLotofacil]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_cadastraDezenaLotofacil]
@IdConcurso int,
@Dezena tinyint
AS
BEGIN
insert into GuiaDoApostador.dbo.LotofacilDezenas
VALUES
(
@IdConcurso,
@Dezena
)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaLotomania]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraDezenaLotomania]
@IdConcurso int,
@Dezena tinyint
AS
BEGIN
insert into GuiaDoApostador.dbo.LotomaniaDezenas
VALUES
(
@IdConcurso,
@Dezena
)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaMegaSena]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraDezenaMegaSena]
@IdConcurso int,
@Dezena tinyint
AS
BEGIN
insert into GuiaDoApostador.dbo.MegasenaDezenas
VALUES
(
@IdConcurso,
@Dezena
)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaQuina]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cadastraDezenaQuina]
@IdConcurso int,
@Dezena tinyint
AS
insert into GuiaDoApostador.dbo.QuinaDezenas
VALUES
(
@IdConcurso,
@Dezena
)
GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraDezenaTimemania]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_cadastraDezenaTimemania]
@IdConcurso int,
@Dezena tinyint
AS
BEGIN
insert into GuiaDoApostador.dbo.TimemaniaDezenas
VALUES
(
@IdConcurso,
@Dezena
)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraJogoLoteca]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.LotecaJogos
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraJogoLotogol]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.LotogolJogos
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
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioDuplaSena]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.DuplaSenaPremiacoes
VALUES
(
@IdConcurso,
@Sorteio,
@Acertos,
@ValorPago,
@Ganhadores
)
GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioFederal]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.FederalPremiacoes
VALUES
(
@IdConcurso,
@Premio,
@Bilhete,
@ValorPago
)
GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioLoteca]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.LotecaPremiacoes
VALUES
(
@IdConcurso,
@Acertos,
@ValorPago,
@Ganhadores
)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioLotofacil]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.LotofacilPremiacoes
VALUES
(
@IdConcurso,
@Acertos,
@ValorPago,
@Ganhadores
)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioLotogol]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.LotogolPremiacoes
VALUES
(
@IdConcurso,
@Acertos,
@ValorPago,
@Ganhadores
)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioLotomania]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.LotomaniaPremiacoes
VALUES
(
@IdConcurso,
@Acertos,
@ValorPago,
@Ganhadores
)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioMegaSena]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.MegasenaPremiacoes
VALUES
(
@IdConcurso,
@Acertos,
@ValorPago,
@Ganhadores
)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioQuina]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.QuinaPremiacoes
VALUES
(
@IdConcurso,
@Acertos,
@ValorPago,
@Ganhadores
)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraPremioTimemania]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.TimemaniaPremiacoes
VALUES
(
@IdConcurso,
@Acertos,
@ValorPago,
@Ganhadores
)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_cadastraTimeCoracaoTimemania]    Script Date: 11/06/2015 02:22:02 ******/
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
insert into GuiaDoApostador.dbo.TimemaniaTimeCoracao
VALUES
(
@IdConcurso,
@TimeCoracao,
@ValorPago,
@Ganhadores
)

END


GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteConcursoDuplaSena]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ExisteConcursoDuplaSena]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.DuplaSenaConcursos WHERE idConcurso = @IdConcurso 
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteConcursoFederal]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ExisteConcursoFederal]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.FederalConcursos WHERE idConcurso = @IdConcurso 
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteConcursoLoteca]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ExisteConcursoLoteca]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.LotecaConcursos WHERE idConcurso = @IdConcurso 
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteConcursoLotofacil]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ExisteConcursoLotofacil]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.LotofacilConcursos WHERE idConcurso = @IdConcurso 
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteConcursoLotogol]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ExisteConcursoLotogol]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.LotogolConcursos WHERE idConcurso = @IdConcurso 
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteConcursoLotomania]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ExisteConcursoLotomania]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.LotomaniaConcursos WHERE idConcurso = @IdConcurso 
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteConcursoMegaSena]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ExisteConcursoMegaSena]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.MegasenaConcursos WHERE idConcurso = @IdConcurso 
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteConcursoQuina]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ExisteConcursoQuina]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.QuinaConcursos WHERE idConcurso = @IdConcurso 
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ExisteConcursoTimemania]    Script Date: 11/06/2015 02:22:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ExisteConcursoTimemania]
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.TimemaniaConcursos WHERE idConcurso = @IdConcurso 
END
GO
