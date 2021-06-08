--use covid19

CREATE TABLE Data(
	data date primary key,
	dia tinyint not null,
	mes tinyint not null,
	ano int not null
)


DECLARE @dataInicial DATE
DECLARE @contador INT
DECLARE @dataFinal DATE
DECLARE @diferencaDias INT

set @contador = 0
set @dataInicial = '20200225'
set @dataFinal = '20220101'
set @diferencaDias = DATEDIFF(day, @dataInicial, @dataFinal)

while @contador <= @diferencaDias
	BEGIN
		DECLARE @dia TINYINT
		DECLARE @mes TINYINT
		DECLARE @ano INT

		set @mes = DATEPART(month, @dataInicial)
		set @dia = DATEPART(day, @dataInicial)
		set @ano = DATEPART(year, @dataInicial)

		SET @contador += 1
		INSERT INTO dbo.Data(data, dia, mes, ano) VALUES (@dataInicial, @dia, @mes, @ano)
		SET @dataInicial = DATEADD(day, 1, @dataInicial)
	END

SELECT * FROM Data