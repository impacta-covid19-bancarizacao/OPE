CREATE TABLE municipio(
	skMunicipio smallint identity (1,1) not null primary key,
	codMunicipio int not null unique,
	nomeMunicipio VARCHAR (160) not null,
	uf char(2) not null,
	populacao int not null,
	pib decimal not null,
	urbano bit not null,
	agencia bit not null
)

CREATE TABLE mortes(
	codMortes int not null identity(1,1) primary key,
	skMunicipio smallint not null foreign key references municipio(skMunicipio),
	dataMorte date not null foreign key references data(data),
	mortesConfirmadas int
)

CREATE TABLE casos(
	codCasos int not null identity(1,1) primary key,
	skMunicipio smallint not null foreign key references municipio(skMunicipio),
	dataCaso date not null foreign key references data(data),
	casosConfirmados int
)