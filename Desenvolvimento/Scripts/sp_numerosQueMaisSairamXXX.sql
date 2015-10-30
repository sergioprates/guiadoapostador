use guiaaposta1

go

create procedure sp_numerosQueMaisSairamMegaSena
as
begin

	select top 15 count(*), dezena 
	from MegasenaDezenas
	group by dezena
	order by 1 desc

end

go

create procedure sp_numerosQueMaisSairamLotoFacil
as
begin

	select top 18 count(*), dezena 
	from LotofacilDezenas
	group by dezena
	order by 1 desc

end

go

create procedure sp_numerosQueMaisSairamTimeMania
as
begin

	select top 10 count(*), dezena 
	from TimeManiaDezenas
	group by dezena
	order by 1 desc

end

go

create procedure sp_numerosQueMaisSairamQuina
as
begin

	select top 7 count(*), dezena 
	from QuinaDezenas
	group by dezena
	order by 1 desc

end

go

create procedure sp_numerosQueMaisSairamLotomania
as
begin

	select top 50 count(*), dezena 
	from LotomaniaDezenas
	group by dezena
	order by 1 desc

end

go

create procedure sp_numerosQueMaisSairamDuplaSena
as
begin

	select top 15 count(*), dezena 
	from DuplaSenaDezenas
	group by dezena
	order by 1 desc

end