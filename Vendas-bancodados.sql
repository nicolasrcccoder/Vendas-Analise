-- Criar o banco
CREATE DATABASE LojaJogos;
USE LojaJogos;

-- Tabela Estado (sem dependência)
CREATE TABLE Estado (
  idEstado INT IDENTITY(1,1) PRIMARY KEY,
  estado VARCHAR(100),
  cidade VARCHAR(100)
);

-- Tabela Loja (depende de Estado)
CREATE TABLE Loja (
  idLoja INT IDENTITY(1,1) PRIMARY KEY,
  nome VARCHAR(100),
  EstadoID INT,
  FOREIGN KEY (EstadoID) REFERENCES Estado(idEstado)
);

-- Tabela Produto (depende de Loja)
CREATE TABLE Produto (
  idProduto INT IDENTITY(1,1) PRIMARY KEY,
  nome VARCHAR(100),
  marca VARCHAR(100),
  preco FLOAT,
  LojaID INT,
  FOREIGN KEY (LojaID) REFERENCES Loja(idLoja)
);

-- Tabela Cliente (sem dependência)
CREATE TABLE Cliente (
  idCliente INT IDENTITY(1,1) PRIMARY KEY,
  nome VARCHAR(100),
  cpf VARCHAR(15)
);

-- Tabela Pagamento (agora com FK certa)
CREATE TABLE Pagamento (
  idPagamento INT IDENTITY(1,1) PRIMARY KEY,
  tipo VARCHAR(100),
  ClienteID INT,
  CONSTRAINT chk_tipo CHECK (tipo IN ('dinheiro', 'cartão', 'pix')),
  FOREIGN KEY (ClienteID) REFERENCES Cliente(idCliente)
);

-- Tabela Compra (relaciona Cliente e Produto)
CREATE TABLE Compra (
  idCompra INT IDENTITY(1,1) PRIMARY KEY,
  ClienteID INT,
  ProdutoID INT,
  DataCompra DATE,
  Quantidade INT,
  FOREIGN KEY (ClienteID) REFERENCES Cliente(idCliente),
  FOREIGN KEY (ProdutoID) REFERENCES Produto(idProduto)
);

-- Estado
INSERT INTO Estado (estado, cidade) VALUES
('Rio Grande do Sul', 'Porto Alegre'),
('Rio de Janeiro', 'Rio de Janeiro'),
('Minas Gerais', 'Belo Horizonte'),
('Santa Catarina', 'Florianópolis'),
('Paraná', 'Curitiba');

-- Loja
INSERT INTO Loja (nome, EstadoID) VALUES
('Loja Central', 1),
('Loja Mar', 2),
('Loja Minas', 3),
('Loja Carvalho', 4),
('Loja Obaoba', 5);

-- Cliente
INSERT INTO Cliente (nome, cpf) VALUES
('João Silva', '12345678901'),
('Maria Oliveira', '10987654321'),
('Carlos Pereira', '11223344556'),
('Ricardo Ohara', '13256544557'),
('Julia Silvia', '22223344742');
INSERT INTO Cliente (nome, cpf) VALUES ('Ana Paula', '18591587564');
INSERT INTO Cliente (nome, cpf) VALUES ('Bruno Souza', '85282646563');
INSERT INTO Cliente (nome, cpf) VALUES ('Camila Castro', '48452049151');
INSERT INTO Cliente (nome, cpf) VALUES ('Diego Martins', '66616291774');
INSERT INTO Cliente (nome, cpf) VALUES ('Elaine Rocha', '66709259563');
INSERT INTO Cliente (nome, cpf) VALUES ('Fabio Lima', '58830386583');
INSERT INTO Cliente (nome, cpf) VALUES ('Gabriela Alves', '96919983613');
INSERT INTO Cliente (nome, cpf) VALUES ('Henrique Costa', '25852428811');
INSERT INTO Cliente (nome, cpf) VALUES ('Isabela Fernandes', '72688905431');
INSERT INTO Cliente (nome, cpf) VALUES ('Jorge Nunes', '96899413979');
INSERT INTO Cliente (nome, cpf) VALUES ('Karina Duarte', '71915593732');
INSERT INTO Cliente (nome, cpf) VALUES ('Lucas Mendes', '64894946044');
INSERT INTO Cliente (nome, cpf) VALUES ('Marina Teixeira', '34688917790');
INSERT INTO Cliente (nome, cpf) VALUES ('Nicolas Ribeiro', '32485878687');
INSERT INTO Cliente (nome, cpf) VALUES ('Olívia Lopes', '42689790519');

-- Pagamento (agora referenciando os clientes certos)
INSERT INTO Pagamento (tipo, ClienteID) VALUES
('dinheiro', 1),
('cartão', 2),
('pix', 3),
('cartão', 4),
('pix', 5);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('pix', 6);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('pix', 7);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('dinheiro', 8);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('cartão', 9);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('pix', 10);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('dinheiro', 11);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('pix', 12);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('dinheiro', 13);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('pix', 14);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('cartão', 15);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('cartão', 16);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('pix', 17);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('pix', 18);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('dinheiro', 19);
INSERT INTO Pagamento (tipo, ClienteID) VALUES ('pix', 20);


-- Produto
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES
('Controle Xbox', 'Microsoft', 250.00, 1),
('Jogo FC25', 'EA Sports', 199.99, 2),
('Headset Gamer', 'HyperX', 350.50, 3),
('Super Mario', 'Nintendo', 400.50, 3),
('PlayStation 5', 'Sony', 3500.50, 3);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('Teclado Mecânico', 'Redragon', 1835.00, 4);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('Mouse Gamer', 'Logitech', 3619.15, 5);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('Monitor 144Hz', 'AOC', 3231.33, 3);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('Cadeira Gamer', 'ThunderX', 847.98, 5);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('HD Externo 1TB', 'Seagate', 4248.21, 2);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('Notebook Gamer', 'Dell', 4060.99, 4);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('SSD 1TB', 'Kingston', 3290.84, 3);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('Jogo GTA V', 'Rockstar', 188.12, 5);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('Jogo Elden Ring', 'FromSoftware', 234.45, 2);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('Volante Logitech G29', 'Logitech', 4253.78, 4);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('Controle PS5', 'Sony', 3746.35, 1);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('Jogo The Last of Us', 'Naughty Dog', 267.33, 2);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('Webcam Full HD', 'Microsoft', 1982.92, 3);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('Microfone USB', 'Blue', 3920.61, 1);
INSERT INTO Produto (nome, marca, preco, LojaID) VALUES ('Placa de Vídeo RTX 4060', 'NVIDIA', 4453.42, 2);

-- Compra
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES
(1, 1, '2025-07-10', 1),
(2, 2, '2025-07-11', 2),
(3, 3, '2025-07-02', 1),
(4, 4, '2025-02-22', 3),
(5, 5, '2025-04-20', 2);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (6, 5, '2025-07-06', 2);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (6, 3, '2025-06-09', 3);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (7, 2, '2025-01-08', 2);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (8, 1, '2025-03-05', 3);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (9, 3, '2025-05-21', 2);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (10, 4, '2025-05-06', 2);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (11, 1, '2025-06-30', 2);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (11, 2, '2025-02-10', 3);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (12, 5, '2025-02-28', 1);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (13, 4, '2025-07-05', 3);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (14, 3, '2025-03-29', 2);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (14, 5, '2025-06-02', 2);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (15, 1, '2025-03-18', 1);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (15, 3, '2025-05-01', 3);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (16, 2, '2025-04-01', 1);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (17, 5, '2025-05-25', 2);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (18, 2, '2025-01-20', 3);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (19, 1, '2025-03-14', 1);
INSERT INTO Compra (ClienteID, ProdutoID, DataCompra, Quantidade) VALUES (20, 4, '2025-06-11', 3);


select * from Pagamento;
select * from Loja;
select * from Produto;
select * from Cliente;
select * from Compra;
select * from Estado
