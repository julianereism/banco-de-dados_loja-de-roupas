-- DML e DDL--

-- ------------------------ Delete e Update ----------------------------- --

delete from categoria
	where idCategoria = 6;
    
delete from cliente
	where email = "carlos.santos@email.com";
    
delete from cliente 
	where nomeSocial = null;
    
delete from compra
	where Fornecedor_idFornecedor = 2;
    
delete from fornecedor
	where cnpj = "40322420/0001-03";

delete from itenscompra 
	where valorCompra > 2.000;

delete from itenscompra
	where produto_idProduto = 18;
    
update cliente
	set nomeSocial = "Rochele"
		where cpf = "34567890123";

update cliente
	set nome = "Ana Pedrosa" 
		where cpf = "45678901234";

update cliente 
	set nome = "Belinda Pereira", email = "belinda.pereira@email.com"
		where idCliente = 4;
        
update cliente
	set cpf = "23456789002"
		where cpf = "23456789001";
        
update categoria
	set nome = "bag"
		where nome = "bolsa";
        
update categoria
	set nome = "camisinha"
		where idCategoria = 13;

update fornecedor
	set cnpj = "02320426/0001-01", nome = "Zé confecções"
		where idFornecedor = 1;
        
update fornecedor
	set nome = "Viachuelo", email = "viachuelo.confec@gmail.com"
		where nome = "Lenner";
        
update compra
	set valor = 2300
		where idCompra = 2;

update compra
	set dataCompra = "2023-07-15 09:30:00"
		where idCompra = 6;
        
update itensCompra
	set produto_udProduto = 6
		where compra_idCompra = 2;
        
update cliente 
	set nome = "Bernardo Rocha", email = "bernardo.rocha@email.com"
		where cpf = "90123456789";

update cliente
	set email = "pedro.oliveira.ramos@email.com"
		where email = "pedro.oliveira@email.com";
        
-- ------------------------------ Alter table ------------------------------ --

alter table cliente
	add signo varchar(15);
    
alter table itenscompra
	add tipoPagamento decimal(6,2) not null;

alter table funcionario
	add signo varchar(15) not null;
    
alter table produto
	add publico varchar(15) not null;
    
alter table promocao
	add sazonalidade varchar(20) not null;
    
alter table produto
	add estilista varchar(60) not null;
    
alter table fornecedor
	add ramo varchar (25) not null;
    
alter table compra
	add responsavel varchar (60) not null;
    
alter table cliente 
	drop column signo;
    
alter table funcionario 
	drop column signo;
    
alter table produto
	drop column marca;

alter table compra
	drop column responsavel;
    
-- ----------------------------- Drop database ----------------------------- --

drop database mydb;