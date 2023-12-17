
-- -------------------------- PROCEDURE ----------------------------------

-- --------------------------- Cadastrar Funcionários ----------------------

delimiter $$

CREATE PROCEDURE CadastrarFuncionario(
    IN p_CPF VARCHAR(15),
    IN p_nome VARCHAR(60),
    IN p_nomeSocial VARCHAR(60),
    IN p_dataNasc DATE,
    IN p_genero VARCHAR(5),
    IN p_email VARCHAR(45),
    IN p_dataAdm DATETIME,
    IN p_dataDemi DATETIME,
    IN p_uf CHAR(2),
    IN p_cidade VARCHAR(45),
    IN p_bairro VARCHAR(60),
    IN p_cep INT(9),
    IN p_rua VARCHAR(45),
    IN p_numero VARCHAR(10),
    IN p_comp VARCHAR(45),
    IN p_numeroTelefone VARCHAR(15)
)
BEGIN
    DECLARE novoFuncionarioID INT;

    START TRANSACTION;

    INSERT INTO funcionario (CPF, nome, nomeSocial, dataNasc, genero, email, dataAdm, dataDemi)
    VALUES (p_CPF, p_nome, p_nomeSocial, p_dataNasc, p_genero, p_email, p_dataAdm, p_dataDemi);

    SET novoFuncionarioID = LAST_INSERT_ID();

    INSERT INTO enderecoFunc (uf, cidade, bairro, cep, rua, numero, comp, funcionario_idfuncionario)
    VALUES (p_uf, p_cidade, p_bairro, p_cep, p_rua, p_numero, p_comp, novoFuncionarioID);

    INSERT INTO telefone (numero, funcionario_idfuncionario)
    VALUES (p_numeroTelefone, novoFuncionarioID);

    COMMIT;
END $$

delimiter ;


-- ------------------ Cadastrar Fornecedores ------------------------

delimiter $$

CREATE PROCEDURE CadastrarFornecedor(
    IN p_CNPJ VARCHAR(17),
    IN p_nome VARCHAR(45),
    IN p_email VARCHAR(45),
    IN p_uf CHAR(2),
    IN p_cidade VARCHAR(45),
    IN p_bairro VARCHAR(60),
    IN p_cep INT(9),
    IN p_rua VARCHAR(45),
    IN p_numero VARCHAR(10),
    IN p_comp VARCHAR(45)
)
BEGIN
    DECLARE novoFornecedorID INT;

    START TRANSACTION;

    INSERT INTO Fornecedor (CNPJ, nome, email)
    VALUES (p_CNPJ, p_nome, p_email);

    SET novoFornecedorID = LAST_INSERT_ID();

    INSERT INTO enderecoFornec (uf, cidade, bairro, cep, rua, numero, comp, Fornecedor_idFornecedor)
    VALUES (p_uf, p_cidade, p_bairro, p_cep, p_rua, p_numero, p_comp, novoFornecedorID);

    COMMIT;
END $$

delimiter ;

-- -------------------------- Cadastrar Produtos ----------------------------

delimiter &&

CREATE PROCEDURE CadastroProduto(
    IN p_nomeProduto VARCHAR(45),
    IN p_cor VARCHAR(45),
    IN p_tamanho VARCHAR(45),
    IN p_marca VARCHAR(45),
    IN p_quantidade INT,
    IN p_nomeCategoria VARCHAR(70)
)
BEGIN
    DECLARE novoProdutoID INT;
    DECLARE novaCategoriaID INT;

    START TRANSACTION;

    INSERT INTO Produto (nome, cor, tam, marca, qntd)
    VALUES (p_nomeProduto, p_cor, p_tamanho, p_marca, p_quantidade);

    SET novoProdutoID = LAST_INSERT_ID();

    SELECT idCateogoria INTO novaCategoriaID
    FROM Categoria
    WHERE nome = p_nomeCategoria;

    IF novaCategoriaID IS NULL THEN
        INSERT INTO Categoria (nome, Produto_idProduto)
        VALUES (p_nomeCategoria, novoProdutoID);
    ELSE
        UPDATE Categoria
        SET Produto_idProduto = novoProdutoID
        WHERE idCateogoria = novaCategoriaID;
    END IF;

    COMMIT;
END $$

delimiter ;

-- ------------------------------- Cadastro de Clientes -------------------------

delimiter $$

CREATE PROCEDURE CadastrarCliente(
    IN p_CPF VARCHAR(15),
    IN p_nome VARCHAR(60),
    IN p_email VARCHAR(45),
    IN p_dataNasc DATE,
    IN p_genero VARCHAR(5),
    IN p_nomeSocial VARCHAR(45),
    IN p_telefone VARCHAR(15),
    IN p_uf CHAR(2),
    IN p_cidade VARCHAR(45),
    IN p_bairro VARCHAR(60),
    IN p_cep INT(9),
    IN p_rua VARCHAR(45),
    IN p_numero VARCHAR(10),
    IN p_comp VARCHAR(45)
)
BEGIN
    DECLARE novoClienteID INT;

    START TRANSACTION;

    INSERT INTO Cliente (CPF, nome, email, dataNasc, genero, nomeSocial, telefone)
    VALUES (p_CPF, p_nome, p_email, p_dataNasc, p_genero, p_nomeSocial, p_telefone);

    SET novoClienteID = LAST_INSERT_ID();

    INSERT INTO enderecoCli (uf, cidade, bairro, cep, rua, numero, comp, Cliente_idCliente)
    VALUES (p_uf, p_cidade, p_bairro, p_cep, p_rua, p_numero, p_comp, novoClienteID);

    COMMIT;
END $$

delimiter ;

-- ------------------------ Buscar Cliente por ID ----------------------------

delimiter $$

CREATE PROCEDURE BuscarClientePorID(
    IN p_idCliente INT
)
BEGIN
    SELECT *
    FROM Cliente c
    LEFT JOIN enderecoCli ec ON c.idCliente = ec.Cliente_idCliente
    WHERE c.idCliente = p_idCliente;
END $$

delimiter ;

-- 
select * from cliente;
--

-- --------------------------- Buscar cliente por e-mail ou CPF ------------------------

delimiter $$

CREATE PROCEDURE BuscarClientePorInfo(
    IN p_info VARCHAR(45)
)
BEGIN
    SELECT *
    FROM Cliente
    WHERE email = p_info
    OR CPF = p_info;
    
END $$

delimiter ;

--
select * from cliente;
-- 

-- --------------------- Busca de venda por CPF funcionário ou CPF cliente --------------------------

delimiter $$

CREATE PROCEDURE BuscarVendaPorCPF(
    IN p_CPF VARCHAR(15)
)
BEGIN
    SELECT V.*
    FROM Venda V
    INNER JOIN Cliente C ON V.Cliente_idCliente = C.idCliente
    INNER JOIN funcionario F ON V.funcionario_idfuncionario = F.idfuncionario
    WHERE C.CPF = p_CPF OR F.CPF = p_CPF;
END $$

delimiter ;

--
select * from funcionario;
select * from cliente;
--

-- --------------------------- Busca por produto por nome parcial -------------------------

delimiter $$

CREATE PROCEDURE BuscarProduto(
    IN p_nomeParcial VARCHAR(45)
)
BEGIN
    SELECT *
    FROM Produto
    WHERE nome LIKE CONCAT('%', p_nomeParcial, '%');
END $$

delimiter ;