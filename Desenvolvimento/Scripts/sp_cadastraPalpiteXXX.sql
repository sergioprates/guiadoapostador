use guiaaposta1;

go

create procedure sp_cadastraPalpiteMegaSena
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

go

create procedure sp_cadastraPalpiteLotofacil
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

go

create procedure sp_cadastraPalpiteLotomania
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

go

create procedure sp_cadastraPalpiteTimemania
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

go

create procedure sp_cadastraPalpiteQuina
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

go

create procedure sp_cadastraPalpiteDuplaSena
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

go

