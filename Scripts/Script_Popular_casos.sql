INSERT INTO casos
select
municipio.skMunicipio,
cast(date as date) as dataCaso,
cast(new_confirmed as int) as casosConfirmados
from caso_full
inner join
municipio
on city_ibge_code = municipio.codMunicipio
where city is not null and city_ibge_code is not null
and city_ibge_code > 1000000
order by date