/***** Script de criação PROCEDURES sp_ExisteConcursoXXX *****/ 

USE GuiaDoApostador;

GO

CREATE PROCEDURE sp_ExisteConcursoMegaSena
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.MegasenaConcursos WHERE idConcurso = @IdConcurso 
END

GO

CREATE PROCEDURE sp_ExisteConcursoDuplaSena
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.DuplaSenaConcursos WHERE idConcurso = @IdConcurso 
END

GO

CREATE PROCEDURE sp_ExisteConcursoFederal
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.FederalConcursos WHERE idConcurso = @IdConcurso 
END

GO

CREATE PROCEDURE sp_ExisteConcursoLoteca
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.LotecaConcursos WHERE idConcurso = @IdConcurso 
END

GO

CREATE PROCEDURE sp_ExisteConcursoLotofacil
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.LotofacilConcursos WHERE idConcurso = @IdConcurso 
END

GO

CREATE PROCEDURE sp_ExisteConcursoLotogol
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.LotogolConcursos WHERE idConcurso = @IdConcurso 
END

GO

CREATE PROCEDURE sp_ExisteConcursoLotomania
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.LotomaniaConcursos WHERE idConcurso = @IdConcurso 
END

GO

CREATE PROCEDURE sp_ExisteConcursoQuina
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.QuinaConcursos WHERE idConcurso = @IdConcurso 
END

GO

CREATE PROCEDURE sp_ExisteConcursoTimemania
@IdConcurso int
AS
BEGIN
SELECT 1 FROM GuiaDoApostador.dbo.TimemaniaConcursos WHERE idConcurso = @IdConcurso 
END