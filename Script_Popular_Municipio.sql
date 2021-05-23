INSERT INTO municipio
SELECT
cast (pib.cod as int) as codMunicipio, 
CAST (pib.REGIAO AS VARCHAR (160)) as nomeMunicipio,
cast(SUBSTRING(pib.REGIAO, CHARINDEX('(',PIB.REGIAO,1)+1,2) as char(2)) as UF,
CAST(populacao.POPULACAO AS INT) as populacao,
cast(pib.pib as decimal(18,2)) as pib,
cast(situacao_domicilio.Urbano as bit) as urbano,
CAST(case 
when pib.REGIAO in (select CIDADE + ' (' + UF + ')' from Agencias) then 1
			else 0
			end AS BIT) as agencia
--INTO municipio
fROM
PIB
inner join
populacao
on pib.cod = populacao.cod
INNER JOIN 
situacao_domicilio
on pib.cod = situacao_domicilio.id_municipio
WHERE pib.NIVEL = 'MU'