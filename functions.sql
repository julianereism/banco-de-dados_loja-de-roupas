-- ------------------------------- FUNCTIONS ----------------------------------

-- ---------------------- Função para obter o número de funcionários -------------------

delimiter $$
create function TotalFuncionários() returns int deterministic no sql reads sql data
begin
    declare total_funcionarios int;
    select count(*) into total_funcionarios from funcionario;
    return total_funcionarios;
end $$
delimiter ;

select TotalFuncionários() as Total_Funcionários;


-- ---------------------- Função para calcular a média de idade dos clientes -----------------------

delimiter $$
create function MédiaIdadeClientes() returns decimal(5,2) deterministic no sql reads sql data
begin
    declare media_idade decimal(5,2);
    select avg(year(curdate()) - year(dataNasc)) into media_idade from cliente;
    return media_idade ;
end $$
delimiter ;

select MédiaIdadeClientes() as Média_Idade;


-- ------------------------ Função para obter o valor total de vendas --------------------------

delimiter $$
create function ValorTotalVendas() returns decimal(10,2) deterministic no sql reads sql data
begin
    declare total_vendas decimal(10,2);
    select sum(valor) into total_vendas from venda;
    return total_vendas;
end $$
delimiter ;

select ValorTotalVendas() as Total_Vendas;


-- ---------------------------- Função para listar todos os produtos em estoque ---------------------------

delimiter $$
create function QuantidadeProdutoNoEstoquePorId(p_idProduto INT ) returns int deterministic no sql reads sql data
begin
    declare qtd_estoque int;
    select qntd into qtd_estoque
    from Produto
    where idProduto = p_idProduto;
    if qtd_estoque is null then
        set qtd_estoque = 0;
    end if;
    return qtd_estoque;
end $$
delimiter ;

select QuantidadeProdutoNoEstoquePorId('10') as QuantidadeEmEstoqueDaCamisa_IloveDilf;


-- ----------------------- Função para obter a quantidade total de produtos --------------------------

delimiter $$
create function TotalProdutos() returns int deterministic no sql reads sql data
begin
    declare qtd_total_produtos int;
    select sum(qntd) into qtd_total_produtos from produto;
    return qtd_total_produtos;
end $$
delimiter ;

select TotalProdutos() as Total_de_produtos;


-- -------------------------- Função para total de vendar em um único produto ------------------------

delimiter $$
create function calcular_total_vendas_periodo(data_inicio_param datetime, data_fim_param datetime) returns decimal(10,2) deterministic no sql reads sql data
begin
    declare total_vendas_periodo decimal(10,2);
    select sum(v.valor) into total_vendas_periodo
    from venda v
    where v.datavenda between data_inicio_param and data_fim_param;
    return total_vendas_periodo;
end $$
delimiter ;

select CalcularTotalVendasPeriodo('2023-02-03 00:00:00', '2023-05-03 23:59:59') as Total_vendas_periodo;


-- ----------------------------- Função valor total de comprar de um cliente -----------------------------
delimiter $$
create function TotalComprasPorCliente(
     p_idCliente INT
) returns decimal(10,2) deterministic no sql reads sql data
begin
    declare total_compras decimal(10,2);

    select sum(V.valor) into total_compras
    from Venda V
    where V.Cliente_idCliente = p_idCliente;

    if total_compras is null then
        set total_compras = 0.00;
    end if;

    return total_compras;
end $$
delimiter ;


select TotalComprasPorCliente('17') as ValorTotalComprasPelaBeyoncé;


-- --------------- Função para saber total de compras realizadas com um único fornecedor -----------------

delimiter $$
create function TotalComprasComFornecedor(
     p_idFornecedor INT
) returns decimal(10,2) deterministic no sql reads sql data
begin
    declare total_compras decimal(10,2);

    select sum(C.valor) into total_compras
    from compra C
    where C.Fornecedor_idFornecedor = p_idFornecedor;

    if total_compras is null then
        set total_compras = 0.00;
    end if;

    return total_compras;
end $$
delimiter ;


select TotalComprasComFornecedor('9') as total_compras_fornecedor_intimusPeças;


-- ---------------- Ver functions ---------------------

show function status where Db = 'mydb';



