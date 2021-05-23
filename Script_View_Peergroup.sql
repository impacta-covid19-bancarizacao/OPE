/****** Script do comando SelectTopNRows de SSMS  ******/
CREATE VIEW [peergroup_municipio]
as
  --POPULAÇÃO RURAL
select	[skMunicipio]
      ,[codMunicipio]
      ,[nomeMunicipio]
      ,[uf]
      ,[populacao]
      ,[pib]
      ,[urbano]
      ,[agencia]
	  	,case
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
		FROM [dbo].[municipio]
where urbano = 0
UNION
--POPULAÇÃO URBANA
select	[skMunicipio]
      ,[codMunicipio]
      ,[nomeMunicipio]
      ,[uf]
      ,[populacao]
      ,[pib]
      ,[urbano]
      ,[agencia]
		,case
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
		FROM [dbo].[municipio]
where urbano = 1


