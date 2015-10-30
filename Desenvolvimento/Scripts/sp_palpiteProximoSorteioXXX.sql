use guiaaposta1

go 

create procedure sp_palpiteProximoSorteioMegaSena
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from MegasenaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from MegasenaDezenas)
	group by dezena

end

go

create procedure sp_palpiteProximoSorteioLotoFacil
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from LotoFacilDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from LotoFacilDezenas)
	group by dezena

end

go

create procedure sp_palpiteProximoSorteioTimeMania
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from TimeManiaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from TimeManiaDezenas)
	group by dezena

end

go

create procedure sp_palpiteProximoSorteioQuina
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from QuinaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from QuinaDezenas)
	group by dezena

end

go

create procedure sp_palpiteProximoSorteioLotomania
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from LotomaniaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from LotomaniaDezenas)
	group by dezena

end

go


create procedure sp_palpiteProximoSorteioDuplaSena
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from DuplaSenaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from DuplaSenaDezenas)
	group by dezena

end

