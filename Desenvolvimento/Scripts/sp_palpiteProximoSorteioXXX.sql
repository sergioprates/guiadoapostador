use guiaaposta1;

go

create procedure sp_palpiteProximoSorteioMegaSena
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

go

create procedure sp_palpiteProximoSorteioLotofacil
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

go

create procedure sp_palpiteProximoSorteioLotomania
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

go

create procedure sp_palpiteProximoSorteioTimemania
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

go

create procedure sp_palpiteProximoSorteioQuina
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

go

create procedure sp_palpiteProximoSorteioDuplaSena
@idConcurso int
as
begin
	IF (@idConcurso is null)
	begin
		select idConcurso, dezena from DuplaSenaPalpites
		where idConcurso = (select max(idConcurso) from DuplaSenaPalpites)
		order by dezena
	end
	ELSE
	begin
		select idConcurso, dezena from DuplaSenaPalpites
		where idConcurso = @idConcurso
		order by dezena
	end
end
