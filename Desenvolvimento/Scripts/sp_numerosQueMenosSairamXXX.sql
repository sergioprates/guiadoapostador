use guiaaposta1

go

create procedure sp_numerosQueMenosSairamMegaSena
as
begin

	select top 15 count(*) as 'quantidade', dezena 
	from MegasenaDezenas
	group by dezena
	order by 1

end

go

create procedure sp_numerosQueMenosSairamLotoFacil
as
begin

	select top 18 count(*) as 'quantidade', dezena 
	from LotofacilDezenas
	group by dezena
	order by 1

end

go

create procedure sp_numerosQueMenosSairamTimeMania
as
begin

	select top 10 count(*) as 'quantidade', dezena 
	from TimeManiaDezenas
	group by dezena
	order by 1

end

go

create procedure sp_numerosQueMenosSairamQuina
as
begin

	select top 7 count(*) as 'quantidade', dezena 
	from QuinaDezenas
	group by dezena
	order by 1

end

go

create procedure sp_numerosQueMenosSairamLotomania
as
begin

	select top 50 count(*) as 'quantidade', dezena 
	from LotomaniaDezenas
	group by dezena
	order by 1

end

go


create procedure sp_numerosQueMenosSairamDuplaSena
as
begin

	select top 15 count(*) as 'quantidade', dezena 
	from DuplaSenaDezenas
	group by dezena
	order by 1

end
