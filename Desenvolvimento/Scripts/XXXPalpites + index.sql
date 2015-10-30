use GuiaDoApostador;

go

create table MegasenaPalpites
(
	idConcurso int not null,
	dezena tinyint not null
)

go

create table LotofacilPalpites
(
	idConcurso int not null,
	dezena tinyint not null
)

go

create table TimemaniaPalpites
(
	idConcurso int not null,
	dezena tinyint not null
)

go

create table LotomaniaPalpites
(
	idConcurso int not null,
	dezena tinyint not null
)


go

create table QuinaPalpites
(
	idConcurso int not null,
	dezena tinyint not null
)


go

create table DuplasenaPalpites
(
	idConcurso int not null,
	sorteio tinyint not null,
	dezena tinyint not null
)
