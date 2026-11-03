create database atividade;
use atividade;

create table estrela(
cod_estrela int primary key,
nome_estrela varchar(100),
magnitude decimal(6,2),
data_descoberta date,
cod_const int,
foreign key(cod_const) references constelacao(cod_const)
);

create table constelacao(
cod_const int primary key,
nome_const varchar(100),
hemisferio varchar(80)
);

insert into constelacao
values
(1,"Órion","Hemisfério Norte"),
(2,"Cruzeiro do Sul","Hemisfério Sul"),
(3,"Escorpião","Hemisfério Sul"),
(4,"Lupus","Hemisfério Sul"),
(5,"Ursa Maior","Hemisfério Norte");

insert into estrela
values
(1,'Betelgeuse', 0.42, '1890-03-20', 1),
(2,'Rigel', 0.18, '1902-11-05', 1),
(3,'Acrux', 0.77, '1925-01-10', 2),
(4,'Antares', 1.09, '1915-07-22', 3),
(5,'V462 Lupi (Nova Lupi 2025)', NULL, '2025-06-12', 4);

select e.nome_estrela, e.magnitude, e.data_descoberta, c.nome_const  
from estrela e 
inner join constelacao c on e.cod_const = c.cod_const;

select e.nome_estrela, e.magnitude, e.data_descoberta, c.nome_const  
from estrela e 
inner join constelacao c on e.cod_const = c.cod_const
where c.nome_const like 'Órion';

update estrela e
inner join constelacao c on e.cod_const = c.cod_const
set magnitude = magnitude - (magnitude * 0.10)
where c.hemisferio like 'Hemisfério Sul'; 

select e.nome_estrela, e.magnitude, e.data_descoberta, c.nome_const  
from estrela e 
inner join constelacao c on e.cod_const = c.cod_const
where year(e.data_descoberta) between 1850 and 1905;

select e.nome_estrela, e.magnitude, e.data_descoberta, c.nome_const  
from estrela e 
inner join constelacao c on e.cod_const = c.cod_const
where month(e.data_descoberta) = 11;

select e.nome_estrela, e.magnitude, e.data_descoberta, c.nome_const  
from estrela e 
inner join constelacao c on e.cod_const = c.cod_const
where year(e.data_descoberta) = year(current_date());

select c.nome_const, c.hemisferio, e.nome_estrela 
from constelacao c
left join estrela e on e.cod_const = c.cod_const




