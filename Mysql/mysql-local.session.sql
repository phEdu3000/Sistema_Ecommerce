create database Ecommerce;
use Ecommerce;

create table cliente(
id int auto_increment primary key,
nome varchar(50),
email varchar(50),
telefone int);

create table produtos(
id int auto_increment primary key,
nome varchar(50),
preco double,
quantidade int);

create table pedidos(
id int auto_increment primary key,
id_produtos int,
id_cliente int,
valor_total int,
foreign key (id_produtos) references produtos(id),
foreign key (id_cliente) references cliente(id)
);

INSERT INTO produtos (nome, preco, quantidade) VALUES ('Teste Camisa', 99.9, 10);
SELECT * FROM produtos;