--Estatística Geral
SELECT	
		count(nomeMunicipio) as QTDE
		,urbano
		,agencia,
		min(pib) as minPIB,
		sum(PIB) AS sumPIB,
		CAST(avg(PIB) AS MONEY) as avgPIB,
		max(pib) as maxPIB,
		min(Populacao) as minPOP,
		sum(Populacao) AS sumPOP,
		avg(Populacao) as avgPOP,
		max(Populacao) as maxPOP,
		cast(min(pib/Populacao) as money) as minPIBpCap,
		CAST(avg(pib/Populacao) AS MONEY) as avgPIBpCap,
		CAST(max(pib/Populacao) as money) as maxPIBpCap
		
       FROM [covid19].[dbo].[municipio]
group by urbano, agencia

--Montando o histograma por intervalo
--POPULAÇÃO RURAL
select	count(nomeMunicipio) as QTDE,
		agencia,
		case
		when Populacao between 0 and 7000 then 1
		when Populacao between 7001 and 15000 then 2
		when Populacao between 15001 and 80000 then 3
		ELSE 4
		end as CLASSE_POP,
		case
		when pib/Populacao between 0 and 15 then 'Pobre'
		when pib/Populacao between 15.0001 and 40 then 'Média'
		when pib/Populacao between 40.0001 and 175 then 'Alta'
		ELSE 'Outlier'
		END AS CLASSE_RENDA
		FROM [covid19].[dbo].[municipio]
where urbano = 0
group by agencia,
		case
		when Populacao between 0 and 7000 then 1
		when Populacao between 7001 and 15000 then 2
		when Populacao between 15001 and 80000 then 3
		ELSE 4
		end,
		case
		when pib/Populacao between 0 and 15 then 'Pobre'
		when pib/Populacao between 15.0001 and 40 then 'Média'
		when pib/Populacao between 40.0001 and 175 then 'Alta'
		ELSE 'Outlier'
		END
ORDER BY CLASSE_POP, CLASSE_RENDA

--POPULAÇÃO URBANA
select	count(nomeMunicipio) as QTDE,
		agencia,
		case
		when Populacao between 0 and 10000 then 1
		when Populacao between 10001 and 30000 then 2
		when Populacao between 30001 and 300000 then 3
		ELSE 4
		end as CLASSE_POP,
		case
		when pib/Populacao between 0 and 15 then 'Pobre'
		when pib/Populacao between 15.0001 and 40 then 'Média'
		when pib/Populacao between 40.0001 and 80 then 'Média Alta'
		when pib/Populacao between 80.0001 and 300 then 'Alta'
		ELSE 'Rica'
		END AS CLASSE_RENDA
		FROM [covid19].[dbo].[municipio]
where urbano = 1
group by agencia,
		case
		when Populacao between 0 and 10000 then 1
		when Populacao between 10001 and 30000 then 2
		when Populacao between 30001 and 300000 then 3
		ELSE 4
		end,
		case
		when pib/Populacao between 0 and 15 then 'Pobre'
		when pib/Populacao between 15.0001 and 40 then 'Média'
		when pib/Populacao between 40.0001 and 80 then 'Média Alta'
		when pib/Populacao between 80.0001 and 300 then 'Alta'
		ELSE 'Rica'
		END
ORDER BY CLASSE_POP, CLASSE_RENDA