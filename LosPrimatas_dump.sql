DROP DATABASE IF EXISTS VetCare;
CREATE DATABASE VetCare;
USE VetCare;

CREATE TABLE Tutor (
    id_tutor INT AUTO_INCREMENT NOT NULL  PRIMARY KEY,
    CPF CHAR(11) UNIQUE NOT NULL,
    email VARCHAR(90) UNIQUE NOT NULL,
    nome VARCHAR(90),
    CEP CHAR(10)
);

CREATE TABLE Cargo (
    id_cargo INT AUTO_INCREMENT NOT NULL  PRIMARY KEY,
    nome_cargo VARCHAR(45),
    hora_entrada DATETIME,
    hora_saida DATETIME,
    salario DECIMAL(10, 2)
);

CREATE TABLE Animal (
    id_animal INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_tutor INT,
    nome VARCHAR(90),
    especie VARCHAR(45),
    raca VARCHAR(60),
    data_nascimento DATE,
    CONSTRAINT fk_idTutor FOREIGN KEY (id_tutor)
        REFERENCES Tutor (id_tutor)
);

CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT NOT NULL  PRIMARY KEY,
    id_cargo INT,
    nome VARCHAR(90),
    CPF CHAR(11) NOT NULL UNIQUE,
    data_admissao DATETIME,
    CONSTRAINT fk_idCargo FOREIGN KEY (id_cargo)
        REFERENCES Cargo (id_cargo)
);

CREATE TABLE Atendimento (
    id_atendimento INT AUTO_INCREMENT NOT NULL  PRIMARY KEY,
    id_animal INT,
    data_hora_inicio DATETIME NOT NULL,
    data_hora_fim DATETIME NOT NULL,
    observacoes VARCHAR(140),
    CONSTRAINT fk_idAnimalAtendimento FOREIGN KEY (id_animal)
        REFERENCES Animal (id_animal)
);

CREATE TABLE Agendamento (
    id_agendamento INT AUTO_INCREMENT NOT NULL  PRIMARY KEY,
    id_animal INT NOT NULL,
    data_hora DATETIME NOT NULL,
    status_agendamento VARCHAR(20),
    CONSTRAINT fk_idAnimal FOREIGN KEY (id_animal)
        REFERENCES Animal (id_animal)
);

CREATE TABLE Agendamento_Funcionario (
    id_agendamento INT,
    id_funcionario INT,
    PRIMARY KEY (id_agendamento, id_funcionario),
    CONSTRAINT fk_agendamento_id FOREIGN KEY (id_agendamento)
        REFERENCES Agendamento (id_agendamento),
    CONSTRAINT fk_funcionario_id_agendamento FOREIGN KEY (id_funcionario)
        REFERENCES Funcionario (id_funcionario)
);

CREATE TABLE Atendimento_Funcionario (
    id_atendimento INT,
    id_funcionario INT,
    PRIMARY KEY (id_atendimento, id_funcionario),
    CONSTRAINT fk_atendimento_id FOREIGN KEY (id_atendimento)
        REFERENCES Atendimento (id_atendimento),
    CONSTRAINT fk_funcionario_id_atendimento FOREIGN KEY (id_funcionario)
        REFERENCES Funcionario (id_funcionario)
);

CREATE TABLE Catalogo_servicos (
    id_servicos INT AUTO_INCREMENT NOT NULL  PRIMARY KEY,
    id_atendimento INT,
    nome_servico VARCHAR(90) NOT NULL,
    preco_servico DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_idAtendimento FOREIGN KEY (id_atendimento)
        REFERENCES Atendimento (id_atendimento)
);

CREATE TABLE Produtos (
    id_produtos INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_catalogoServicos INT NULL,
    nome_produto VARCHAR(60),
    preco_produto DECIMAL(10, 2),
    quantidade_estoque INT,
    CONSTRAINT fk_id_catalogoServicos FOREIGN KEY (id_catalogoServicos)
        REFERENCES Catalogo_servicos (id_servicos)
);

CREATE TABLE Transacao (
    id_transacao INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_produtos INT NULL,
    id_catalogoServicos INT NULL,
    tipo_E_S char(1) not null,
    tipo VARCHAR(8),
    valor DECIMAL(10, 2),
    data_pagamento DATETIME,
    forma_pagamento VARCHAR(15),
    CONSTRAINT fk_idProdutos FOREIGN KEY (id_produtos)
        REFERENCES Produtos (id_produtos),
    CONSTRAINT fk_transacao_id_catalogoServicos FOREIGN KEY (id_catalogoServicos)
        REFERENCES Catalogo_servicos (id_servicos)
);                             
INSERT INTO Tutor (CPF, email, nome, CEP) VALUES
('11122233344', 'ana.silva@email.com', 'Ana Silva', '80010-010'),
('22233344455', 'bruno.costa@email.com', 'Bruno Costa', '80020-020'),
('33344455566', 'carla.dias@email.com', 'Carla Dias', '80030-030'),
('44455566677', 'daniel.alves@email.com', 'Daniel Alves', '80040-040'),
('55566677788', 'elisa.fernandes@email.com', 'Elisa Fernandes', '80050-050'),
('66677788899', 'felipe.gomes@email.com', 'Felipe Gomes', '80060-060'),
('77788899900', 'gabriela.lima@email.com', 'Gabriela Lima', '81010-070'),
('88899900011', 'heitor.moraes@email.com', 'Heitor Moraes', '81020-080'),
('99900011122', 'isabela.nunes@email.com', 'Isabela Nunes', '81030-090'),
('00011122233', 'joao.pereira@email.com', 'João Pereira', '81040-100'),
('12345678901', 'larissa.rocha@email.com', 'Larissa Rocha', '82010-110'),
('23456789012', 'marcos.souza@email.com', 'Marcos Souza', '82020-120'),
('34567890123', 'natalia.barbosa@email.com', 'Natália Barbosa', '82030-130'),
('45678901234', 'otavio.carvalho@email.com', 'Otávio Carvalho', '82040-140'),
('56789012345', 'paula.melo@email.com', 'Paula Melo', '83010-150'),
('67890123456', 'rafael.santos@email.com', 'Rafael Santos', '83020-160'),
('78901234567', 'simone.teixeira@email.com', 'Simone Teixeira', '83030-170'),
('89012345678', 'tiago.vieira@email.com', 'Tiago Vieira', '83040-180'),
('90123456789', 'ursula.freitas@email.com', 'Úrsula Freitas', '84010-190'),
('01234567890', 'vinicius.ribeiro@email.com', 'Vinícius Ribeiro', '84020-200');


INSERT INTO Cargo (nome_cargo, hora_entrada, hora_saida, salario) VALUES
('Veterinário Cirurgião', '2025-10-03 08:00:00', '2025-10-03 18:00:00', 8500.00), ('Veterinário Clínico Geral', '2025-10-03 09:00:00', '2025-10-03 19:00:00', 7200.00),
('Auxiliar Veterinário', '2025-10-03 08:30:00', '2025-10-03 17:30:00', 2800.00), ('Recepcionista', '2025-10-03 07:30:00', '2025-10-03 16:30:00', 2100.00),
('Banhista e Tosador', '2025-10-03 09:00:00', '2025-10-03 18:00:00', 2500.00), ('Gerente de Clínica', '2025-10-03 08:00:00', '2025-10-03 18:00:00', 6000.00),
('Farmacêutico Veterinário', '2025-10-03 09:00:00', '2025-10-03 17:00:00', 4500.00), ('Técnico de Laboratório', '2025-10-03 08:00:00', '2025-10-03 16:00:00', 3200.00),
('Motorista de Ambulância', '2025-10-03 00:00:00', '2025-10-03 23:59:59', 2900.00), ('Estoquista', '2025-10-03 08:00:00', '2025-10-03 17:00:00', 1900.00),
('Serviços Gerais', '2025-10-03 07:00:00', '2025-10-03 16:00:00', 1800.00), ('Atendente de Pet Shop', '2025-10-03 10:00:00', '2025-10-03 20:00:00', 2200.00),
('Nutricionista Animal', '2025-10-03 09:00:00', '2025-10-03 15:00:00', 5500.00), ('Fisioterapeuta Animal', '2025-10-03 13:00:00', '2025-10-03 19:00:00', 5100.00),
('Anestesista Veterinário', '2025-10-03 08:00:00', '2025-10-03 18:00:00', 9500.00), ('Cardiologista Veterinário', '2025-10-03 09:00:00', '2025-10-03 13:00:00', 7800.00),
('Dermatologista Veterinário', '2025-10-03 14:00:00', '2025-10-03 18:00:00', 7600.00), ('Oncologista Veterinário', '2025-10-03 08:30:00', '2025-10-03 12:30:00', 8200.00),
('Tosador Jr.', '2025-10-03 10:00:00', '2025-10-03 17:00:00', 2000.00), ('Recepcionista Noturno', '2025-10-03 19:00:00', '2025-10-04 07:00:00', 2400.00);


INSERT INTO Animal (id_tutor, nome, especie, raca, data_nascimento) VALUES
(1, 'Rex', 'Cachorro', 'Labrador', '2018-05-12'),
(2, 'Mimi', 'Gato', 'Siamês', '2020-03-08'),
(3, 'Bolt', 'Cachorro', 'Pastor Alemão', '2019-11-21'),
(4, 'Luna', 'Gato', 'Persa', '2021-07-15'),
(5, 'Thor', 'Cachorro', 'Golden Retriever', '2017-12-01'),
(6, 'Bella', 'Cachorro', 'Poodle', '2022-01-10'),
(7, 'Simba', 'Gato', 'Maine Coon', '2019-09-25'),
(8, 'Nina', 'Cachorro', 'Shih Tzu', '2020-06-18'),
(9, 'Zeus', 'Cachorro', 'Bulldog', '2018-02-02'),
(10, 'Lola', 'Gato', 'Sphynx', '2021-04-20'),
(11, 'Max', 'Cachorro', 'Beagle', '2019-08-11'),
(12, 'Cleo', 'Gato', 'Ragdoll', '2022-03-14'),
(13, 'Rocky', 'Cachorro', 'Boxer', '2016-10-05'),
(14, 'Maya', 'Gato', 'Bengal', '2020-12-30'),
(15, 'Koda', 'Cachorro', 'Husky Siberiano', '2018-07-22'),
(16, 'Sushi', 'Gato', 'Exótico', '2019-05-16'),
(17, 'Rudy', 'Cachorro', 'Dachshund', '2021-09-03'),
(18, 'Tina', 'Gato', 'Scottish Fold', '2022-06-07'),
(19, 'Leo', 'Cachorro', 'Rottweiler', '2017-11-11'),
(20, 'Mia', 'Gato', 'Birman', '2018-08-28');

INSERT INTO Funcionario (id_cargo, nome, CPF, data_admissao) VALUES
(1, 'Carlos Mendes', '11122233344', '2020-02-15'),
(2, 'Fernanda Lima', '22233344455', '2019-05-20'),
(3, 'Juliana Rocha', '33344455566', '2021-01-10'),
(4, 'Paulo Oliveira', '44455566677', '2018-07-01'),
(5, 'Amanda Souza', '55566677788', '2022-03-12'),
(6, 'Roberto Gomes', '66677788899', '2017-11-05'),
(7, 'Vanessa Nunes', '77788899900', '2019-09-15'),
(8, 'Igor Santos', '88899900011', '2020-12-22'),
(9, 'Renata Carvalho', '99900011122', '2021-06-01'),
(10, 'Bruno Ferreira', '00011122233', '2018-03-18'),
(11, 'Paula Teixeira', '12345678901', '2019-08-25'),
(12, 'Marcelo Costa', '23456789012', '2022-01-30'),
(13, 'Carolina Dias', '34567890123', '2017-05-12'),
(14, 'Fábio Pinto', '45678901234', '2021-11-08'),
(15, 'Aline Barros', '56789012345', '2019-02-20'),
(16, 'Diego Machado', '67890123456', '2020-09-05'),
(17, 'Larissa Martins', '78901234567', '2018-06-17'),
(18, 'Thiago Alves', '89012345678', '2021-03-11'),
(19, 'Natália Pereira', '90123456789', '2017-12-02'),
(20, 'Rafael Rocha', '01234567890', '2022-07-07');

INSERT INTO Atendimento (id_animal, data_hora_inicio, data_hora_fim, observacoes) VALUES
(1, '2025-10-01 08:00:00', '2025-10-01 09:00:00', 'Vacinação anual'),
(2, '2025-10-01 09:30:00', '2025-10-01 10:15:00', 'Consulta clínica'),
(3, '2025-10-01 10:30:00', '2025-10-01 11:15:00', 'Check-up'),
(4, '2025-10-01 11:30:00', '2025-10-01 12:15:00', 'Consulta dermatológica'),
(5, '2025-10-01 13:00:00', '2025-10-01 14:00:00', 'Vacinação'),
(6, '2025-10-01 14:30:00', '2025-10-01 15:15:00', 'Exame de sangue'),
(7, '2025-10-01 15:30:00', '2025-10-01 16:15:00', 'Consulta clínica'),
(8, '2025-10-01 16:30:00', '2025-10-01 17:15:00', 'Tosar e banhar'),
(9, '2025-10-02 08:00:00', '2025-10-02 09:00:00', 'Vacinação'),
(10, '2025-10-02 09:30:00', '2025-10-02 10:15:00', 'Consulta clínica'),
(11, '2025-10-02 10:30:00', '2025-10-02 11:15:00', 'Check-up'),
(12, '2025-10-02 11:30:00', '2025-10-02 12:15:00', 'Exame de sangue'),
(13, '2025-10-02 13:00:00', '2025-10-02 14:00:00', 'Vacinação'),
(14, '2025-10-02 14:30:00', '2025-10-02 15:15:00', 'Consulta clínica'),
(15, '2025-10-02 15:30:00', '2025-10-02 16:15:00', 'Consulta cardiológica'),
(16, '2025-10-02 16:30:00', '2025-10-02 17:15:00', 'Tosar e banhar'),
(17, '2025-10-03 08:00:00', '2025-10-03 09:00:00', 'Vacinação'),
(18, '2025-10-03 09:30:00', '2025-10-03 10:15:00', 'Consulta clínica'),
(19, '2025-10-03 10:30:00', '2025-10-03 11:15:00', 'Exame de sangue'),
(20, '2025-10-03 11:30:00', '2025-10-03 12:15:00', 'Consulta clínica');

INSERT INTO Agendamento (id_animal, data_hora, status_agendamento) VALUES
(1, '2025-10-04 08:00:00', 'Agendado'),
(2, '2025-10-04 09:00:00', 'Confirmado'),
(3, '2025-10-04 10:00:00', 'Agendado'),
(4, '2025-10-04 11:00:00', 'Cancelado'),
(5, '2025-10-04 12:00:00', 'Agendado'),
(6, '2025-10-04 13:00:00', 'Confirmado'),
(7, '2025-10-04 14:00:00', 'Agendado'),
(8, '2025-10-04 15:00:00', 'Agendado'),
(9, '2025-10-05 08:00:00', 'Confirmado'),
(10, '2025-10-05 09:00:00', 'Agendado'),
(11, '2025-10-05 10:00:00', 'Agendado'),
(12, '2025-10-05 11:00:00', 'Cancelado'),
(13, '2025-10-05 12:00:00', 'Agendado'),
(14, '2025-10-05 13:00:00', 'Confirmado'),
(15, '2025-10-05 14:00:00', 'Agendado'),
(16, '2025-10-05 15:00:00', 'Agendado'),
(17, '2025-10-06 08:00:00', 'Confirmado'),
(18, '2025-10-06 09:00:00', 'Agendado'),
(19, '2025-10-06 10:00:00', 'Agendado'),
(20, '2025-10-06 11:00:00', 'Cancelado');

INSERT INTO Agendamento_Funcionario (id_agendamento, id_funcionario) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20);

INSERT INTO Atendimento_Funcionario (id_atendimento, id_funcionario) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20);

INSERT INTO Catalogo_servicos (id_atendimento, nome_servico, preco_servico) VALUES
(1, 'Vacinação', 150.00),
(2, 'Consulta Clínica', 120.00),
(3, 'Check-up', 200.00),
(4, 'Dermatologia', 250.00),
(5, 'Vacinação', 150.00),
(6, 'Exame de Sangue', 180.00),
(7, 'Consulta Clínica', 120.00),
(8, 'Banho e Tosa', 90.00),
(9, 'Vacinação', 150.00),
(10, 'Consulta Clínica', 120.00),
(11, 'Check-up', 200.00),
(12, 'Exame de Sangue', 180.00),
(13, 'Vacinação', 150.00),
(14, 'Consulta Clínica', 120.00),
(15, 'Cardiologia', 300.00),
(16, 'Banho e Tosa', 90.00),
(17, 'Vacinação', 150.00),
(18, 'Consulta Clínica', 120.00),
(19, 'Exame de Sangue', 180.00),
(20, 'Consulta Clínica', 120.00);

INSERT INTO Produtos (id_catalogoServicos, nome_produto, preco_produto, quantidade_estoque) VALUES
(1, 'Ração Premium', 250.00, 50),
(2, 'Antipulgas', 80.00, 100),
(3, 'Vitamina', 45.00, 150),
(4, 'Shampoo Pet', 35.00, 200),
(5, 'Coleira', 25.00, 80),
(6, 'Brinquedo', 40.00, 90),
(7, 'Ração Premium', 250.00, 50),
(8, 'Antipulgas', 80.00, 100),
(9, 'Vitamina', 45.00, 150),
(10, 'Shampoo Pet', 35.00, 200),
(11, 'Coleira', 25.00, 80),
(12, 'Brinquedo', 40.00, 90),
(13, 'Ração Premium', 250.00, 50),
(14, 'Antipulgas', 80.00, 100),
(15, 'Vitamina', 45.00, 150),
(16, 'Shampoo Pet', 35.00, 200),
(17, 'Coleira', 25.00, 80),
(18, 'Brinquedo', 40.00, 90),
(19, 'Ração Premium', 250.00, 50),
(20, 'Antipulgas', 80.00, 100);

INSERT INTO Transacao (id_produtos, id_catalogoServicos, tipo_E_S, tipo, valor, data_pagamento, forma_pagamento) VALUES
(1, 1, 'E', 'Produto', 250.00, '2025-10-01 08:30:00', 'Cartão'),
(2, 2, 'S', 'Produto', 80.00, '2025-10-01 09:45:00', 'Dinheiro'),
(3, 3, 'S', 'Produto', 45.00, '2025-10-01 10:45:00', 'Cartão'),
(4, 4, 'S', 'Produto', 35.00, '2025-10-01 11:45:00', 'Pix'),
(5, 5, 'S', 'Produto', 25.00, '2025-10-01 12:15:00', 'Cartão'),
(6, 6, 'S', 'Produto', 40.00, '2025-10-01 13:30:00', 'Dinheiro'),
(7, 7, 'S', 'Produto', 250.00, '2025-10-01 14:30:00', 'Cartão'),
(8, 8, 'S', 'Produto', 80.00, '2025-10-01 15:30:00', 'Pix'),
(9, 9, 'S', 'Produto', 45.00, '2025-10-02 08:30:00', 'Cartão'),
(10, 10, 'S', 'Produto', 35.00, '2025-10-02 09:30:00', 'Dinheiro'),
(11, 11, 'S', 'Produto', 25.00, '2025-10-02 10:30:00', 'Cartão'),
(12, 12, 'S', 'Produto', 40.00, '2025-10-02 11:30:00', 'Pix'),
(13, 13, 'S', 'Produto', 250.00, '2025-10-02 12:30:00', 'Cartão'),
(14, 14, 'S', 'Produto', 80.00, '2025-10-02 13:30:00', 'Dinheiro'),
(15, 15, 'E', 'Serviço', 300.00, '2025-10-02 14:30:00', 'Cartão'),
(16, 16, 'E', 'Serviço', 90.00, '2025-10-02 15:30:00', 'Pix'),
(17, 17, 'E', 'Serviço', 150.00, '2025-10-03 08:30:00', 'Cartão'),
(18, 18, 'E', 'Serviço', 120.00, '2025-10-03 09:30:00', 'Dinheiro'),
(19, 19, 'E', 'Serviço', 180.00, '2025-10-03 10:30:00', 'Cartão'),
(20, 20, 'E', 'Serviço', 120.00, '2025-10-03 11:30:00', 'Pix');

