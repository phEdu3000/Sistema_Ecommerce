create database Estacionamento;
use Estacionamento;

create table cliente(
cpf int primary key,
nome varchar(60),
dataNasc date
);

create table modelo(
codMod int primary key,
desc_2 varchar(40)
);

create table veiculo(
placa varchar(8) primary key,
cor varchar(20),
modelo_codMod int,
client_cpf int,
foreign key (modelo_codMod) references modelo(codMod),
foreign key (client_cpf) references cliente(cpf)

);

create table patio(
num int primary key,
ender varchar(40),
capacidade int
);

create table estaciona(
cod int primary key,
patio_num int,
veiculo_placa varchar(8),
dtEntrada varchar(10),
dtSaida varchar(10),
hsEntrada varchar(10),
hsSaida varchar(10),
foreign key (patio_num) references patio (num),
foreign key (veiculo_placa) references veiculo(placa)
);

insert into cliente values 
(111111111, 'Ana Silva', '1990-04-12');
insert into cliente values 
(222222222, 'Bruno Costa', '1985-09-30');
insert into cliente values 
(333333333, 'Carlos Souza', '1978-11-21');
insert into cliente values 
(444444444, 'Daniela Lima', '1995-02-10');
insert into cliente values 
(555555555, 'Eduardo Ramos', '1989-07-08');
insert into cliente values 
(666666666, 'Fernanda Alves', '1983-01-19');
insert into cliente values 
(777777777, 'Gabriel Rocha', '1992-12-02');
insert into cliente values 
(888888888, 'Helena Duarte', '1998-06-14');
insert into cliente values 
(999999999, 'Igor Mendes', '1975-03-27');
insert into cliente values 
(101010101, 'Julia Castro', '1987-10-05');



INSERT INTO Modelo VALUES
(1, 'SUV');
INSERT INTO Modelo VALUES
(2, 'Hatch');
INSERT INTO Modelo VALUES
(3, 'Sedan');
INSERT INTO Modelo VALUES
(4, 'Pick-up');
INSERT INTO Modelo VALUES
(5, 'Esportivo');



insert into veiculo values 
('ABC1234','Prata',1 , 111111111);
insert into veiculo values 
('DEF5678','Preto', 3,222222222);
insert into veiculo values 
('GHI9012', 'Branco', 2,333333333);
insert into veiculo values 
('JKL3456', 'Vermelho', 4,444444444);
insert into veiculo values 
('MNO7890', 'Azul', 5,555555555);
insert into veiculo values 
('PQR1122', 'Cinza', 5,666666666);
insert into veiculo values 
('STU3344', 'Preto', 1,777777777);



insert into patio values 
(1, 'Av. Brasil, 1000', 50);
insert into patio values 
(2, 'Rua Central, 500', 30);
insert into patio values 
(3, 'Av. Europa, 300', 40);


insert into estaciona values
(1, 1, 'ABC1234', '2024-03-01', '2024-03-01', '08:00', '12:00');
insert into estaciona values
(2, 1, 'DEF5678', '2024-03-01', '2024-03-01', '09:00', '13:00');
insert into estaciona values
(3, 2, 'GHI9012', '2024-03-02', '2024-03-02', '10:00', '15:00');
insert into estaciona values
(4, 2, 'JKL3456', '2024-03-03', '2024-03-03', '11:00', '16:00');
insert into estaciona values
(5, 3, 'MNO7890', '2024-03-04', '2024-03-04', '07:00', '09:00');
insert into estaciona values
(6, 3, 'PQR1122', '2024-03-05', '2024-03-05', '06:00', '10:00');
insert into estaciona values
(7, 1, 'STU3344', '2024-03-05', '2024-03-05', '12:30', '14:30');

SELECT c.nome, v.placa, v.cor
FROM Cliente c
INNER JOIN Veiculo v ON c.cpf = v.client_cpf;
/*Resposta da a)*/

SELECT c.nome, v.placa, v.cor
FROM Cliente c
left join Veiculo v ON c.cpf = v.client_cpf;
/*Resposta da b)*/

SELECT c.nome, v.placa, v.cor
FROM Cliente c
right join Veiculo v ON c.cpf = v.client_cpf;
/*ok*/
SELECT v.placa, m.Desc_2 AS modelo
FROM Veiculo v
INNER JOIN Modelo m ON v.Modelo_codMod = m.codMod;
/*ok*/
SELECT e.cod, v.placa, c.nome, e.dtEntrada, e.hsEntrada
FROM Estaciona e
INNER JOIN Veiculo v ON e.Veiculo_placa = v.placa
INNER JOIN Cliente c ON v.client_cpf = c.cpf;
/*ok*/
SELECT p.num, e.Veiculo_placa
FROM Patio p
LEFT JOIN Estaciona e ON p.num = e.Patio_num;
/*ok*/
SELECT p.num AS patio, COUNT(e.cod) AS qntVeiculos
FROM Patio p
LEFT JOIN Estaciona e ON p.num = e.Patio_num
GROUP BY p.num;
/*ok*/
