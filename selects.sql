

-- ------------------------- Consultas gerais ------------------------- --

SELECT * FROM funcionario;

SELECT * FROM enderecoFunc;

SELECT * FROM cliente;

SELECT * FROM venda;

SELECT * FROM formaPag;

SELECT * FROM compra;

SELECT * FROM itenscompra;

SELECT * FROM fornecedor;

SELECT * FROM enderecoFornec;

SELECT * FROM categoria;

SELECT * FROM produto;


-- ------------------------------- Consultas complexas ---------------------------------- --

-- Lista de todos os funcionários trazendo as colunas (Funcionario, Email, Cidade, Bairro e rua) e enumeração dos mesmos.

select func.nome "Funcionario",
    func.email "E-mail",
    ende.cidade "Cidade",
    ende.bairro "Bairro",
    ende.rua "Rua",
    ROW_NUMBER() OVER (ORDER BY func.idfuncionario) "Enumeração/lista dos funcionários"
from funcionario func
inner join enderecoFunc ende ON func.idfuncionario = ende.funcionario_idfuncionario
group by ende.funcionario_idfuncionario
order by "Lista de funcionários" DESC;


-- Lista dos funcionários que moram no bairro Avatar, trazendo as colunas (Funcionário, E-mail, Bairro e Rua).

select func.nome "Funcionario", 
	func.email "E-mail", 
    ende.bairro "Bairro", 
    ende.rua "Rua"
from funcionario func
inner join enderecoFunc ende on funcionario_idfuncionario=idfuncionario
where ende.bairro="Avatar"
order by func.nome;

-- Lista de todos os funcionários que moram em cidades com inicial R, trazendo as colunas (Funcionario, E-mail, Cidade, Bairro, Rua).

select func.nome "Funcionario", 
	func.email "E-mail", 
	ende.cidade "Cidade", 
	ende.bairro "Bairro", 
	ende.rua "Rua"
from funcionario func
inner join enderecoFunc ende on funcionario_idfuncionario=idfuncionario
where ende.cidade like "R%"
order by func.nome;


-- Lista enumerada de cada venda, funcionário que a realizou, data, status e valor, trazendo as colunas (Funcionário que realizou a venda, E-mail do funcionário, Data da venda, Status de Entrega, Valor da Venda e Enumeração).

select func.nome "Funcionario que realizou a venda", 
	func.email "E-mail do funcionario", 
	ven.dataVenda "Data da venda", 
	ven.statusEntrega "Status de Entrega", 
	ven.valor "Valor da Venda",
    ROW_NUMBER() OVER (ORDER BY ven.funcionario_idfuncionario) "Enumeração/lista de Vendas"
from funcionario func
inner join venda ven on ven.funcionario_idfuncionario = func.idfuncionario
order by "Lista de vendas" DESC;


-- Lista de quantidade de vendas por funcionário, trazendo as colunas (Funcionário, E-mail do funcionário e Quantidades de Vendas do Funcionário).

select func.nome "Funcionario", 
	func.email "E-mail do funcionario", 
	COUNT(ven.idVenda) "Quantidade de Vendas do Funcionário"
from funcionario func
inner join venda ven on ven.funcionario_idfuncionario = func.idfuncionario
group by func.idfuncionario, func.nome, func.email
order by func.nome;


-- Lista de quantidade de vendas por funcionário, mosrtando também os que não venderam, trazendo as colunas (Funcionário, E-mail do funcionário e Quantidades de Vendas do Funcionário).

select func.nome "Funcionario", 
	func.email "E-mail do funcionario", 
	COUNT(ven.idVenda) "Quantidade de Vendas do Funcionário"
from funcionario func
left join venda ven on ven.funcionario_idfuncionario = func.idfuncionario
group by func.idfuncionario, func.nome, func.email
order by func.nome;


-- Lista de funcionários que não realizaram nenhuma venda, trazendo as colunas (Funcionário, E-mail do funcionário e Quantidades de Vendas do Funcionário).

select 
    func.nome  "Funcionario",
    func.email  "E-mail do funcionario",
    COUNT(ven.idVenda)  "Quantidade de Vendas do Funcionário"
from funcionario func
left join venda ven ON ven.funcionario_idfuncionario = func.idfuncionario
group by func.idfuncionario, func.nome, func.email
having COUNT(ven.idVenda) = 0
order by func.nome;


-- Lista de vendas realizadas pelo funcionário Aang, trazendo as colunas (Funcionário que realizou a venda, e-mail do funcionário, data da venda, status da entrega, valor da venda e enumeração das vendas).

select func.nome "Funcionario que realizou a venda", 
	func.email "E-mail do funcionario", 
	ven.dataVenda "Data da venda", 
	ven.statusEntrega "Status de Entrega", 
	ven.valor "Valor da Venda",
    ROW_NUMBER() OVER (ORDER BY func.idfuncionario) "Enumeração/lista de Vendas realizadas"
from funcionario func
inner join venda ven on ven.funcionario_idfuncionario = func.idfuncionario
where func.nome = "aang";


-- Lista de todas as vendas, trazendo as colunas (Cliente, e-mail do cliente, data da venda, status da entrega, valor da venda e funcionário que realizou a venda).

select cli.nome "Cliente", 
	cli.email "E-mail do Cliente", 
	ven.dataVenda "Data da venda", 
	ven.statusEntrega "Status de Entrega", 
	ven.valor "Valor da Venda",
    (select func.nome from funcionario func where func.idfuncionario = ven.funcionario_idfuncionario) "Funcionario que realizou a venda"
from cliente cli
inner join venda ven on ven.cliente_idcliente = cli.idcliente
order by cli.nome;

-- Lista de vendas acima de R$ 600,00, trazendo as colunas (Cliente, e-mail do cliente, quantidade de produtos, data da compra, status da entrega e valor da compra).

select cli.nome "Cliente", 
	cli.email "E-mail do cliente", 
	ven.qntd "Quantidade de produtos", 
	ven.dataVenda "Data da compra", 
	ven.statusEntrega "Status de Entrega", 
	ven.valor "Valor da compra"
from cliente cli
inner join venda ven on ven.cliente_idcliente = cli.idcliente
where ven.valor >= 600
and ven.dataVenda>= '2022-01-01' and ven.dataVenda<= '2022-12-31' 
;


-- Lista de compra com o maior valor, trazendo as colunas (Cliente, e-mail do cliente, quantidade de produtos, data da compra, status da entrega, valor da compra e funcionário que realizou a venda).

select cli.nome "Cliente", 
	cli.email "E-mail do cliente", 
	ven.qntd "Quantidade de produtos", 
	ven.dataVenda "Data da compra", 
	ven.statusEntrega "Status de Entrega", 
	ven.valor "Valor da compra"
, (select func.nome from funcionario func where func.idfuncionario = ven.funcionario_idfuncionario) "Funcionario que realizou a venda"
from cliente cli
inner join venda ven on ven.cliente_idcliente = cli.idcliente
where ven.valor = (select MAX(valor) from venda)
;


-- Lista de compras de menor valor, trazendo as colunas (Cliente, e-mail do cliente, quantidade de produtos, data da compra, status de entrega, valor da compra e funcionário que realizou a venda)

select cli.nome "Cliente", 
	cli.email "E-mail do cliente", 
	ven.qntd "Quantidade de produtos", 
	ven.dataVenda "Data da compra", 
	ven.statusEntrega "Status de Entrega", 
	ven.valor "Valor da compra"
, (select func.nome from funcionario func where func.idfuncionario = ven.funcionario_idfuncionario) "Funcionario que realizou a venda"
from cliente cli
inner join venda ven on ven.cliente_idcliente = cli.idcliente
where ven.valor = (select MIN(valor) from venda)
;


-- Lista de vendas que tenham acima de 10 parcelas, trazendo as tabelas (Data da compra, valor da compra, funcionário que realizou a venda, cliente, parcelas)

select 
    ven.dataVenda "Data da Compra",
    ven.valor "Valor da Compra",
    (SELECT func.nome FROM funcionario func WHERE func.idfuncionario = ven.funcionario_idfuncionario) "Funcionário que Realizou a Venda",
    (SELECT cli.nome FROM cliente cli WHERE cli.idcliente = ven.cliente_idcliente) "Cliente",
    form.qntdparcelas "Parcelas"
from venda ven
inner join formapag form ON form.venda_idvenda = ven.idvenda
where form.qntdparcelas >= 10;

-- Lista de todas as compras e fornecedores correspondentes.

select c.*, f.*, ef.*
from compra c
right join Fornecedor f ON c.Fornecedor_idFornecedor = f.idFornecedor
left join enderecoFornec ef ON f.idFornecedor = ef.Fornecedor_idFornecedor;


-- Lista dos fornecedores do bairro Madalena, trazendo as tabelas (nome do fornecedor, e-mail, bairro e rua)

select forn.nome "Nome do Fornecedor", 
	forn.email "E-mail", 
    ende.bairro "Bairro", 
    ende.rua "Rua"
from fornecedor forn
inner join enderecoFornec ende on Fornecedor_idFornecedor=idfornecedor
where ende.bairro="Madalena"
order by forn.nome;

-- Lista de todos os fornecedores e compras associadas a estes, trazendo as tabelas (fornecedor associado a compra, e-mail do fornecedor, data da compra, valor da compra, enumeração das compras)

select forn.nome "Fornecedor associado à compra", 
	forn.email "E-mail do Fornecedor", 
	com.dataCompra "Data da compra", 
	com.valor "Valor da compra",
    ROW_NUMBER() OVER (ORDER BY com.fornecedor_idfornecedor) "Enumeração/lista de Compras"
from fornecedor forn
inner join compra com on com.fornecedor_idfornecedor = forn.idfornecedor
order by "Enumeração/lista de Compras" DESC;

-- Lista da quantidade de compras por fornecedor, trazendo as colunas (fornecedor responsável pela venda, e-mail do fornecedor, quantidade de compras)

select forn.nome "Fornecedor responsavel pela compra", 
	forn.email "E-mail do Fornecedor", 
	COUNT(com.idCompra) "Quantidade de Compras pelo Fornecedor"
from Fornecedor forn
inner join compra com on com.fornecedor_idfornecedor = forn.idfornecedor
group by forn.idFornecedor, forn.nome, forn.email
order by COUNT(com.idCompra) DESC;

-- Lista de compras >= 2 por fonecedor, trazendo as colunas (fornecedor envolvido na compra, e-mail do fornecedor, quantidade de compras feitas)

select 
    forn.nome  "Fornecedor envolvido na compra",
    forn.email  "E-mail do fornecedor",
	COUNT(com.idCompra) "Quantidade de Compras feitas com este Fornecedor"
from Fornecedor forn
inner join compra com on com.fornecedor_idfornecedor = forn.idfornecedor
group by forn.idFornecedor, forn.nome, forn.email
having COUNT(com.idCompra) >= 4
order by COUNT(com.idCompra) DESC;

-- Lista de de todos os dados de compra, produto e itens de compra.

select i.*, c.*, p.*
from itenscompra i
left join compra c on i.compra_idcompra = c.idcompra
left join produto p on i.produto_idProduto = p.idProduto;

-- Lista de compras e produtos envolvidos, trazendo as colunas (data entrada, quantidade de produtos da compra, data da compra, valor da compra, nome do produto e nome da marca)

select ite.dataEntrada "Data de Entrada", 
	ite.qntd "Quantidade de produtos da compra", 
	com.dataCompra "Data da Compra", 
	com.valor "Valor da compra",
	(select pro.nome from produto pro where pro.idproduto = ite.produto_idProduto) "Nome do Produto",
	(select pro.marca from produto pro where pro.idproduto = ite.produto_idProduto) "Nome da Marca"
from compra com
inner join itenscompra ite on ite.compra_idcompra = com.idcompra;

-- Lista de compras da marca Daddy, trazendo as colunas (data de entrada, quantidade de produtos da compra, data da compra, valor da compra, nome do produto e nome da marca)

select ite.dataEntrada "Data de Entrada", 
	ite.qntd "Quantidade de produtos da compra", 
	com.dataCompra "Data da Compra", 
	com.valor "Valor da compra",
	(select pro.nome from produto pro where pro.idproduto = ite.produto_idProduto) "Nome do Produto",
	(select pro.marca from produto pro where pro.idproduto = ite.produto_idProduto) "Nome da Marca"
from compra com
inner join itenscompra ite on ite.compra_idcompra = com.idcompra
where 	(select pro.marca from produto pro where pro.idproduto = ite.produto_idProduto)="Daddy"
;


-- Lista de tipos de forma de pagamento, quantidade de vezes que foi utilizada e valor total por tipo de pagamento, trazendo as colunas (forma de pagamento, quantas vezes o modelo foi utilizado pelos clientes, total por tipo)

select 
    formaPag.tipopag "Forma de Pagamento",
    COUNT(formaPag.Venda_idVenda) "Quantas vezes este modo de pagamento foi utilizado pelos clientes nas vendas",
    SUM(formaPag.Valortotal) "Total do Valor desse tipo de pagamento em todas as vendas"
from FormaPag formaPag
group by formaPag.tipopag
order by "Quantas vezes este modo de pagamento foi utilizado pelos clientes nas vendas" DESC;

-- Lista de compra de maior valor, trazendo as colunas (fornecedor, e-mail, data da compra, valor da compra)

select forn.nome "Fornecedor", 
	forn.email "E-mail", 
	comp.dataCompra "Data da compra", 
	comp.valor "Valor da compra"
from fornecedor forn
inner join compra comp on comp.Fornecedor_idFornecedor = forn.idfornecedor
where comp.valor = (select MAX(valor) from compra);

-- Lista de compra de menor valor, trazendo as colunas (fornecedor, e-mail, data de compra e valor da compra)

select forn.nome "Fornecedor", 
	forn.email "E-mail", 
	comp.dataCompra "Data da compra", 
	comp.valor "Valor da compra"
from fornecedor forn
inner join compra comp on comp.Fornecedor_idFornecedor = forn.idfornecedor
where comp.valor = (select MIN(valor) from compra)
;

-- Lista de fornecedores e valor total da compras por fonecedor, trazendo as colunas (fornecedor, quantidade de compra, valor total das compras)

select forn.nome "Fornecedor",
       COUNT(comp.idCompra) "Quantidade de Compras com este Fornecedor",
       SUM(comp.valor) "Valor Total das Compras"
from fornecedor forn
left join compra comp on comp.Fornecedor_idFornecedor = forn.idFornecedor
group by forn.nome
order by forn.nome;


-- ---------------------------- VIEWS ------------------------------ --

CREATE VIEW vw_FuncionariosComEnderecos AS
SELECT func.nome AS NomeFuncionario, func.email AS EmailFuncionario, ende.cidade AS Cidade, ende.bairro AS Bairro, ende.rua AS Rua
FROM funcionario func
INNER JOIN enderecoFunc ende ON func.idfuncionario = ende.funcionario_idfuncionario;

CREATE VIEW vw_VendasComFuncionarios AS
SELECT func.nome AS NomeFuncionario, func.email AS EmailFuncionario, ven.dataVenda AS DataVenda, ven.valor AS ValorVenda, ven.statusEntrega AS StatusEntrega
FROM funcionario func
INNER JOIN venda ven ON ven.funcionario_idfuncionario = func.idfuncionario;

CREATE VIEW vw_DetalhesComprasComFornecedores AS
SELECT forn.nome AS NomeFornecedor, forn.email AS EmailFornecedor, com.dataCompra AS DataCompra, com.valor AS ValorCompra
FROM fornecedor forn
INNER JOIN compra com ON com.Fornecedor_idFornecedor = forn.idFornecedor;


CREATE VIEW vw_ProdutosComCategorias AS
SELECT prod.nome AS NomeProduto, prod.descricao AS DescricaoProduto, cat.nome AS NomeCategoria
FROM produto prod
INNER JOIN categoria cat ON prod.categoria_idcategoria = cat.idcategoria;


CREATE VIEW vw_ContagemVendasPorFuncionario AS
SELECT func.nome AS NomeFuncionario, func.email AS EmailFuncionario, COUNT(ven.idVenda) AS ContagemVendas
FROM funcionario func
LEFT JOIN venda ven ON ven.funcionario_idfuncionario = func.idfuncionario
GROUP BY func.idfuncionario, func.nome, func.email;


CREATE VIEW vw_FornecedoresComContagemCompras AS
SELECT forn.nome AS NomeFornecedor, forn.email AS EmailFornecedor, COUNT(com.idCompra) AS ContagemCompras
FROM fornecedor forn
LEFT JOIN compra com ON com.Fornecedor_idFornecedor = forn.idFornecedor
GROUP BY forn.idFornecedor, forn.nome, forn.email;


CREATE VIEW vw_VendasAcima600Em2022 AS
SELECT cli.nome AS NomeCliente, cli.email AS EmailCliente, ven.qntd AS QuantidadeProdutos, ven.dataVenda AS DataVenda, ven.statusEntrega AS StatusEntrega, ven.valor AS ValorVenda
FROM cliente cli
INNER JOIN venda ven ON ven.cliente_idcliente = cli.idcliente
WHERE ven.valor >= 600 AND ven.dataVenda >= '2022-01-01' AND ven.dataVenda <= '2022-12-31';


CREATE VIEW vw_ItensCompraComDetalhes AS
SELECT ite.dataEntrada AS DataEntrada, ite.qntd AS Quantidade, com.dataCompra AS DataCompra, com.valor AS ValorCompra, prod.nome AS NomeProduto, prod.marca AS MarcaProduto
FROM itenscompra ite
LEFT JOIN compra com ON ite.compra_idcompra = com.idcompra
LEFT JOIN produto prod ON ite.produto_idProduto = prod.idProduto;


CREATE VIEW vw_UsosMetodosPagamento AS
SELECT form.tipopag AS MetodoPagamento, COUNT(form.Venda_idVenda) AS ContagemUso, SUM(form.Valortotal) AS ValorTotal
FROM formaPag form
GROUP BY form.tipopag;

