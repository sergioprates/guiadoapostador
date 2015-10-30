use guiaaposta1;

go

create table MegasenaPalpites
(
	idConcurso int primary key not null,
	dezena tinyint not null
)

go

create table LotofacilPalpites
(
	idConcurso int primary key not null,
	dezena tinyint not null
)

go

create table TimemaniaPalpites
(
	idConcurso int primary key not null,
	dezena tinyint not null
)

go

create table LotomaniaPalpites
(
	idConcurso int primary key not null,
	dezena tinyint not null
)


go

create table QuinaPalpites
(
	idConcurso int primary key not null,
	dezena tinyint not null
)


go

create table DuplasenaPalpites
(
	idConcurso int primary key not null,
	sorteio tinyint not null,
	dezena tinyint not null
)
