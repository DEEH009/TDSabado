use master
go

if exists(select * from sys.databases where name = 'TDSabado')
	drop database TDSabado
go

create database TDSabado
go

use TDSabado
go

create table Usuario(
	ID int identity primary key,
	Name varchar(100) not null,
	BirthDate date not null,
	UserId varchar(60) not null,
	Userpass varchar(MAX) not null
);
go

create table Token(
	ID int identity primary key,
	UserID int references Usuario(ID),
	Value varchar(MAX) not null
);
go

create table Post(
	ID int identity primary key,
	UserID int references Usuario(ID),
	Moment datetime not null,
	Content varchar(MAX) not null
);
go

create table PostImage(
	ID int identity primary key,
	PostId int references Post(ID),
	Bytes image not null
);
go

create table Likes(
	ID int identity primary key,
	PostId int references Post(ID),
	UserID int references Usuario(ID),
);
go

create table Follow(
	ID int identity primary key,
	FollowedID int references Usuario(ID),
	FollowerID int references Usuario(ID),
);
go

create table UsuarioE(
ID int identity primary key,
	Name varchar(100) not null,
	DatadeAbertura date not null,
	UserId varchar(60) not null,
	Userpass varchar(MAX) not null,
	email varchar (60) not null,
	senha varchar (60) not null,
	cnpj varchar (60) not null,
	cep varchar (60) not null,
	rua varchar (60) not null,
	numero varchar (60) not null ,
	telefone varchar (60) not null
	
);
go 