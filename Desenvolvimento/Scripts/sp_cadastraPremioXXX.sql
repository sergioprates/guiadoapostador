/***** Script de criação PROCEDURES sp_cadastraPremioXXX *****/ 

USE GuiaDoApostador;

GO

CREATE PROCEDURE sp_cadastraPremioMegaSena
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

CREATE PROCEDURE sp_cadastraPremioDuplaSena
@IdConcurso int,
@Sorteio tinyint,
@Acertos tinyint,
@ValorPago decimal(18,2),
@Ganhadores int
AS
BEGIN
insert into GuiaDoApostador.dbo.DuplaSenaPremiacoes
VALUES
(
@IdConcurso,
@Sorteio,
@Acertos,
@ValorPago,
@Ganhadores
)
END

GO

CREATE PROCEDURE sp_cadastraPremioFederal
@IdConcurso int,
@Premio tinyint,
@Bilhete int,
@ValorPago decimal(18,2)
AS
BEGIN
insert into GuiaDoApostador.dbo.FederalPremiacoes
VALUES
(
@IdConcurso,
@Premio,
@Bilhete,
@ValorPago
)
END

GO

CREATE PROCEDURE sp_cadastraPremioQuina
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

CREATE PROCEDURE sp_cadastraPremioLotofacil
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

CREATE PROCEDURE sp_cadastraPremioLotomania
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

CREATE PROCEDURE sp_cadastraPremioLotogol
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

CREATE PROCEDURE sp_cadastraPremioLoteca
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

CREATE PROCEDURE sp_cadastraPremioTimemania
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
