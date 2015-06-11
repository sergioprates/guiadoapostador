/***** Script de criação PROCEDURES sp_cadastraConcursoXXX *****/ 

USE GuiaDoApostador;

GO

CREATE PROCEDURE sp_cadastraConcursoMegaSena
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

CREATE PROCEDURE sp_cadastraConcursoDuplaSena
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

END

GO

CREATE PROCEDURE sp_cadastraConcursoFederal
@IdConcurso int,
@Data date,
@Cidade varchar(50),
@Local varchar(50),
@Observacao varchar(150)
AS
BEGIN
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

END

GO

CREATE PROCEDURE sp_cadastraConcursoQuina
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

END

GO

CREATE PROCEDURE sp_cadastraConcursoLotofacil
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

CREATE PROCEDURE sp_cadastraConcursoLotomania
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

CREATE PROCEDURE sp_cadastraConcursoTimemania
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

CREATE PROCEDURE sp_cadastraConcursoLotogol
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

CREATE PROCEDURE sp_cadastraConcursoLoteca
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

