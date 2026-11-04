CREATE TABLE setor (
id_setor INT PRIMARY KEY AUTO_INCREMENT,
nome_setor VARCHAR(45) NOT NULL
);
CREATE TABLE Restaurante (
id_restaurante INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(100) NOT NULL,
CNPJ VARCHAR(18) NOT NULL UNIQUE,
Telefone VARCHAR(20),
Endereco VARCHAR(150)
);
CREATE TABLE Funcionarios (
id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(100) NOT NULL,
CPF VARCHAR(14) NOT NULL UNIQUE,
Cargo VARCHAR(45) NOT NULL,
data_admissao DATE NOT NULL
);
CREATE TABLE Gerente (
id_funcionario INT PRIMARY KEY,
id_setor INT NOT NULL,
FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario) ON DELETE
CASCADE,
FOREIGN KEY (id_setor) REFERENCES setor(id_setor)
);
CREATE TABLE Cozinheiro (
id_funcionario INT PRIMARY KEY,
id_setor INT NOT NULL,
especialidade VARCHAR(45),
FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario) ON DELETE
CASCADE,
FOREIGN KEY (id_setor) REFERENCES setor(id_setor)
);
CREATE TABLE Garcom (
id_funcionario INT PRIMARY KEY,
id_setor INT NOT NULL,
FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario) ON DELETE
CASCADE,
FOREIGN KEY (id_setor) REFERENCES setor(id_setor)
);
CREATE TABLE Atendente (
id_funcionario INT PRIMARY KEY,
id_setor INT NOT NULL,
FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario) ON DELETE
CASCADE,
FOREIGN KEY (id_setor) REFERENCES setor(id_setor)
);
CREATE TABLE Bebida (
id_bebida INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
preco DECIMAL(10,2) NOT NULL,
descricao TEXT
);
CREATE TABLE Prato (
id_prato INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
preco DECIMAL(10,2) NOT NULL,
descricao TEXT,
categoria VARCHAR(45) NOT NULL DEFAULT 'Prato Principal',
temperatura VARCHAR(20) NOT NULL DEFAULT 'Quente',
eh_vegetariano BOOLEAN NOT NULL DEFAULT FALSE,
tempo_preparo_min INT NOT NULL DEFAULT 20
);
CREATE TABLE Pedido (
id_pedido INT PRIMARY KEY AUTO_INCREMENT,
id_restaurante INT NOT NULL,
id_garcom INT NOT NULL,
id_cozinheiro INT,
mesa VARCHAR(10) NOT NULL,
status VARCHAR(45) NOT NULL DEFAULT 'Pendente',
data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_restaurante) REFERENCES Restaurante(id_restaurante),
FOREIGN KEY (id_garcom) REFERENCES Garcom(id_funcionario),
FOREIGN KEY (id_cozinheiro) REFERENCES Cozinheiro(id_funcionario)
);
CREATE TABLE Pedido_Prato (
id_pedido_prato INT PRIMARY KEY AUTO_INCREMENT,
id_pedido INT NOT NULL,
id_prato INT NOT NULL,
quantidade INT NOT NULL DEFAULT 1,
preco_unitario DECIMAL(10,2) NOT NULL,
observacao VARCHAR(255),
FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido) ON DELETE CASCADE,
FOREIGN KEY (id_prato) REFERENCES Prato(id_prato)
);
CREATE TABLE Pedido_Bebida (
id_pedido_bebida INT PRIMARY KEY AUTO_INCREMENT,
id_pedido INT NOT NULL,
id_bebida INT NOT NULL,
quantidade INT NOT NULL DEFAULT 1,
preco_unitario DECIMAL(10,2) NOT NULL,
observacao VARCHAR(255),
FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido) ON DELETE CASCADE,
FOREIGN KEY (id_bebida) REFERENCES Bebida(id_bebida)
);
CREATE TABLE Fornecedor (
id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
CNPJ VARCHAR(18) NOT NULL UNIQUE,
Nome_fantasia VARCHAR(100) NOT NULL,
Telefone VARCHAR(20)
);
CREATE TABLE Fornecimento (
id_fornecimento INT PRIMARY KEY AUTO_INCREMENT,
id_fornecedor INT NOT NULL,
id_restaurante INT NOT NULL,
data_fornecimento DATE NOT NULL,
descricao VARCHAR(255),
FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor),
FOREIGN KEY (id_restaurante) REFERENCES Restaurante(id_restaurante)
);
INSERT INTO setor (nome_setor) VALUES
('Cozinha Quente'), ('Cozinha Fria e Saladas'), ('Confeitaria e Sobremesas'), ('Salão Principal'),
('Salão Superior / Mezanino'), ('Bar e Bebidas'), ('Gerência Geral'), ('Administração e Financeiro'),
('Recursos Humanos'), ('Estoque de Alimentos Secos'), ('Estoque de Bebidas e Frios'),
('Higienização e Limpeza'),
('Manutenção Predial'), ('Atendimento Delivery'), ('Drive-Thru'), ('Recepção e Host'),
('Segurança Patrimonial'), ('Marketing e Eventos'), ('Tecnologia e Sistemas'), ('Qualidade e
Higiene (Sanitária)');
INSERT INTO Restaurante (Nome, CNPJ, Telefone, Endereco) VALUES
('Sabor & Arte Batel', '12.345.678/0001-90', '(41) 3333-1111', 'Av. Batel, 1230 - Batel'),
('Sabor & Arte Centro', '12.345.678/0002-71', '(41) 3333-2222', 'Rua XV de Novembro, 450 -
Centro'),
('Sabor & Arte Ecoville', '12.345.678/0003-52', '(41) 3333-3333', 'Rua Prof. Pedro Viriato Parigot
de Souza, 600 - Ecoville'),
('Sabor & Arte Cabral', '12.345.678/0004-33', '(41) 3333-4444', 'Av. Paraná, 890 - Cabral'),
('Sabor & Arte Juvevê', '12.345.678/0005-14', '(41) 3333-5555', 'Rua Itupava, 1200 - Juvevê'),
('Sabor & Arte Portão', '12.345.678/0006-05', '(41) 3333-6666', 'Rua República Argentina, 3400 -
Portão'),
('Sabor & Arte Santa Felicidade', '12.345.678/0007-86', '(41) 3333-7777', 'Av. Manoel Ribas, 4500
- Santa Felicidade'),
('Sabor & Arte Alto da XV', '12.345.678/0008-67', '(41) 3333-8888', 'Rua Almirante Tamandaré,
500 - Alto da XV'),
('Sabor & Arte Água Verde', '12.345.678/0009-48', '(41) 3333-9999', 'Av. República Argentina,
1200 - Água Verde'),
('Sabor & Arte Bacacheri', '12.345.678/0010-82', '(41) 3434-1111', 'Av. Erasto Gaertner, 900 -
Bacacheri'),
('Sabor & Arte Boqueirão', '12.345.678/0011-63', '(41) 3434-2222', 'Rua Marechal Floriano
Peixoto, 7800 - Boqueirão'),
('Sabor & Arte CIC', '12.345.678/0012-44', '(41) 3434-3333', 'Rua Senador Salgado Filho, 200 -
CIC'),
('Sabor & Arte Hauer', '12.345.678/0013-25', '(41) 3434-4444', 'Rua Coronel Luiz José dos
Santos, 500 - Hauer'),
('Sabor & Arte Bigorrilho', '12.345.678/0014-06', '(41) 3434-5555', 'Alameda Dr. Carlos de
Carvalho, 1800 - Bigorrilho'),
('Sabor & Arte Mercês', '12.345.678/0015-97', '(41) 3434-6666', 'Av. Iguaçu, 2300 - Mercês'),
('Sabor & Arte Rebouças', '12.345.678/0016-78', '(41) 3434-7778', 'Rua Engenheiros Rebouças,
1500 - Rebouças'),
('Sabor & Arte Ahú', '12.345.678/0017-59', '(41) 3434-8889', 'Rua Mateus Leme, 2100 - Ahú'),
('Sabor & Arte Prado Velho', '12.345.678/0018-30', '(41) 3434-9990', 'Rua Imaculada Conceição,
1155 - Prado Velho'),
('Sabor & Arte Campo Comprido', '12.345.678/0019-10', '(41) 3535-1112', 'Rua Monsenhor Ivo
Zanlorenzi, 3000 - Campo Comprido'),
('Sabor & Arte Pinheirinho', '12.345.678/0020-51', '(41) 3535-2223', 'Av. Winston Churchill, 2200 -
Pinheirinho');
-- Funcionarios (20 registros - Superclasse)
INSERT INTO Funcionarios (Nome, CPF, Cargo, data_admissao) VALUES
('Carlos Eduardo Silva', '111.222.333-01', 'Gerente', '2022-01-15'),
('Ana Paula Souza', '111.222.333-02', 'Cozinheiro', '2022-03-10'),
('Roberto Santos', '111.222.333-03', 'Cozinheiro', '2022-05-20'),
('Mariana Lima', '111.222.333-04', 'Garcom', '2022-06-01'),
('Lucas Oliveira', '111.222.333-05', 'Garcom', '2022-08-12'),
('Beatriz Mendes', '111.222.333-06', 'Atendente', '2023-01-10'),
('Marcos Vinicius', '111.222.333-07', 'Gerente', '2023-02-14'),
('Juliana Alves', '111.222.333-08', 'Cozinheiro', '2023-03-19'),
('Gabriel Costa', '111.222.333-09', 'Garcom', '2023-04-22'),
('Fernanda Rocha', '111.222.333-10', 'Atendente', '2023-05-30'),
('Bruno Ribeiro', '111.222.333-11', 'Gerente', '2023-06-11'),
('Camila Martins', '111.222.333-12', 'Cozinheiro', '2023-07-15'),
('Rodrigo Cardoso', '111.222.333-13', 'Garcom', '2023-08-18'),
('Tatiane Freitas', '111.222.333-14', 'Atendente', '2023-09-25'),
('Thiago Moreira', '111.222.333-15', 'Cozinheiro', '2023-10-05'),
('Larissa Duarte', '111.222.333-16', 'Garcom', '2023-11-12'),
('Renato Antunes', '111.222.333-17', 'Gerente', '2024-01-08'),
('Vanessa Nogueira', '111.222.333-18', 'Cozinheiro', '2024-02-14'),
('Diego Monteiro', '111.222.333-19', 'Garcom', '2024-03-20'),
('Patrícia Ramos', '111.222.333-20', 'Atendente', '2024-04-10');
INSERT INTO Gerente (id_funcionario, id_setor) VALUES
(1, 7), (7, 7), (11, 8), (17, 8);
INSERT INTO Cozinheiro (id_funcionario, id_setor, especialidade) VALUES
(2, 1, 'Massas'), (3, 1, 'Grelhados'), (8, 2, 'Saladas'),
(12, 1, 'Molhos'), (15, 3, 'Confeitaria'), (18, 1, 'Carnes');
INSERT INTO Garcom (id_funcionario, id_setor) VALUES
(4, 4), (5, 4), (9, 5), (13, 4), (16, 5), (19, 4);
INSERT INTO Atendente (id_funcionario, id_setor) VALUES
(6, 6), (10, 14), (14, 14), (20, 6);
INSERT INTO Bebida (nome, preco, descricao) VALUES
('Suco Natural de Laranja 500ml', 12.50, 'Suco natural feito na hora'),
('Refrigerante Coca-Cola Lata 350ml', 7.00, 'Lata trincando de gelada'),
('Água Mineral sem Gás 500ml', 5.00, 'Garrafa de água mineral'),
('Cerveja Artesanal IPA 500ml', 22.00, 'Cerveja artesanal local'),
('Suco de Morango com Leite 400ml', 14.00, 'Suco cremoso de morango'),
('Refrigerante Guaraná Antarctica Lata', 7.00, 'Lata 350ml'),
('Água Mineral com Gás 500ml', 5.50, 'Garrafa de água com gás'),
('Cerveja Heineken Long Neck', 13.00, 'Cerveja Pilsen 330ml'),
('Chá Gelado de Pêssego 400ml', 9.00, 'Chá gelado natural'),
('Vinho Tinto Garzon Tannat Taça', 28.00, 'Taça de vinho uruguaio'),
('Drink Caipirinha de Limão', 18.50, 'Cachaça, limão e açúcar'),
('Drink Mojito Tradicional', 21.00, 'Rum, hortelã, limão e soda'),
('Água Tônica Schweppes Lata', 7.50, 'Lata 350ml'),
('Refrigerante Sprite Lata', 7.00, 'Lata 350ml'),
('Suco Verde Detox 400ml', 15.00, 'Couve, limão, maçã e gengibre'),
('Vinho Branco Chardonnay Taça', 26.00, 'Taça de vinho branco gelado'),
('Cerveja Corona Extra Long Neck', 14.00, 'Cerveja mexicana 330ml'),
('Chocolate Quente Cremoso', 12.00, 'Chocolate quente europeu'),
('Café Expresso Curto', 6.00, 'Café 100% arábica'),
('Smoothie de Frutas Vermelhas', 16.00, 'Mix de frutas batidas com iogurte');
INSERT INTO Prato (nome, preco, descricao, categoria, temperatura, eh_vegetariano,
tempo_preparo_min) VALUES
('Filé Mignon ao Molho Madeira', 68.90, 'Acompanha arroz branco e batata sauté', 'Prato
Principal', 'Quente', FALSE, 25),
('Massa Fettuccine Alfredo', 49.00, 'Massa fresca com molho cremoso de queijo parmesão',
'Prato Principal', 'Quente', TRUE, 20),
('Salada Caesar com Frango', 38.00, 'Alface, frango grelhado, croutons e molho caesar',
'Entrada', 'Frio', FALSE, 15),
('Hambúrguer Artesanal da Casa', 35.00, 'Pão brioche, carne 180g, cheddar e bacon com fritas',
'Prato Principal', 'Quente', FALSE, 20),
('Salmão Grelhado ao Molho de Alcaparras', 79.90, 'Acompanha legumes na manteiga', 'Prato
Principal', 'Quente', FALSE, 30),
('Risoto de Funghi Secchi', 62.00, 'Arroz arbóreo com mix de cogumelos', 'Prato Principal',
'Quente', TRUE, 25),
('Picanha na Chapa para Dois', 120.00, 'Acompanha arroz, feijão, farofa e vinagrete', 'Prato
Principal', 'Quente', FALSE, 35),
('Frango à Parmegiana', 52.00, 'Filé de frango empanado, molho de tomate e queijo derretido',
'Prato Principal', 'Quente', FALSE, 25),
('Nhoque de Mandioquinha ao Sugo', 45.00, 'Nhoque artesanal com molho de tomates frescos',
'Prato Principal', 'Quente', TRUE, 20),
('Strogonoff de Frango', 46.00, 'Acompanha arroz branco e batata palha', 'Prato Principal',
'Quente', FALSE, 20),
('Escondidinho de Carne Seca', 54.00, 'Purê de mandioca recheado com carne seca desfiada',
'Prato Principal', 'Quente', FALSE, 25),
('Costelinha de Porco ao Barbecue', 65.00, 'Acompanha batatas rústicas', 'Prato Principal',
'Quente', FALSE, 30),
('Salada Tropical com Manga e Camarão', 59.00, 'Mix de folhas, camarões grelhados e fatias de
manga', 'Entrada', 'Frio', FALSE, 15),
('Lasanha à Bolonhesa', 53.00, 'Camadas de massa, molho à bolonhesa e presunto/queijo',
'Prato Principal', 'Quente', FALSE, 30),
('Tartare de Salmão Fresco', 48.00, 'Entrada fria de salmão batido na ponta da faca', 'Entrada',
'Frio', FALSE, 10),
('Camarão na Moranga', 135.00, 'Camarões ao molho cremoso servidos dentro da moranga',
'Prato Principal', 'Quente', FALSE, 40),
('Carpaccio de Carne com Alcaparras', 42.00, 'Finas fatias de carne com molho mostarda e
parmesão', 'Entrada', 'Frio', FALSE, 10),
('Petit Gâteau de Chocolate com Sorvete', 26.00, 'Sobremesa quente com sorvete de creme',
'Sobremesa', 'Quente', TRUE, 12),
('Pudim de Leite Condensado Caseiro', 16.00, 'Pudim tradicional com calda de caramelo',
'Sobremesa', 'Gelado', TRUE, 5),
('Cheesecake de Frutas Vermelhas', 24.00, 'Torta doce cremosa com calda de amoras e
framboesas', 'Sobremesa', 'Gelado', TRUE, 5);
INSERT INTO Fornecedor (CNPJ, Nome_fantasia, Telefone) VALUES
('98.765.432/0001-10', 'Hortifruti Distribuidora PR', '(41) 3456-7890'),
('87.654.321/0001-20', 'Carnes & Cortes Nobres', '(41) 3567-8901'),
('76.543.210/0001-30', 'Laticínios Parmalat Sul', '(41) 3678-9012'),
('65.432.109/0001-40', 'Bebidas Ambev Curitiba', '(41) 3789-0123'),
('54.321.098/0001-50', 'Panificadora Trigo Dourado', '(41) 3890-1234'),
('43.210.987/0001-60', 'Embalagens e Descartáveis Eco', '(41) 3901-2345'),
('32.109.876/0001-70', 'Peixaria e Frutos do Mar Atlântico', '(41) 3012-3456'),
('21.098.765/0001-80', 'Grãos e Cereais Bom Jesus', '(41) 3123-4567'),
('10.987.654/0001-90', 'Temperos e Especiarias do Oriente', '(41) 3234-5678'),
('09.876.543/0001-01', 'Café e Grãos Especiais', '(41) 3345-6789'),
('11.223.344/0001-11', 'Limpeza Total Produtos Profissionais', '(41) 3456-8900'),
('22.334.455/0001-22', 'Açúcar e Derivados Cristal', '(41) 3567-9011'),
('33.445.566/0001-33', 'Frutas Exóticas Importadas', '(41) 3678-0122'),
('44.556.677/0001-44', 'Massas Frescas Italianíssima', '(41) 3789-1233'),
('55.667.788/0001-55', 'Sorvetes e Polpas Artesanal', '(41) 3890-2344'),
('66.778.899/0001-66', 'Óleos e Gorduras Vegetais', '(41) 3901-3455'),
('77.889.900/0001-77', 'Utilidades de Cozinha Industrial', '(41) 3012-4566'),
('88.990.011/0001-88', 'Gás e Combustíveis SulGás', '(41) 3123-5677'),
('99.001.122/0001-99', 'Papelaria e Notas Fiscais Express', '(41) 3234-6788'),
('00.112.233/0001-00', 'Vinhos e Destilados Importados', '(41) 3345-7899');
INSERT INTO Fornecimento (id_fornecedor, id_restaurante, data_fornecimento, descricao)
VALUES
(1, 1, '2026-10-01', 'Entrega semanal de hortifruti'),
(2, 1, '2026-10-02', 'Reposição de carnes nobres'),
(3, 1, '2026-10-03', 'Laticínios e queijos'),
(4, 2, '2026-10-03', 'Lotes de cervejas e refrigerantes'),
(5, 2, '2026-10-04', 'Pães de hambúrguer e brioche'),
(6, 3, '2026-10-04', 'Embalagens biodegradáveis'),
(7, 3, '2026-10-05', 'Salmão fresco e frutos do mar'),
(8, 4, '2026-10-05', 'Arroz arbóreo e grãos'),
(9, 5, '2026-10-06', 'Especiarias e pimentas'),
(10, 6, '2026-10-06', 'Grãos de café especial'),
(11, 7, '2026-10-07', 'Produtos de limpeza industrial'),
(12, 8, '2026-10-07', 'Açúcar refinado e mascavo'),
(13, 9, '2026-10-08', 'Frutas exóticas'),
(14, 10, '2026-10-08', 'Massas frescas congeladas'),
(15, 11, '2026-10-09', 'Polpas de frutas e sorvetes'),
(16, 12, '2026-10-09', 'Óleo de soja e azeite de oliva'),
(17, 13, '2026-10-10', 'Utensílios e panelas'),
(18, 14, '2026-10-10', 'Recarga de cilindros de gás'),
(19, 15, '2026-10-11', 'Bobinas térmicas e suprimentos'),
(20, 16, '2026-10-11', 'Vinhos tintos e brancos');
INSERT INTO Pedido (id_restaurante, id_garcom, id_cozinheiro, mesa, status, data_hora)
VALUES
(1, 4, 2, '5', 'Concluído', '2026-10-12 12:30:00'),
(1, 4, 3, '12', 'Em Preparo', '2026-10-12 13:00:00'),
(1, 5, NULL, '2', 'Pendente', '2026-10-12 13:15:00'),
(2, 9, 8, '8', 'Concluído', '2026-10-12 12:40:00'),
(2, 9, 12, '14', 'Em Preparo', '2026-10-12 13:10:00'),
(3, 13, NULL, '1', 'Pendente', '2026-10-12 13:20:00'),
(3, 13, 15, '3', 'Concluído', '2026-10-12 12:50:00'),
(4, 16, 18, '7', 'Em Preparo', '2026-10-12 13:25:00'),
(4, 16, NULL, '9', 'Pendente', '2026-10-12 13:30:00'),
(5, 4, 2, '10', 'Concluído', '2026-10-12 12:15:00'),
(5, 5, 3, '11', 'Em Preparo', '2026-10-12 13:35:00'),
(6, 9, NULL, '4', 'Pendente', '2026-10-12 13:40:00'),
(6, 13, 8, '6', 'Concluído', '2026-10-12 12:20:00'),
(7, 16, 12, '15', 'Em Preparo', '2026-10-12 13:45:00'),
(7, 4, NULL, '16', 'Pendente', '2026-10-12 13:50:00'),
(8, 5, 15, '18', 'Concluído', '2026-10-12 12:35:00'),
(8, 9, 18, '20', 'Em Preparo', '2026-10-12 13:55:00'),
(9, 13, NULL, '22', 'Pendente', '2026-10-12 14:00:00'),
(10, 16, 2, '25', 'Concluído', '2026-10-12 12:45:00'),
(10, 4, 3, '30', 'Em Preparo', '2026-10-12 14:05:00');
INSERT INTO Pedido_Prato (id_pedido, id_prato, quantidade, preco_unitario, observacao)
VALUES
(1, 1, 1, 68.90, 'Ao ponto'),
(1, 2, 1, 49.00, 'Sem queijo ralado'),
(2, 4, 2, 35.00, 'Bem passado'),
(3, 3, 1, 38.00, 'Molho à parte'),
(4, 5, 1, 79.90, 'Sem alcaparras'),
(4, 6, 1, 62.00, NULL),
(5, 7, 1, 120.00, 'Ponto mal passado'),
(6, 8, 2, 52.00, NULL),
(7, 18, 2, 26.00, 'Servir quente'),
(7, 19, 1, 16.00, NULL),
(8, 9, 1, 45.00, NULL),
(9, 10, 1, 46.00, 'Sem batata palha'),
(10, 11, 2, 54.00, NULL),
(11, 12, 1, 65.00, 'Extra molho barbecue'),
(12, 13, 1, 59.00, NULL),
(13, 14, 2, 53.00, NULL),
(14, 15, 1, 48.00, NULL),
(15, 16, 1, 135.00, NULL),
(16, 17, 1, 42.00, NULL),
(17, 20, 2, 24.00, 'Calda extra');
INSERT INTO Pedido_Bebida (id_pedido, id_bebida, quantidade, preco_unitario, observacao)
VALUES
(1, 1, 2, 12.50, 'Sem açúcar'),
(2, 2, 2, 7.00, 'Trincando de gelada'),
(3, 3, 1, 5.00, 'Sem gelo'),
(3, 4, 1, 22.00, NULL),
(4, 10, 1, 28.00, NULL),
(5, 11, 2, 18.50, 'Com bastante limão'),
(6, 5, 1, 14.00, NULL),
(7, 18, 2, 12.00, 'Com marshmallow'),
(7, 19, 2, 6.00, 'Curto e forte'),
(8, 6, 2, 7.00, NULL),
(9, 7, 1, 5.50, 'Com gelo e limão'),
(10, 8, 2, 13.00, NULL),
(11, 12, 1, 21.00, 'Muito hortelã'),
(12, 13, 1, 7.50, NULL),
(13, 14, 2, 7.00, NULL),
(14, 15, 1, 15.00, 'Sem gengibre'),
(15, 16, 1, 26.00, NULL),
(16, 17, 2, 14.00, 'Com limão no bocal'),
(17, 9, 1, 9.00, NULL),
(18, 20, 2, 16.00, NULL);
#mostra o id do pedido, prato pedido, status, quantidade, mesa e obrservação
SELECT
a.id_pedido,
c.nome as Prato,
a.status,
b.quantidade,
a.mesa,
b.observacao
FROM Pedido a
JOIN Pedido_Prato b ON a.id_pedido = b.id_pedido
JOIN Prato c ON b.id_prato = c.id_prato
ORDER BY a.id_pedido;
#mostra os ids do pedido, bebida pedida, status, quantidade, mesa e obrservação
SELECT
a.id_pedido,
c.nome AS bebida,
a.status,
b.quantidade,
a.mesa,
b.observacao
FROM Pedido a
JOIN Pedido_Bebida b ON a.id_pedido = b.id_pedido
JOIN Bebida c ON b.id_bebida = c.id_bebida
ORDER BY a.id_pedido;
#mostra o funcionario, cargo e qual setor atua
SELECT
f.Nome AS Funcionario,
f.Cargo,
s.nome_setor AS Setor_Atuacao
FROM Funcionarios f
JOIN Garcom g ON f.id_funcionario = g.id_funcionario
JOIN setor s ON g.id_setor = s.id_setor
Order by s.nome_setor ASC;
#mostra qual setor cada atendente atua
SELECT
f.id_funcionario,
f.Nome AS nome_atendente,
f.Cargo,
s.nome_setor
FROM Atendente a
JOIN Funcionarios f ON a.id_funcionario = f.id_funcionario
JOIN setor s ON a.id_setor = s.id_setor;
#mostra o cozinheiro com sua especialidade e o pedido que está fazendo
SELECT
f.Nome AS nome_cozinheiro,
c.especialidade,
p.id_pedido,
p.status AS status_pedido
FROM Cozinheiro c
INNER JOIN Funcionarios f ON c.id_funcionario = f.id_funcionario
LEFT JOIN Pedido p ON c.id_funcionario = p.id_cozinheiro;
#calculao valor gasto da mesa por pedido
SELECT
p.id_pedido,
p.mesa,
SUM(pp.quantidade * pp.preco_unitario) AS conta
FROM Pedido p
JOIN Pedido_Prato pp ON p.id_pedido = pp.id_pedido
JOIN Prato pr ON pp.id_prato = pr.id_prato
GROUP BY p.id_pedido, p.mesa
ORDER BY conta DESC;
#qual a área que o gerente atua
SELECT
f.id_funcionario,
f.Nome AS nome_gerente,
f.CPF,
s.nome_setor AS setor_gerenciado
FROM Gerente ger
JOIN Funcionarios f ON ger.id_funcionario = f.id_funcionario
JOIN setor s ON ger.id_setor = s.id_setor;
#qual restaurante recebeu os fornecimentos e quando
SELECT
r.id_restaurante,
r.Nome AS nome_restaurante,
f.Nome_fantasia AS fornecedor,
fn.data_fornecimento
FROM Restaurante r
LEFT JOIN Fornecimento fn ON r.id_restaurante = fn.id_restaurante
LEFT JOIN Fornecedor f ON fn.id_fornecedor = f.id_fornecedor;
#mostra todos os setores inclusive se não tiver nenhum funcionario
SELECT
s.id_setor,
s.nome_setor,
f.Nome AS funcionario_alocado,
f.Cargo
FROM setor s
LEFT JOIN Garcom g ON s.id_setor = g.id_setor
LEFT JOIN Funcionarios f ON g.id_funcionario = f.id_funcionario;
#mostra todos os pedidos das sedes
SELECT
r.Nome AS nome_restaurante,
COALESCE(SUM(pp.quantidade * pp.preco_unitario), 0) + COALESCE(SUM(pb.quantidade *
pb.preco_unitario), 0) AS faturamento_total
FROM Restaurante r
LEFT JOIN Pedido p ON r.id_restaurante = p.id_restaurante
LEFT JOIN Pedido_Prato pp ON p.id_pedido = pp.id_pedido
LEFT JOIN Pedido_Bebida pb ON p.id_pedido = pb.id_pedido;
#quantos pratos ja foram vendidos
SELECT
pr.nome AS nome_prato,
SUM(pp.quantidade) AS total_vendido
FROM Prato pr
JOIN Pedido_Prato pp ON pr.id_prato = pp.id_prato
GROUP BY pr.id_prato, pr.nome
HAVING total_vendido > 1;
#quantos pedidos cada garçom ja registrou
SELECT
f.Nome AS nome_garcom,
COUNT(p.id_pedido) AS total_pedidos_atendidos
FROM Garcom g
JOIN Funcionarios f ON g.id_funcionario = f.id_funcionario
JOIN Pedido p ON g.id_funcionario = p.id_garcom
GROUP BY f.id_funcionario, f.Nome
HAVING total_pedidos_atendidos >= 2;
#quantidade total de cada bebida
SELECT
b.nome AS nome_bebida,
SUM(pb.quantidade) AS quantidade_total_pedida
FROM Bebida b
JOIN Pedido_Bebida pb ON b.id_bebida = pb.id_bebida
GROUP BY b.id_bebida, b.nome
HAVING quantidade_total_pedida >= 2;
#media de preço e quantidade por categoria de prato
SELECT
categoria,
COUNT(*) AS quantidade_pratos,
AVG(preco) AS media_preco
FROM Prato
GROUP BY categoria
HAVING media_preco > 40.00;
#mostra quantos pedidos cada cozinheiro está realizando
SELECT
f.Nome AS cozinheiro,
COUNT(p.id_pedido) AS total_pedidos
FROM Cozinheiro c
JOIN Funcionarios f ON c.id_funcionario = f.id_funcionario
JOIN Pedido p ON c.id_funcionario = p.id_cozinheiro
GROUP BY f.id_funcionario, f.Nome
HAVING total_pedidos >= 2;
SELECT nome, preco, categoria
FROM Prato
WHERE preco > (SELECT AVG(preco) FROM Prato);
SELECT Nome, CPF, data_admissao
FROM Funcionarios
WHERE id_funcionario IN (SELECT id_funcionario FROM Cozinheiro WHERE especialidade IN
('Massas', 'Carnes'));
SELECT nome, preco
FROM Bebida
WHERE preco > (SELECT AVG(preco) FROM Bebida);
SELECT Nome, CNPJ, Endereco
FROM Restaurante
WHERE id_restaurante IN (SELECT id_restaurante FROM Pedido WHERE status = 'Em
Preparo');
SELECT nome, categoria
FROM Prato
WHERE id_prato NOT IN (SELECT id_prato FROM Pedido_Prato);
CREATE VIEW vw_funcionarios_setores AS
SELECT
f.id_funcionario,
f.Nome,
f.CPF,
f.Cargo,
COALESCE(s_ger.nome_setor, s_coz.nome_setor, s_gar.nome_setor, s_atd.nome_setor,
'Sem Setor Fixo') AS nome_setor
FROM Funcionarios f
LEFT JOIN Gerente g ON f.id_funcionario = g.id_funcionario
LEFT JOIN setor s_ger ON g.id_setor = s_ger.id_setor
LEFT JOIN Cozinheiro coz ON f.id_funcionario = coz.id_funcionario
LEFT JOIN setor s_coz ON coz.id_setor = s_coz.id_setor
LEFT JOIN Garcom gar ON f.id_funcionario = gar.id_funcionario
LEFT JOIN setor s_gar ON gar.id_setor = s_gar.id_setor
LEFT JOIN Atendente atd ON f.id_funcionario = atd.id_funcionario
LEFT JOIN setor s_atd ON atd.id_setor = s_atd.id_setor;
CREATE VIEW vw_faturamento_por_restaurante AS
SELECT
r.id_restaurante,
r.Nome AS nome_restaurante,
COALESCE(SUM(pp.quantidade * pp.preco_unitario), 0) + COALESCE(SUM(pb.quantidade *
pb.preco_unitario), 0) AS faturamento_total
FROM Restaurante r
LEFT JOIN Pedido p ON r.id_restaurante = p.id_restaurante
LEFT JOIN Pedido_Prato pp ON p.id_pedido = pp.id_pedido
LEFT JOIN Pedido_Bebida pb ON p.id_pedido = pb.id_pedido
GROUP BY r.id_restaurante, r.Nome;
CREATE VIEW vw_pratos_quentes_destaque AS
SELECT
nome,
preco,
categoria,
tempo_preparo_min,
CASE WHEN eh_vegetariano = 1 THEN 'Sim' ELSE 'Não' END AS vegetariano
FROM Prato
WHERE temperatura = 'Quente';
CREATE VIEW vw_detalhes_pedidos AS
SELECT
p.id_pedido,
r.Nome AS restaurante,
p.mesa,
p.status,
p.data_hora,
f.Nome AS garcom
FROM Pedido p
JOIN Restaurante r ON p.id_restaurante = r.id_restaurante
JOIN Garcom g ON p.id_garcom = g.id_funcionario
JOIN Funcionarios f ON g.id_funcionario = f.id_funcionario;
CREATE VIEW vw_historico_fornecimentos AS
SELECT
fn.id_fornecimento,
r.Nome AS restaurante,
f.Nome_fantasia AS fornecedor,
fn.data_fornecimento,
fn.descricao
FROM Fornecimento fn
JOIN Restaurante r ON fn.id_restaurante = r.id_restaurante
JOIN Fornecedor f ON fn.id_fornecedor = f.id_fornecedor;
UPDATE Prato
SET preco = preco * 1.10
WHERE categoria = 'Prato Principal' AND preco > 60.00;
UPDATE Restaurante
SET Telefone = '(41) 3333-0000'
WHERE Nome = 'Sabor & Arte Batel';
UPDATE Pedido
SET status = 'Concluído'
WHERE status = 'Pendente' AND data_hora < '2026-10-12 13:00:00';
DELETE FROM Bebida
WHERE nome = 'Água Tônica Schweppes Lata';