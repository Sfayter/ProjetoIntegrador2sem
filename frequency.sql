create database frequency;

use frequency;

create table leitura(
    id int not null auto_increment primary key,
    data_leitura date,
    hora varchar(20),
    frequencia varchar(20)
);

delimiter $$
create procedure adiciona_leitura (horario varchar(20), freq varchar(20))
BEGIN
    insert into leitura (data_leitura, hora, frequencia) values (current_date(), horario, freq);
end;
$$

delimiter $$
create procedure buscarDados ()
BEGIN
    select * from leitura order by data_leitura desc, hora desc;
end;
$$