use guiaaposta1

go 

create procedure sp_geraPalpiteProximoSorteioMegaSena
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from MegasenaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from MegasenaDezenas)
	group by dezena

end

go

create procedure sp_geraPalpiteProximoSorteioLotoFacil
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from LotoFacilDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from LotoFacilDezenas)
	group by dezena

end

go

create procedure sp_geraPalpiteProximoSorteioTimeMania
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from TimeManiaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from TimeManiaDezenas)
	group by dezena

end

go

create procedure sp_geraPalpiteProximoSorteioQuina
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from QuinaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from QuinaDezenas)
	group by dezena

end

go

create procedure sp_geraPalpiteProximoSorteioLotomania
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from LotomaniaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from LotomaniaDezenas)
	group by dezena

end

go


create procedure sp_geraPalpiteProximoSorteioDuplaSena
@sorteiosAnteriores tinyint
as
begin

	select count(*) as 'quantidade', dezena 
	from DuplaSenaDezenas
	where IdConcurso > (select max(idConcurso) - @sorteiosAnteriores from DuplaSenaDezenas)
	group by dezena

end

