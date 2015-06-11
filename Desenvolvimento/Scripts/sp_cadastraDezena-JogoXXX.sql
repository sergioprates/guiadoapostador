/***** Script de criação PROCEDURES sp_cadastraDezena/JogoXXX + TimeCoracaoTimemania *****/ 

USE GuiaDoApostador;

GO

CREATE PROCEDURE sp_cadastraDezenaMegaSena
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

CREATE PROCEDURE sp_cadastraDezenaDuplaSena
@IdConcurso int,
@Sorteio tinyint,
@Dezena tinyint
AS
BEGIN
insert into GuiaDoApostador.dbo.DuplaSenaDezenas
VALUES
(
@IdConcurso,
@Sorteio,
@Dezena
)
END

GO

CREATE PROCEDURE sp_cadastraDezenaQuina
@IdConcurso int,
@Dezena tinyint
AS
BEGIN
insert into GuiaDoApostador.dbo.QuinaDezenas
VALUES
(
@IdConcurso,
@Dezena
)
END

GO

CREATE PROCEDURE sp_cadastraDezenaLotofacil
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

CREATE PROCEDURE sp_cadastraDezenaLotomania
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

CREATE PROCEDURE sp_cadastraDezenaTimemania
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

CREATE PROCEDURE sp_cadastraJogoLotogol
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

CREATE PROCEDURE sp_cadastraJogoLoteca
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

CREATE PROCEDURE sp_cadastraTimeCoracaoTimemania
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
