CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTOINCREMENT,
    cpf VARCHAR(11),
    nome VARCHAR(100),
    telefone VARCHAR(11),
    email VARCHAR(100),
    endereco VARCHAR(100),
);

CREATE TABLE laboratorio (
    id_laboratorio INT PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100)
    email VARCHAR(100),
    endereco VARCHAR(100),
);

CREATE TABLE fornecedor (
    id_fornecedor INT PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE funcionario  (
    id_funcionario INT PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100),
    login text,
    senha text, 
    nivel_acesso INT
);   

CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTOINCREMENT,
    id_cliente INT, FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    id_funcionario INT, FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario),
);

CREATE TABLE estoque (
    id_estoque INT PRIMARY KEY AUTOINCREMENT,
    quantidade INT
);

CREATE TABLE produtoVenda (
    id_produtoVenda INT PRIMARY KEY AUTOINCREMENT,
    id_venda INT, FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    id_produto INT, FOREIGN KEY (id_produto) REFERENCES produto(id_produto), 
    quantidade INT
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTOINCREMENT,
    id_estoque INT, FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque),
    id_laboratorio INT, FOREIGN KEY (id_laboratorio) REFERENCES laboratorio(id_laboratorio),
    necessitaReceita BOOLEAN,
    categoria text
);

CREATE TABLE receitaMedica (
    id_receitaMedica INT PRIMARY KEY AUTOINCREMENT,
    id_cliente INT, FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    cm_medico INT, 
    data DATE
);

CREATE TABLE produtoReceita (
    id_produtoReceita INT PRIMARY KEY AUTOINCREMENT,
    id_receitaMedica INT, FOREIGN KEY (id_receitaMedica) REFERENCES receitaMedica(id_receitaMedica),
    id_produto INT, FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    quantidade INT
);

CREATE TABLE produtoFornecedor (
    id_produtoFornecedor INT PRIMARY KEY AUTOINCREMENT,
    id_fornecedor INT,  FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor),
    id_produto INT, FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    preco REAL
);