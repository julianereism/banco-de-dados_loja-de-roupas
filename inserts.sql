
-- ---------------------------- Inserts -------------------------- --

insert into funcionario (CPF, nome, nomeSocial, dataNasc, genero, email, dataAdm, dataDemi)
values 
("123.456.789-01", "Gandalf", null, '1971-01-01', "m", "gandalf@gmail.com", '2001-01-01 11:11:11', null), 
("123.456.789-02", "Princípe Zuko", null, '1972-02-02', null, "zuko@gmail.com", '2002-02-02 22:22:22', null),
("123.456.789-04", "Tio Iroh", null, '1973-03-03', null, "TioIroh@gmail.com", '2003-03-03 03:33:33', null),
("111.111.111.11", "Aang", null, '1974-04-04', null, "aang@gmail.com", '2004-04-04 04:04:44', null),
("222.222.22-22", "Katara", null, '1975-05-05', "f", "Katara@gmail.com", '2005-05-05 05:05:05', null),
("333.333.33-33", "Toph", null, '1976-06-06', null, "toph@gmail.com", '2006-06-06 06:06:06', null),
("444.444.44-44", "Hyunjin", null, '1977-07-07', null, "Hyunjin@gmail.com", '2007-07-07 07:07:07', null),
("555.555.55-55", "Hayley Williams", null, '1978-08-08', "f", "HayleyWilliams@gmail.com", '2008-08-08 08:08:08' , null),
("666.666.66-66", "Taylor York", null, '1979-09-09', "m", "tayloryork@gmail.com", '2009-09-09 09:09:09', null),
("777.777.77-77", "Zac Farro", null, '1980-01-01', "m", "zacfarro@gmail.com", '2010-10-10 10:10:10', null),
("888.888.88-88", "Mina", null, '1981-01-01', "f", "Mina@gmail.com", '2011-11-11 11:11:11',null),
("999.999.99-99", "Jung-kook", null, '1982-01-01', "m", "Jungkook@gmail.com", '2012-12-12 12:12:12', null),
("001.001.01-01", "Shakira", null, '1983-01-01', "f", "shakira@gmail.com", '2013-01-13 13:13:13', null),
("002.002.02-02", "Steve Harris", null, '1984-04-04', "m", "SteveHarris@gmail.com", '2014-01-14 14:14:14', null),
("003.003.03-03", "Hansi", null, '1985-05-05', "m", "hansi@gmail.com", '2015-01-15', null),
("004.004.04-04", "Hermione", null, '1986-06-06', "f", "Hermione@gmail.com", '2016-01-16', null),
("005.005.05-05", "Luna", null, '1987-07-07', null, "luna@gmail.com", '2017-01-07 17:17:17', null),
("006.006.06-06", "Thorin", null, '1988-08-08', "m", "thorin@gmail.com", '2018-01-18 18:18:18', null),
("007.007.07-07", "Taylor Swift", null, '1989-09-09', "f", "TaylorSwift@gmail.com", '2019-01-19 19:19:19', null)
;

insert into enderecoFunc (uf, cidade, bairro, cep, rua, numero, comp, funcionario_idfuncionario)
values
('PE', "Rio Formoso", "Terra Média", 878787878, "Rua do Condado", "1234", NULL, 1),
('PE', "Recife", "Avatar", 123456789, "Rua Redenção", "5700", "apt 401", 2),
('PE', "Recife", "Avatar", 987654321, "Rua Fogo", "6789", NULL, 3),
('PE', "Recife", "Avatar", 456123789, "Rua Ar", "9832", NULL, 4),
('PE', "Recife", "Avatar", 987123456, "Rua Agua", "1045", "apt 603", 5),
('PE', "Recife", "Avatar", 654987321, "Rua Terra", "1785", NULL, 6),
('PE', "Olinda", "Stray Kids", 789456123, "Rua Juliane", "2563", "apt 507", 7),
('PE', "Olinda", "Paramore", 321654987, "Rua This is Why ", "9056", NULL, 8),
('PE', "Olinda", "Paramore", 789321456, "Rua After Laughter", "5671", NULL, 9),
('PE', "Olinda", "Paramore", 456789123, "Rua HalfNoise", "1098", "apt609", 10),
('PE', "Recife", "Twice", 231456789, "Rua Likey", "1708", NULL, 11),
('PE', "Recife", "BTS", 894561237, "Rua Seven", "8098", NULL, 12),
('PE', "Recife", "Quadril", 763215498, "Rua Dont Lie ", "7777", NULL, 13),
('PE', "Olinda", "Iron Maiden", 987654312, "Rua Brave New Wolrd", "6666", NULL, 14),
('PE', "Recife", "Blind Guardian", 457983214, "Rua Wheel of Time", "8888", NULL, 15),
('PE', "Olinda", "Hogwarts", 654789123, "Rua Beco Diagonal", "9999", NULL, 16),
('PE', "Olinda", "Hogwarts", 321456987, "Rua Hogsmeade", "9344", NULL, 17),
('PE', "Rio Formoso", "Terra Média", 879634215, "Rua Montanha", "2222", NULL, 18),
('PE', "Recife", "Reputation", 879634215, "Rua Midnights", "5555", NULL, 19)
;

insert into Cliente (CPF, nome, email, dataNasc, genero, nomeSocial, telefone) 
values
("12345678901", "João da Silva", "joao.silva@email.com", '1980-05-15', "M", "Joãozinho", '(11) 98765-4321'),
("23456789012", "Maria Oliveira", "maria.oliveira@email.com", '1992-09-23', "F", "Mario", '(21) 98765-4321'),
("34567890123", "Carlos Santos", "carlos.santos@email.com", '1985-12-10', "M", NULL, '(31) 98765-4321'),
("45678901234", "Ana Lima", "ana.lima@email.com", '1988-07-02', "F", "André", '(41) 98765-4321'),
("56789012345", "Fernando Pereira", "fernando.pereira@email.com", '1995-03-18', "M", NULL, '(51) 98765-4321'),
("67890123456", "Isabel Souza", "isabel.souza@email.com", '1983-11-30', "F", "Igor", '(61) 98765-4321'),
("78901234567", "Rafaela Martins", "rafaela.martins@email.com", '1990-02-25', "F", NULL, '(71) 98765-4321'),
("89012345678", "Eduardo Costa", "eduardo.costa@email.com", '1982-06-08', "M", "Eduarda", '(81) 98765-4321'),
("90123456789", "Juliana Rocha", "juliana.rocha@email.com", '1987-08-14', "F", NULL, '(91) 98765-4321'),
("12345678900", "Pedro Oliveira", "pedro.oliveira@email.com", '1993-04-05', "M", "Patrícia", '(01) 98765-4321'),
("23456789001", "Luana Lima", "luana.lima@email.com", '1986-10-20', "F", "Lua", '(02) 98765-4321'),
("90123456711", "Shawn Corey", "shwan.corey@email.com", '1969-12-04', "M", "JAY-Z", '(08) 98765-4321'),
("45678901233", "Cristina Souza", "cristina.souza@email.com", '1994-07-15', "F", NULL, '(04) 98765-4321'),
("56789012344", "Lucas Martins", "lucas.martins@email.com", '1984-01-28', "M", "Luísa", '(05) 98765-4321'),
("67890123455", "Mariana Costa", "mariana.costa@email.com", '1991-05-09', "F", "Mary", '(06) 98765-4321'),
("78610943299", "Fernanda Paes", "fernanda.paes@email.com", '1989-12-26', "F", NULL, '(81) 9986-9633'),
("89012345600", "Beyoncé Knowles", "beyonce.know@email.com", '1981-09-04', "F", "Sasha Fierce", '(01) 9963-9088'),
("56789012366", "Shakira", "shakira.kira@email.com", '1977-02-01', "F", NULL, '(14) 98765-4321'),
("67890123477", "Jake Peralta", "jake.peralta@email.com", '1979-09-10', "M", NULL, '(15) 98765-4321');

insert into enderecoCli (uf, cidade, bairro, cep, rua, numero, comp, Cliente_idCliente) values
('SP', "São Paulo", "Centro", 01001000, "Avenida Paulista", "1000", NULL, 1),
('RJ', "Rio de Janeiro", "Copacabana", 22070001, "Avenida Atlântica", "500", "Apto 101", 2),
('MG', "Belo Horizonte", "Savassi", 30130000, "Rua Pernambuco", "300", NULL, 3),
('PR', "Curitiba", "Batel", 80240010, "Avenida do Batel", "2000", "Sala 301", 4),
('PE', "Recife", "Encruzilhada", 52130010, "Avenida Beberibe", "987", "Apto 613", 5),
('DF', "Brasília", "Asa Sul", 70390100, "Quadra 302", "Bloco B", "Apto 402", 6),
('BA', "Salvador", "Barra", 40140100, "Avenida Oceânica", "2500", "Casa 10", 7),
('PE', "Recife", "Boa Viagem", 51021001, "Avenida Boa Viagem", "1000", NULL, 8),
('PE', "Recife", "Madalena", 50720050, "Rua José Osório", "543", "Apto 701", 9),
('PA', "Belém", "Nazaré", 66035090, "Travessa Padre Eutíquio", "1200", NULL, 10),
('MG', "Uberlândia", "Santa Mônica", 38408134, "Rua dos Ipês", "123", NULL, 11),
('SP', "Campinas", "Cambuí", 13024201, "Avenida Norte-Sul", "789", "Bloco C", 12),
('RJ', "Niterói", "Icaraí", 24220001, "Rua Gavião Peixoto", "456", NULL, 13),
('RS', "Caxias do Sul", "Centro", 95020090, "Rua Sinimbu", "987", "Casa 102", 14),
('SC', "Florianópolis", "Centro", 88015900, "Rua Felipe Schmidt", "321", NULL, 15),
('PE', "Recife", "Setúbal", 51160220, "Rua Francisco da Cunha", "890", NULL, 16),
('PE', "Recife", "Boa Vista", 50070200, "Avenida Conde da Boa Vista", "678", "Sala 201", 17),
('PE', "Recife", "Imbiribeira", 51130230, "Avenida Mascarenhas de Moraes", "432", "Conjunto 301", 18),
('CA', "Los Angeles", "Los Angeles County", 90001, "Bel Air", "1234", "Casa 001", 19);


insert into Venda (dataVenda, statusEntrega, qntd, valor, funcionario_idfuncionario, Cliente_idCliente)
values 
('2013-01-13', "entregue", "5", 334.99 , 3, 17),
('2017-01-13', "entregue", "4", 234.99 , 2, 2),
('2017-02-13', "entregue", "2", 93.99 , 1, 3),
('2020-10-10', "entregue", "8", 749.99, 5, 4),
('2022-12-29', "entregue", "5", 634.99, 5, 5),
('2022-12-29', "entregue", "10", 1794.99, 5, 6),
('2022-12-19', "entregue", "2", 200.99, 6, 7),
('2022-12-29', "entregue", "1", 99.99, 2, 8),
('2023-04-27', "devolvido", "7", 609.39, 1, 9),
('2023-06-30', "entregue", "3", 299.47, 1, 10),
('2023-06-25', "entregue", "10", 1237.64, 2, 11),
('2023-08-21', "entregue", "14", 1538.99, 2, 12),
('2023-08-23', "entregue", "6", 740.90, 3, 13),
('2023-08-05', "entregue", "3", 387.09, 4, 14),
('2023-08-19', "entregue", "8", 847.59, 4, 15),
('2023-09-27', "em transito", "3", 567.99, 16, 16),
('2023-09-29', "transito", "3", 297.09, 8, 17),
('2023-08-10', "em transito", "3", 400.99, 14, 18),
('2023-06-10', "em transito", "3", 134.99, 11, 19),
('2023-09-30', "aguardando transportadora", "7", 500.90, 19, 17),
('2023-10-03', " aguardando transportadora", "5", 400.00, 19, 18),
('2023-10-08', "agurdando transportadora", "10", 1074.99, 1, 06),
('2023-10-08', "em transito", "4", 350.99, 4, 19)
;

insert into formaPag ( qntdparcelas, tipopag, venda_idvenda, valortotal)
values
(3, "cartão de crédito", 1, 334.99),
(2, "cartão de crédito", 2, 234.99),
(null, "cartão de débito", 3, 93.99),
(4, "cartão de crédito", 4, 549.99),
(null, "pix", 4, 200.00),
(3, "cartão de crédito", 5, 434.99),
(null, "pix", 5, 200.00),
(12, "cartão de crédito", 6, 1794.99),
(2, "cartão de crédito", 7, 200.99),
(null, "cartão de débito", 8, 99.99),
(5, "cartão de crédito", 9, 609.39),
(3, "cartão de crédito", 10, 299.47),
(12, "cartão de crédito", 11, 1237.64),
(12, "cartão de crédito", 12, 1538.99),
(5, "cartão de crédito", 13, 590.90),
(null, "pix", 13, 200.00),
(null, "pix", 14, 387.09),
(10, "cartão de crédito", 15, 847.59),
(3, "cartão de crédito", 16, 567.99),
(2, "cartão de crédito", 17, 297.09),
(4, "cartão de crédito", 18, 400.99),
(null, "cartão de débito", 19, 134.99),
(4, "cartão de crédito", 20, 500.90),
(3, "cartão de crédito", 21, 300.00),
(null, "pix", 21, 100.00),
(8, "cartão de crédito", 22, 874.99),
(null, "pix", 22, 200.00),
(null, "cartão de débito", 23, 350.99)
;

insert into categoria (nome)
	values ("infantil"), ("adulto"), ("masculino"), ("feminino"), ("unissex"), ("plus size"), ("alta costura"), ("calça"), ("blusa"),
		 ("vestido"), ("short"), ("camisa"), ("camiseta"), ("calcinha"), ("sutiã"), ("cueca"), ("pijama"), ("acessório"), ("bolsa");
         
insert into produto (nome, cor, tam, marca, qntd)
	values ("brusinha i love my boyfriend: pedro pascal", "branca", "P", "Daddy", 10),
    ("brusinha i love my boyfriend: pedro pascal", "branco", "M", "Daddy", 10),
    ("brusinha i love my boyfriend: pedro pascal", "vermelho", "G", "Daddy", 10),
    ("brusinha i love my boyfriend: pedro pascal", "branco", "GG", "Daddy", 10),
    ("brusinha i love my boyfriend: pedro pascal", "azul", "extra G", "Daddy", 5 ),
    ("brusinha i love my boyfriend: pedro pascal", "branca", "P", "Daddy", 10),
    ("brusinha i love DILF", "preto", "P", "I Love Dilfs", 15),
    ("brusinha i love DILF", "preto", "M", "I Love Dilfs", 15),
    ("brusinha i love DILF", "preto", "GG", "I Love Dilfs", 15),
    ("brusinha i love DILF", "preto", "extra G", "I Love Dilfs", 5),
    ("camiseta Hyunjin is my Jesus", "branco", "P", "Stay", 20),
    ("camiseta Hyunjin is my Jesus", "rosa", "M", "Stay", 10),
    ("camiseta Hyunjin is my Jesus", "pink", "G", "Stay", 15),
    ("Let me lick your butt Bey!", "branco", "M", "Beybey", 20),
    ("Let me lick your butt Bey!", "branco", "G", "Beybey", 10),
    ("eco bag Stray Kids", "bege", "único", "Stay", 20),
    ("eco bag Scar Face", "preto", "único", "HorrorFy", 20),
    ("eco bag Hannibal Lecter", "preto", "único", "HorrorFy", 20),
    ("eco bag Jason", "preto", "único", "HorrorFy", 12),
    ("eco bag Talk to Me", "preto", "único", "HorrorFy", 15),
    ("eco bag ", "preto", "único", "HorrorFy", 20),
    ("eco bag Zoro", "preto", "único", "AnimeBag", 10),
    ("calça cintura alta", "jeans", "38", "Calça&Calça", 8),
    ("calça cintura alta", "jeans", "40", "Calça&Calça", 5),
    ("calça cintura alta", "jeans", "46", "Calça&Calça", 2),
    ("calça cintura alta", "jeans", "56", "Calça&Calça", 3);
    
    insert into Fornecedor (CNPJ, nome, email) values 
("02320415/0001-01", "zezinho confecções", "zezinho_conf@gmail.com"),
("11320415/0001-02", "Puro algodão", "puro_algodao@gmail.com"),
("40322420/0001-03", "Usual malhas", "usual_malhas@gmail.com"),
("04324416/0001-04", "Lenner", "lenner.confec@gmail.com"),
("07420315/0001-05", "Sol da terra", "sol.terra_conf@gmail.com"),
("03327615/0001-06", "Zianel Atacado", "Zianel_atcf@gmail.com"),
("09450500/0001-07", "Kaisan", "kaisan.conf@gmail.com"),
("10760612/0001-08", "Dani atacado", "dani_modas@gmail.com"),
("53123815/0001-09", "Intimus peças", "intimus.peças@gmail.com"),
("14470314/0001-10", "moda feminina", "fem_modas@gmail.com");

insert into enderecoFornec (uf,cidade, bairro, cep, rua, numero, comp,Fornecedor_idFornecedor) 
values 
 ('SP', "São Paulo", "Tatuapé", 5089063, "Rua 28 de Outubro", "26", NULL, 1),
 ('SP', "Itaquaquecetuba", "Jardim Itaquá", 30120550, "Rua dos Alfaiates", "101", NULL, 2),
 ('RJ', "Rio de Janeiro", "Barra da Tijuca", 40780600, "Avenida das Américas", "17", NULL, 3),
 ('PE', "Recife", "Madalena", 65412210, "Avenida Caxangá", "60", NULL, 4),
 ('RN', "Natal", "Cidade Alta", 98870150, "Praça Dom Vital", "39", NULL, 5),
 ('SP', "Campinas", "Vila Industrial", 41562950, "Avenida Sílvio Moro", "65", NULL, 6),
 ('PE', "Petrolina", "José e Maria", 15615123, "Rua Asa Branca", "200", NULL, 7),
 ('RS', "Porto Alegre", "Bela Vista", 12348456, "Rua Ciro Gavião", "11", NULL, 8),
 ('RJ', "Duque de Caxias", "Olavo Bilac", 0789635, "Rua Álvaro Ramos", "98", NULL, 9),
 ('SP', "São Paulo", "Vila Madalena", 30560890, "Rua Caraça", "150", NULL, 10);
 
 insert into compra (valor, dataCompra, Fornecedor_idFornecedor)
	values
    (3500.99, '2022-05-12 08:00:00', 10),
    (2000.99, '2022-03-02 14:00:00', 10),
    (4000, '2022-03-01 13:00:00', 9),
    (2500.90, '2023-09-12 10:00:00', 9),
    (2000.90, '2021-05-07 08:30:00', 8),
    (3000, '2022-02-02 09:00:00', 7),
    (4000, '2023-05-15 15:00:00', 6),
    (1000, '2023-05-15 09:30:00', 5),
    (500.75, '2023-05-15 16:30:00', 4),
    (2500, '2020-05-16 17:00:00', 3),
    (250, '2020-08-12 07:50:00', 2),
    (790, '2022-05-10 14:40:00', 1),
    (500, '2023-06-15 10:20:00', 1),
    (1000, '2023-12-12 08:50:00', 1),
	(3000.99, '2022-11-25 14:30:00', 10),
	(1500.50, '2023-01-12 08:45:00', 5),
	(4500, '2022-06-20 11:15:00', 8),
	(2800.90, '2023-03-05 16:00:00', 7),
	(1900.75, '2022-09-10 13:20:00', 6),
	(3200, '2023-02-15 09:30:00', 9),
	(5500.50, '2022-08-18 10:30:00', 4),
	(900.25, '2023-04-22 12:40:00', 2),
	(6500, '2023-06-05 14:25:00', 3),
	(2100, '2022-12-10 15:15:00', 1),
	(1700, '2022-10-08 16:10:00', 5),
	(1300.25, '2023-01-30 17:45:00', 7);
		
    
   INSERT INTO ItensCompra (compra_idcompra, produto_idProduto, valorCompra, qntd, dataEntrada)
VALUES
(1, 1, 3500.99, 10, '2022-10-12 14:00:00'),
(2, 2, 2000.99, 10, '2022-10-12 14:00:00'),
(3, 3, 4000, 10, '2022-10-12 14:00:00'),
(4, 4, 2500.90, 10, '2022-10-12 14:00:00'),
(5, 5,2000.90, 5, '2022-03-02 14:00:00'),
(6, 6, 3000, 10, '2022-03-02 14:00:00'),
(7, 7, 4000, 20, '2022-03-02 14:00:00'),
(8, 8,1000, 20, '2022-03-02 14:00:00'),
(9, 9,500.75, 20, '2022-03-02 14:00:00'),
(10, 10,2500, 20, '2022-04-04 14:00:00'),
(11, 11,250,20, '2022-04-04 14:00:00'),
(12, 12,790, 20, '2022-04-04 14:00:00'),
(13, 13,500, 20, '2022-04-04 14:00:00'),
(14, 14,1000, 20, '2022-04-04 14:00:00'),
(15, 15, 3000.99, 20, '2022-04-04 14:00:00'),
(16, 15,1500.50, 20, '2022-04-04 14:00:00'),
(16, 16,4500, 20, '2022-05-05 14:00:00'),
(17, 17,2800.90, 20, '2022-05-05 14:00:00'),
(18, 18,1900.75, 20, '2022-05-05 14:00:00'),
(19, 19, 3200, 20, '2022-05-05 14:00:00'),
(20, 20,5500.50, 20, '2022-05-05 14:00:00'),
(21, 21,900.25, 20, '2022-05-05 14:00:00'),
(22, 22, 6500, 30, '2023-05-15 15:00:00'),
(23, 23, 2100, 30, '2023-06-15 15:00:00'),
(24,24,1700, 30, '2023-07-15 15:00:00'),
(25,25, 1300.25, 30, '2023-07-15 15:00:00');

