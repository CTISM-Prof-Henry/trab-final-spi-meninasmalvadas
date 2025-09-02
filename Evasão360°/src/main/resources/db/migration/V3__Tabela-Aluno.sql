CREATE TABLE alunos (
    matricula VARCHAR(20) PRIMARY KEY,     -- Identificador único do aluno
    nome VARCHAR(100) NOT NULL,            -- Nome completo
    curso_id INT NOT NULL,                 -- Chave estrangeira para a tabela 'cursos'
    risco NUMERIC(4,2) CHECK (risco >= 0 AND risco <= 1), -- Risco (0 a 1)
    email VARCHAR(150) UNIQUE NOT NULL,    -- Email único
    cpf VARCHAR(14) NOT NULL,       -- CPF no formato XXX.XXX.XXX-XX
    nascimento DATE NOT NULL,              -- Data de nascimento
    telefone VARCHAR(20),                  -- Telefone
    endereco VARCHAR(200),                 -- Endereço
    frequencia NUMERIC(5,2) CHECK (frequencia >= 0 AND frequencia <= 100), -- Frequência (%)
    media NUMERIC(4,2) CHECK (media >= 0 AND media <= 10), -- Média (0 a 10)
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

-- Inserindo 5 alunos para o curso de Administração (1)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230001', 'Ana Souza', (SELECT id FROM cursos WHERE nome = 'Administração'), 0.15, 'ana.souza@ufsm.br', '111.222.333-44', '2002-03-15', '(55) 99999-0001', 'Rua A, 123', 95.0, 8.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230002', 'Bruno Lima', (SELECT id FROM cursos WHERE nome = 'Administração'), 0.45, 'bruno.lima@ufsm.br', '222.333.444-55', '2001-07-20', '(55) 99999-0002', 'Rua B, 456', 88.0, 7.2);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230003', 'Carla Mendes', (SELECT id FROM cursos WHERE nome = 'Administração'), 0.25, 'carla.mendes@ufsm.br', '333.444.555-66', '2000-09-10', '(55) 99999-0003', 'Rua C, 789', 92.0, 9.1);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230004', 'Diego Faria', (SELECT id FROM cursos WHERE nome = 'Administração'), 0.65, 'diego.faria@ufsm.br', '444.555.666-77', '2003-01-25', '(55) 99999-0004', 'Rua D, 101', 75.0, 6.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230005', 'Elisa Gomes', (SELECT id FROM cursos WHERE nome = 'Administração'), 0.85, 'elisa.gomes@ufsm.br', '555.666.777-88', '2004-06-03', '(55) 99999-0005', 'Rua E, 212', 65.0, 5.5);

-- Inserindo 5 alunos para o curso de Engenharia Civil (2)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230006', 'Fábio Costa', (SELECT id FROM cursos WHERE nome = 'Engenharia Civil'), 0.10, 'fabio.costa@ufsm.br', '666.777.888-99', '1999-11-11', '(55) 99999-0006', 'Rua F, 323', 98.0, 9.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230007', 'Gabriela Alves', (SELECT id FROM cursos WHERE nome = 'Engenharia Civil'), 0.30, 'gabriela.alves@ufsm.br', '777.888.999-00', '2002-02-28', '(55) 99999-0007', 'Rua G, 434', 85.0, 7.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230008', 'Heitor Silva', (SELECT id FROM cursos WHERE nome = 'Engenharia Civil'), 0.50, 'heitor.silva@ufsm.br', '888.999.000-11', '2001-08-18', '(55) 99999-0008', 'Rua H, 545', 77.0, 6.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230009', 'Isabela Neves', (SELECT id FROM cursos WHERE nome = 'Engenharia Civil'), 0.70, 'isabela.neves@ufsm.br', '999.000.111-22', '2003-04-04', '(55) 99999-0009', 'Rua I, 656', 70.0, 6.0);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230010', 'João Pereira', (SELECT id FROM cursos WHERE nome = 'Engenharia Civil'), 0.95, 'joao.pereira@ufsm.br', '000.111.222-33', '2000-12-12', '(55) 99999-0010', 'Rua J, 767', 60.0, 4.5);

-- Inserindo 5 alunos para o curso de Engenharia de Software (3)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230011', 'Camila Ribeiro', (SELECT id FROM cursos WHERE nome = 'Engenharia de Software'), 0.12, 'camila.ribeiro@ufsm.br', '111.222.333-45', '2001-05-20', '(55) 99999-0011', 'Av. das Hortênsias, 10', 98.5, 9.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230012', 'Gustavo Santos', (SELECT id FROM cursos WHERE nome = 'Engenharia de Software'), 0.38, 'gustavo.santos@ufsm.br', '222.333.444-56', '2002-08-15', '(55) 99999-0012', 'Rua das Flores, 20', 91.0, 8.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230013', 'Helena Oliveira', (SELECT id FROM cursos WHERE nome = 'Engenharia de Software'), 0.55, 'helena.oliveira@ufsm.br', '333.444.555-67', '2003-02-01', '(55) 99999-0013', 'Praça da Liberdade, 30', 85.0, 7.0);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230014', 'Marcos Almeida', (SELECT id FROM cursos WHERE nome = 'Engenharia de Software'), 0.72, 'marcos.almeida@ufsm.br', '444.555.666-78', '2001-11-30', '(55) 99999-0014', 'Rua do Rosário, 40', 78.0, 6.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230015', 'Larissa Mendes', (SELECT id FROM cursos WHERE nome = 'Engenharia de Software'), 0.95, 'larissa.mendes@ufsm.br', '555.666.777-89', '2000-07-22', '(55) 99999-0015', 'Estrada do Sol, 50', 65.0, 5.0);

-- Inserindo 5 alunos para o curso de Ciências da Computação (4)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230016', 'Rafaela Castro', (SELECT id FROM cursos WHERE nome = 'Ciências da Computação'), 0.10, 'rafaela.castro@ufsm.br', '666.777.888-90', '2002-09-05', '(55) 99999-0016', 'Av. Brasil, 60', 99.0, 9.7);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230017', 'Thiago Lima', (SELECT id FROM cursos WHERE nome = 'Ciências da Computação'), 0.25, 'thiago.lima@ufsm.br', '777.888.999-01', '2001-04-18', '(55) 99999-0017', 'Rua da Paz, 70', 92.0, 8.9);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230018', 'Vitor Hugo', (SELECT id FROM cursos WHERE nome = 'Ciências da Computação'), 0.40, 'vitor.hugo@ufsm.br', '888.999.000-12', '2003-01-28', '(55) 99999-0018', 'Rua dos Gaúchos, 80', 88.0, 8.2);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230019', 'Sofia Reis', (SELECT id FROM cursos WHERE nome = 'Ciências da Computação'), 0.60, 'sofia.reis@ufsm.br', '999.000.111-23', '2000-10-10', '(55) 99999-0019', 'Praça do Sol, 90', 75.0, 7.1);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230020', 'Felipe Santos', (SELECT id FROM cursos WHERE nome = 'Ciências da Computação'), 0.80, 'felipe.santos@ufsm.br', '000.111.222-34', '2004-03-08', '(55) 99999-0020', 'Rua da Alegria, 100', 68.0, 6.0);

-- Inserindo 5 alunos para o curso de Engenharia Elétrica (5)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230021', 'Lucas Cardoso', (SELECT id FROM cursos WHERE nome = 'Engenharia Elétrica'), 0.18, 'lucas.cardoso@ufsm.br', '111.222.333-46', '2002-07-22', '(55) 99999-0021', 'Rua das Indústrias, 10', 95.0, 8.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230022', 'Marta Fernandes', (SELECT id FROM cursos WHERE nome = 'Engenharia Elétrica'), 0.33, 'marta.fernandes@ufsm.br', '222.333.444-57', '2001-09-19', '(55) 99999-0022', 'Av. das Invenções, 20', 90.0, 8.1);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230023', 'Paulo Gomes', (SELECT id FROM cursos WHERE nome = 'Engenharia Elétrica'), 0.58, 'paulo.gomes@ufsm.br', '333.444.555-68', '2003-03-03', '(55) 99999-0023', 'Rua dos Motores, 30', 80.0, 7.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230024', 'Julia Martins', (SELECT id FROM cursos WHERE nome = 'Engenharia Elétrica'), 0.77, 'julia.martins@ufsm.br', '444.555.666-79', '2000-12-15', '(55) 99999-0024', 'Travessa dos Circuitos, 40', 72.0, 6.7);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230025', 'Roberto Souza', (SELECT id FROM cursos WHERE nome = 'Engenharia Elétrica'), 0.98, 'roberto.souza@ufsm.br', '555.666.777-80', '2004-05-09', '(55) 99999-0025', 'Av. da Energia, 50', 62.0, 5.2);

-- Inserindo 5 alunos para o curso de Análise e Desenv. de Sistemas (6)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230026', 'Carolina Dias', (SELECT id FROM cursos WHERE nome = 'Análise e Desenv. de Sistemas'), 0.22, 'carolina.dias@ufsm.br', '666.777.888-91', '2002-10-10', '(55) 99999-0026', 'Rua da Programação, 10', 94.0, 9.0);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230027', 'Diego Ferraz', (SELECT id FROM cursos WHERE nome = 'Análise e Desenv. de Sistemas'), 0.44, 'diego.ferraz@ufsm.br', '777.888.999-02', '2001-06-25', '(55) 99999-0027', 'Av. dos Sistemas, 20', 89.0, 8.0);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230028', 'Henrique Costa', (SELECT id FROM cursos WHERE nome = 'Análise e Desenv. de Sistemas'), 0.61, 'henrique.costa@ufsm.br', '888.999.000-13', '2003-04-12', '(55) 99999-0028', 'Rua da Lógica, 30', 81.0, 7.3);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230029', 'Isabel Freitas', (SELECT id FROM cursos WHERE nome = 'Análise e Desenv. de Sistemas'), 0.84, 'isabel.freitas@ufsm.br', '999.000.111-24', '2000-08-30', '(55) 99999-0029', 'Travessa dos Algoritmos, 40', 74.0, 6.4);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230030', 'Leonardo Santos', (SELECT id FROM cursos WHERE nome = 'Análise e Desenv. de Sistemas'), 0.92, 'leonardo.santos@ufsm.br', '000.111.222-35', '2004-01-19', '(55) 99999-0030', 'Rua do Banco de Dados, 50', 60.0, 5.0);

-- Inserindo 5 alunos para o curso de Arquitetura (7)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230031', 'Mariana Oliveira', (SELECT id FROM cursos WHERE nome = 'Arquitetura'), 0.15, 'mariana.oliveira@ufsm.br', '111.222.333-47', '2002-09-09', '(55) 99999-0031', 'Rua das Estruturas, 10', 96.0, 9.2);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230032', 'Natália Sousa', (SELECT id FROM cursos WHERE nome = 'Arquitetura'), 0.42, 'natalia.sousa@ufsm.br', '222.333.444-58', '2001-03-25', '(55) 99999-0032', 'Av. do Design, 20', 87.0, 8.0);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230033', 'Patrícia Rocha', (SELECT id FROM cursos WHERE nome = 'Arquitetura'), 0.65, 'patricia.rocha@ufsm.br', '333.444.555-69', '2003-10-10', '(55) 99999-0033', 'Rua da Estética, 30', 80.0, 7.1);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230034', 'Ricardo Nogueira', (SELECT id FROM cursos WHERE nome = 'Arquitetura'), 0.81, 'ricardo.nogueira@ufsm.br', '444.555.666-70', '2000-06-15', '(55) 99999-0034', 'Travessa dos Planos, 40', 70.0, 6.0);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230035', 'Sara Costa', (SELECT id FROM cursos WHERE nome = 'Arquitetura'), 0.94, 'sara.costa@ufsm.br', '555.666.777-81', '2004-11-20', '(55) 99999-0035', 'Rua dos Materiais, 50', 65.0, 5.3);

-- Inserindo 5 alunos para o curso de Medicina (8)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230036', 'Aline Soares', (SELECT id FROM cursos WHERE nome = 'Medicina'), 0.10, 'aline.soares@ufsm.br', '666.777.888-92', '2002-08-08', '(55) 99999-0036', 'Rua da Saúde, 10', 99.5, 9.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230037', 'Bruno Guedes', (SELECT id FROM cursos WHERE nome = 'Medicina'), 0.30, 'bruno.guedes@ufsm.br', '777.888.999-03', '2001-05-15', '(55) 99999-0037', 'Av. da Vida, 20', 94.0, 9.1);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230038', 'Cristiane Almeida', (SELECT id FROM cursos WHERE nome = 'Medicina'), 0.50, 'cristiane.almeida@ufsm.br', '888.999.000-14', '2003-01-20', '(55) 99999-0038', 'Rua dos Sintomas, 30', 88.0, 8.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230039', 'Douglas Mendes', (SELECT id FROM cursos WHERE nome = 'Medicina'), 0.70, 'douglas.mendes@ufsm.br', '999.000.111-25', '2000-11-25', '(55) 99999-0039', 'Travessa dos Hospitais, 40', 80.0, 7.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230040', 'Érica Silva', (SELECT id FROM cursos WHERE nome = 'Medicina'), 0.90, 'erica.silva@ufsm.br', '000.111.222-36', '2004-04-30', '(55) 99999-0040', 'Rua das Cirurgias, 50', 70.0, 6.2);

-- Inserindo 5 alunos para o curso de Odontologia (9)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230041', 'Fernando Santos', (SELECT id FROM cursos WHERE nome = 'Odontologia'), 0.12, 'fernando.santos@ufsm.br', '111.222.333-48', '2002-12-12', '(55) 99999-0041', 'Rua dos Dentes, 10', 97.0, 9.3);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230042', 'Gisele Nunes', (SELECT id FROM cursos WHERE nome = 'Odontologia'), 0.35, 'gisele.nunes@ufsm.br', '222.333.444-59', '2001-02-28', '(55) 99999-0042', 'Av. do Sorriso, 20', 90.0, 8.6);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230043', 'Hélio Rodrigues', (SELECT id FROM cursos WHERE nome = 'Odontologia'), 0.55, 'helio.rodrigues@ufsm.br', '333.444.555-60', '2003-07-07', '(55) 99999-0043', 'Rua das Gengivas, 30', 85.0, 7.9);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230044', 'Iara Costa', (SELECT id FROM cursos WHERE nome = 'Odontologia'), 0.75, 'iara.costa@ufsm.br', '444.555.666-71', '2000-09-19', '(55) 99999-0044', 'Travessa da Ortodontia, 40', 78.0, 6.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230045', 'Júlio Pereira', (SELECT id FROM cursos WHERE nome = 'Odontologia'), 0.95, 'julio.pereira@ufsm.br', '555.666.777-82', '2004-02-14', '(55) 99999-0045', 'Rua do Enxaguante, 50', 68.0, 5.5);

-- Inserindo 5 alunos para o curso de Fisioterapia (10)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230046', 'Carla Lima', (SELECT id FROM cursos WHERE nome = 'Fisioterapia'), 0.11, 'carla.lima@ufsm.br', '666.777.888-93', '2002-05-25', '(55) 99999-0046', 'Rua da Reabilitação, 10', 96.0, 9.1);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230047', 'Diogo Martins', (SELECT id FROM cursos WHERE nome = 'Fisioterapia'), 0.33, 'diogo.martins@ufsm.br', '777.888.999-04', '2001-08-01', '(55) 99999-0047', 'Av. da Movimentação, 20', 90.0, 8.3);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230048', 'Fernanda Rocha', (SELECT id FROM cursos WHERE nome = 'Fisioterapia'), 0.55, 'fernanda.rocha@ufsm.br', '888.999.000-15', '2003-03-12', '(55) 99999-0048', 'Rua da Postura, 30', 85.0, 7.6);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230049', 'Gabriel Santos', (SELECT id FROM cursos WHERE nome = 'Fisioterapia'), 0.77, 'gabriel.santos@ufsm.br', '999.000.111-26', '2000-09-08', '(55) 99999-0049', 'Travessa dos Músculos, 40', 75.0, 6.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230050', 'Lívia Pereira', (SELECT id FROM cursos WHERE nome = 'Fisioterapia'), 0.99, 'livia.pereira@ufsm.br', '000.111.222-37', '2004-06-20', '(55) 99999-0050', 'Rua da Flexibilidade, 50', 65.0, 5.0);

-- Inserindo 5 alunos para o curso de Nutrição (11)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230051', 'Fábio Costa', (SELECT id FROM cursos WHERE nome = 'Nutrição'), 0.15, 'fabio.nutri@ufsm.br', '111.222.333-49', '2002-11-11', '(55) 99999-0051', 'Rua da Alimentação, 10', 98.0, 9.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230052', 'Mariana Neves', (SELECT id FROM cursos WHERE nome = 'Nutrição'), 0.32, 'mariana.nutri@ufsm.br', '222.333.444-60', '2001-04-04', '(55) 99999-0052', 'Av. da Dieta, 20', 92.0, 8.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230053', 'Pedro Rocha', (SELECT id FROM cursos WHERE nome = 'Nutrição'), 0.51, 'pedro.nutri@ufsm.br', '333.444.555-71', '2003-08-18', '(55) 99999-0053', 'Rua das Vitaminas, 30', 87.0, 7.9);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230054', 'Laura Mendes', (SELECT id FROM cursos WHERE nome = 'Nutrição'), 0.72, 'laura.nutri@ufsm.br', '444.555.666-82', '2000-10-30', '(55) 99999-0054', 'Travessa dos Minerais, 40', 79.0, 6.7);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230055', 'Tiago Santos', (SELECT id FROM cursos WHERE nome = 'Nutrição'), 0.93, 'tiago.nutri@ufsm.br', '555.666.777-93', '2004-03-05', '(55) 99999-0055', 'Rua dos Carboidratos, 50', 68.0, 5.4);

-- Inserindo 5 alunos para o curso de Psicologia (12)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230056', 'Isabella Costa', (SELECT id FROM cursos WHERE nome = 'Psicologia'), 0.10, 'isabella.psi@ufsm.br', '666.777.888-04', '2002-09-09', '(55) 99999-0056', 'Rua da Mente, 10', 99.0, 9.6);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230057', 'João Silva', (SELECT id FROM cursos WHERE nome = 'Psicologia'), 0.28, 'joao.psi@ufsm.br', '777.888.999-15', '2001-02-22', '(55) 99999-0057', 'Av. das Emoções, 20', 93.0, 8.9);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230058', 'Ana Clara', (SELECT id FROM cursos WHERE nome = 'Psicologia'), 0.49, 'ana.clara@ufsm.br', '888.999.000-26', '2003-06-15', '(55) 99999-0058', 'Rua dos Sentimentos, 30', 86.0, 7.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230059', 'Matheus Oliveira', (SELECT id FROM cursos WHERE nome = 'Psicologia'), 0.70, 'matheus.oliveira@ufsm.br', '999.000.111-37', '2000-11-28', '(55) 99999-0059', 'Travessa dos Pensamentos, 40', 77.0, 6.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230060', 'Lúcia Dantas', (SELECT id FROM cursos WHERE nome = 'Psicologia'), 0.91, 'lucia.dantas@ufsm.br', '000.111.222-48', '2004-05-10', '(55) 99999-0060', 'Rua da Análise, 50', 67.0, 5.2);

-- Inserindo 5 alunos para o curso de Medicina Veterinária (13)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230061', 'Caio Ribeiro', (SELECT id FROM cursos WHERE nome = 'Medicina Veterinária'), 0.14, 'caio.vet@ufsm.br', '111.222.333-50', '2002-10-15', '(55) 99999-0061', 'Rua dos Animais, 10', 98.5, 9.3);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230062', 'Daniela Almeida', (SELECT id FROM cursos WHERE nome = 'Medicina Veterinária'), 0.36, 'daniela.vet@ufsm.br', '222.333.444-61', '2001-03-20', '(55) 99999-0062', 'Av. da Proteção, 20', 91.0, 8.7);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230063', 'Érika Costa', (SELECT id FROM cursos WHERE nome = 'Medicina Veterinária'), 0.58, 'erika.vet@ufsm.br', '333.444.555-72', '2003-07-05', '(55) 99999-0063', 'Rua dos Bichos, 30', 85.0, 7.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230064', 'Guilherme Silva', (SELECT id FROM cursos WHERE nome = 'Medicina Veterinária'), 0.79, 'guilherme.vet@ufsm.br', '444.555.666-83', '2000-09-19', '(55) 99999-0064', 'Travessa dos Pequenos, 40', 78.0, 6.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230065', 'Renata Soares', (SELECT id FROM cursos WHERE nome = 'Medicina Veterinária'), 0.99, 'renata.vet@ufsm.br', '555.666.777-94', '2004-02-12', '(55) 99999-0065', 'Rua das Patas, 50', 65.0, 5.0);

-- Inserindo 5 alunos para o curso de História (14)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230066', 'Gustavo Paiva', (SELECT id FROM cursos WHERE nome = 'História'), 0.17, 'gustavo.his@ufsm.br', '666.777.888-05', '2002-11-22', '(55) 99999-0066', 'Rua do Passado, 10', 95.0, 9.0);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230067', 'Isadora Nogueira', (SELECT id FROM cursos WHERE nome = 'História'), 0.34, 'isadora.his@ufsm.br', '777.888.999-16', '2001-04-14', '(55) 99999-0067', 'Av. do Tempo, 20', 88.0, 8.3);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230068', 'Júlia Santos', (SELECT id FROM cursos WHERE nome = 'História'), 0.52, 'julia.his@ufsm.br', '888.999.000-27', '2003-08-01', '(55) 99999-0068', 'Rua da Memória, 30', 82.0, 7.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230069', 'Pedro Oliveira', (SELECT id FROM cursos WHERE nome = 'História'), 0.78, 'pedro.his@ufsm.br', '999.000.111-38', '2000-12-10', '(55) 99999-0069', 'Travessa da Crônica, 40', 70.0, 6.2);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230070', 'Rafaela Costa', (SELECT id FROM cursos WHERE nome = 'História'), 0.92, 'rafaela.his@ufsm.br', '000.111.222-49', '2004-05-18', '(55) 99999-0070', 'Rua dos Arquivos, 50', 65.0, 5.5);

-- Inserindo 5 alunos para o curso de Geografia (15)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230071', 'Luiza Campos', (SELECT id FROM cursos WHERE nome = 'Geografia'), 0.19, 'luiza.geo@ufsm.br', '111.222.333-51', '2002-09-08', '(55) 99999-0071', 'Rua do Mapa, 10', 96.0, 9.4);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230072', 'Mariana Rocha', (SELECT id FROM cursos WHERE nome = 'Geografia'), 0.31, 'mariana.geo@ufsm.br', '222.333.444-62', '2001-01-22', '(55) 99999-0072', 'Av. do Planeta, 20', 90.0, 8.6);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230073', 'Lucas Gomes', (SELECT id FROM cursos WHERE nome = 'Geografia'), 0.54, 'lucas.geo@ufsm.br', '333.444.555-73', '2003-05-15', '(55) 99999-0073', 'Rua dos Continentes, 30', 84.0, 7.7);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230074', 'Paulo Henrique', (SELECT id FROM cursos WHERE nome = 'Geografia'), 0.76, 'paulo.geo@ufsm.br', '444.555.666-84', '2000-11-29', '(55) 99999-0074', 'Travessa dos Rios, 40', 76.0, 6.9);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230075', 'Sofia Nogueira', (SELECT id FROM cursos WHERE nome = 'Geografia'), 0.91, 'sofia.geo@ufsm.br', '555.666.777-95', '2004-04-03', '(55) 99999-0075', 'Rua das Montanhas, 50', 69.0, 5.8);

-- Inserindo 5 alunos para o curso de Sociologia (16)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230076', 'Amanda Lima', (SELECT id FROM cursos WHERE nome = 'Sociologia'), 0.10, 'amanda.soc@ufsm.br', '666.777.888-06', '2002-07-07', '(55) 99999-0076', 'Rua da Sociedade, 10', 97.0, 9.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230077', 'Bruno Pires', (SELECT id FROM cursos WHERE nome = 'Sociologia'), 0.28, 'bruno.soc@ufsm.br', '777.888.999-17', '2001-02-14', '(55) 99999-0077', 'Av. da Cultura, 20', 91.0, 8.7);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230078', 'Cristina Duarte', (SELECT id FROM cursos WHERE nome = 'Sociologia'), 0.45, 'cristina.soc@ufsm.br', '888.999.000-28', '2003-05-19', '(55) 99999-0078', 'Rua dos Grupos, 30', 85.0, 7.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230079', 'Daniela Mendes', (SELECT id FROM cursos WHERE nome = 'Sociologia'), 0.65, 'daniela.soc@ufsm.br', '999.000.111-39', '2000-10-22', '(55) 99999-0079', 'Travessa das Relações, 40', 75.0, 6.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230080', 'Felipe Nunes', (SELECT id FROM cursos WHERE nome = 'Sociologia'), 0.85, 'felipe.soc@ufsm.br', '000.111.222-50', '2004-03-08', '(55) 99999-0080', 'Rua das Comunidades, 50', 65.0, 5.2);

-- Inserindo 5 alunos para o curso de Letras (17)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230081', 'Ana Paula', (SELECT id FROM cursos WHERE nome = 'Letras'), 0.12, 'ana.letras@ufsm.br', '111.222.333-61', '2002-09-15', '(55) 99999-0081', 'Rua da Gramática, 10', 98.0, 9.6);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230082', 'Carlos Eduardo', (SELECT id FROM cursos WHERE nome = 'Letras'), 0.35, 'carlos.letras@ufsm.br', '222.333.444-72', '2001-04-20', '(55) 99999-0082', 'Av. da Literatura, 20', 92.0, 8.9);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230083', 'Laura Santos', (SELECT id FROM cursos WHERE nome = 'Letras'), 0.58, 'laura.letras@ufsm.br', '333.444.555-83', '2003-01-30', '(55) 99999-0083', 'Rua da Poesia, 30', 86.0, 7.7);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230084', 'Marcelo Costa', (SELECT id FROM cursos WHERE nome = 'Letras'), 0.77, 'marcelo.letras@ufsm.br', '444.555.666-94', '2000-11-18', '(55) 99999-0084', 'Travessa das Palavras, 40', 75.0, 6.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230085', 'Patrícia Rocha', (SELECT id FROM cursos WHERE nome = 'Letras'), 0.95, 'patricia.letras@ufsm.br', '555.666.777-05', '2004-06-05', '(55) 99999-0085', 'Rua da Crítica, 50', 68.0, 5.3);

-- Inserindo 5 alunos para o curso de Pedagogia (18)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230086', 'Cláudia Ribeiro', (SELECT id FROM cursos WHERE nome = 'Pedagogia'), 0.11, 'claudia.pedag@ufsm.br', '666.777.888-16', '2002-10-22', '(55) 99999-0086', 'Rua da Educação, 10', 97.0, 9.4);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230087', 'Guilherme Neves', (SELECT id FROM cursos WHERE nome = 'Pedagogia'), 0.30, 'guilherme.pedag@ufsm.br', '777.888.999-27', '2001-03-05', '(55) 99999-0087', 'Av. da Aprendizagem, 20', 92.0, 8.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230088', 'Júlia Lopes', (SELECT id FROM cursos WHERE nome = 'Pedagogia'), 0.50, 'julia.pedag@ufsm.br', '888.999.000-38', '2003-07-15', '(55) 99999-0088', 'Rua do Conhecimento, 30', 88.0, 7.9);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230089', 'Lucas Oliveira', (SELECT id FROM cursos WHERE nome = 'Pedagogia'), 0.70, 'lucas.pedag@ufsm.br', '999.000.111-49', '2000-12-01', '(55) 99999-0089', 'Travessa dos Professores, 40', 78.0, 6.7);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230090', 'Mariana Dantas', (SELECT id FROM cursos WHERE nome = 'Pedagogia'), 0.90, 'mariana.pedag@ufsm.br', '000.111.222-50', '2004-05-12', '(55) 99999-0090', 'Rua do Ensino, 50', 68.0, 5.5);

-- Inserindo 5 alunos para o curso de Jornalismo (19)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230091', 'Felipe Lima', (SELECT id FROM cursos WHERE nome = 'Jornalismo'), 0.15, 'felipe.jor@ufsm.br', '111.222.333-61', '2002-11-20', '(55) 99999-0091', 'Rua da Notícia, 10', 98.0, 9.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230092', 'Gabriela Fernandes', (SELECT id FROM cursos WHERE nome = 'Jornalismo'), 0.35, 'gabriela.jor@ufsm.br', '222.333.444-72', '2001-04-10', '(55) 99999-0092', 'Av. da Comunicação, 20', 91.0, 8.9);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230093', 'Isabela Gomes', (SELECT id FROM cursos WHERE nome = 'Jornalismo'), 0.55, 'isabela.jor@ufsm.br', '333.444.555-83', '2003-08-25', '(55) 99999-0093', 'Rua da Reportagem, 30', 85.0, 7.7);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230094', 'Mateus Rocha', (SELECT id FROM cursos WHERE nome = 'Jornalismo'), 0.75, 'mateus.jor@ufsm.br', '444.555.666-94', '2000-10-15', '(55) 99999-0094', 'Travessa da Informação, 40', 75.0, 6.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230095', 'Lígia Carvalho', (SELECT id FROM cursos WHERE nome = 'Jornalismo'), 0.95, 'ligia.jor@ufsm.br', '555.666.777-05', '2004-02-02', '(55) 99999-0095', 'Rua da Imprensa, 50', 65.0, 5.2);

-- Inserindo 5 alunos para o curso de Agronomia (20)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230096', 'André Pires', (SELECT id FROM cursos WHERE nome = 'Agronomia'), 0.12, 'andre.agr@ufsm.br', '666.777.888-16', '2002-12-12', '(55) 99999-0096', 'Rua do Campo, 10', 97.0, 9.2);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230097', 'Bárbara Silva', (SELECT id FROM cursos WHERE nome = 'Agronomia'), 0.32, 'barbara.agr@ufsm.br', '777.888.999-27', '2001-05-15', '(55) 99999-0097', 'Av. da Plantação, 20', 90.0, 8.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230098', 'Carlos Eduardo', (SELECT id FROM cursos WHERE nome = 'Agronomia'), 0.52, 'carlos.agr@ufsm.br', '888.999.000-38', '2003-09-20', '(55) 99999-0098', 'Rua da Colheita, 30', 84.0, 7.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230099', 'Juliana Rocha', (SELECT id FROM cursos WHERE nome = 'Agronomia'), 0.72, 'juliana.agr@ufsm.br', '999.000.111-49', '2000-11-28', '(55) 99999-0099', 'Travessa da Agricultura, 40', 76.0, 6.7);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230100', 'Larissa Gomes', (SELECT id FROM cursos WHERE nome = 'Agronomia'), 0.92, 'larissa.agr@ufsm.br', '000.111.222-60', '2004-03-03', '(55) 99999-0100', 'Rua da Semente, 50', 66.0, 5.5);

-- Inserindo 5 alunos para o curso de Engenharia Ambiental (21)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230101', 'Fábio Diniz', (SELECT id FROM cursos WHERE nome = 'Engenharia Ambiental'), 0.14, 'fabio.amb@ufsm.br', '111.222.333-71', '2002-09-01', '(55) 99999-0101', 'Rua do Meio Ambiente, 10', 96.0, 9.3);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230102', 'Gabriela Ramos', (SELECT id FROM cursos WHERE nome = 'Engenharia Ambiental'), 0.38, 'gabriela.amb@ufsm.br', '222.333.444-82', '2001-02-18', '(55) 99999-0102', 'Av. da Natureza, 20', 89.0, 8.6);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230103', 'Henrique Costa', (SELECT id FROM cursos WHERE nome = 'Engenharia Ambiental'), 0.60, 'henrique.amb@ufsm.br', '333.444.555-93', '2003-05-25', '(55) 99999-0103', 'Rua da Sustentabilidade, 30', 82.0, 7.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230104', 'Mariana Dutra', (SELECT id FROM cursos WHERE nome = 'Engenharia Ambiental'), 0.82, 'mariana.amb@ufsm.br', '444.555.666-04', '2000-11-15', '(55) 99999-0104', 'Travessa da Ecologia, 40', 72.0, 6.2);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230105', 'Pedro Santos', (SELECT id FROM cursos WHERE nome = 'Engenharia Ambiental'), 0.96, 'pedro.amb@ufsm.br', '555.666.777-15', '2004-04-10', '(55) 99999-0105', 'Rua da Biodiversidade, 50', 62.0, 5.0);

-- Inserindo 5 alunos para o curso de Ciências Ambientais (22)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230106', 'Sofia Farias', (SELECT id FROM cursos WHERE nome = 'Ciências Ambientais'), 0.10, 'sofia.amb@ufsm.br', '666.777.888-26', '2002-08-10', '(55) 99999-0106', 'Rua da Proteção, 10', 98.0, 9.6);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230107', 'Thiago Lima', (SELECT id FROM cursos WHERE nome = 'Ciências Ambientais'), 0.25, 'thiago.amb@ufsm.br', '777.888.999-37', '2001-01-28', '(55) 99999-0107', 'Av. dos Ecossistemas, 20', 93.0, 8.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230108', 'Valéria Nunes', (SELECT id FROM cursos WHERE nome = 'Ciências Ambientais'), 0.45, 'valeria.amb@ufsm.br', '888.999.000-48', '2003-04-05', '(55) 99999-0108', 'Rua do Clima, 30', 88.0, 8.1);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230109', 'Wilson Costa', (SELECT id FROM cursos WHERE nome = 'Ciências Ambientais'), 0.65, 'wilson.amb@ufsm.br', '999.000.111-59', '2000-10-12', '(55) 99999-0109', 'Travessa da Floresta, 40', 78.0, 7.0);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230110', 'Yasmin Melo', (SELECT id FROM cursos WHERE nome = 'Ciências Ambientais'), 0.85, 'yasmin.amb@ufsm.br', '000.111.222-60', '2004-03-20', '(55) 99999-0110', 'Rua do Oceano, 50', 68.0, 6.0);

-- Inserindo 5 alunos para o curso de Direito (23)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230111', 'Rodrigo Farias', (SELECT id FROM cursos WHERE nome = 'Direito'), 0.15, 'rodrigo.dir@ufsm.br', '111.222.333-71', '2002-05-18', '(55) 99999-0111', 'Rua da Justiça, 10', 97.0, 9.4);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230112', 'Sabrina Lima', (SELECT id FROM cursos WHERE nome = 'Direito'), 0.35, 'sabrina.dir@ufsm.br', '222.333.444-82', '2001-09-09', '(55) 99999-0112', 'Av. das Leis, 20', 91.0, 8.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230113', 'Tiago Almeida', (SELECT id FROM cursos WHERE nome = 'Direito'), 0.55, 'tiago.dir@ufsm.br', '333.444.555-93', '2003-01-25', '(55) 99999-0113', 'Rua do Código, 30', 85.0, 7.9);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230114', 'Vanessa Costa', (SELECT id FROM cursos WHERE nome = 'Direito'), 0.75, 'vanessa.dir@ufsm.br', '444.555.666-04', '2000-11-11', '(55) 99999-0114', 'Travessa do Tribunal, 40', 75.0, 6.7);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230115', 'Wagner Silva', (SELECT id FROM cursos WHERE nome = 'Direito'), 0.95, 'wagner.dir@ufsm.br', '555.666.777-15', '2004-06-03', '(55) 99999-0115', 'Rua do Foro, 50', 65.0, 5.2);

-- Inserindo 5 alunos para o curso de Relações Internacionais (24)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230116', 'Maria Clara', (SELECT id FROM cursos WHERE nome = 'Relações Internacionais'), 0.10, 'maria.ri@ufsm.br', '666.777.888-26', '2002-08-08', '(55) 99999-0116', 'Rua da Diplomacia, 10', 99.0, 9.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230117', 'Pedro Rocha', (SELECT id FROM cursos WHERE nome = 'Relações Internacionais'), 0.30, 'pedro.ri@ufsm.br', '777.888.999-37', '2001-03-20', '(55) 99999-0117', 'Av. dos Acordos, 20', 93.0, 8.9);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230118', 'Camila Soares', (SELECT id FROM cursos WHERE nome = 'Relações Internacionais'), 0.50, 'camila.ri@ufsm.br', '888.999.000-48', '2003-07-05', '(55) 99999-0118', 'Rua da Globalização, 30', 87.0, 7.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230119', 'Felipe Nunes', (SELECT id FROM cursos WHERE nome = 'Relações Internacionais'), 0.70, 'felipe.ri@ufsm.br', '999.000.111-59', '2000-12-15', '(55) 99999-0119', 'Travessa das Nações, 40', 77.0, 6.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230120', 'Isabella Lima', (SELECT id FROM cursos WHERE nome = 'Relações Internacionais'), 0.90, 'isabella.ri@ufsm.br', '000.111.222-70', '2004-04-10', '(55) 99999-0120', 'Rua dos Tratados, 50', 67.0, 5.0);

-- Inserindo 5 alunos para o curso de Contabilidade (25)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230121', 'Roberto Alves', (SELECT id FROM cursos WHERE nome = 'Contabilidade'), 0.15, 'roberto.ctb@ufsm.br', '111.222.333-81', '2002-11-22', '(55) 99999-0121', 'Rua dos Números, 10', 97.0, 9.1);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230122', 'Sandra Rocha', (SELECT id FROM cursos WHERE nome = 'Contabilidade'), 0.40, 'sandra.ctb@ufsm.br', '222.333.444-92', '2001-02-28', '(55) 99999-0122', 'Av. das Finanças, 20', 90.0, 8.4);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230123', 'Tiago Mendes', (SELECT id FROM cursos WHERE nome = 'Contabilidade'), 0.60, 'tiago.ctb@ufsm.br', '333.444.555-03', '2003-05-08', '(55) 99999-0123', 'Rua da Gestão, 30', 84.0, 7.6);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230124', 'Verônica Dutra', (SELECT id FROM cursos WHERE nome = 'Contabilidade'), 0.80, 'veronica.ctb@ufsm.br', '444.555.666-14', '2000-11-20', '(55) 99999-0124', 'Travessa dos Balanços, 40', 74.0, 6.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230125', 'Wilson Gomes', (SELECT id FROM cursos WHERE nome = 'Contabilidade'), 0.98, 'wilson.ctb@ufsm.br', '555.666.777-25', '2004-03-02', '(55) 99999-0125', 'Rua dos Lucros, 50', 60.0, 5.0);

-- Inserindo 5 alunos para o curso de Ciências Econômicas (26)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230126', 'Aline Vieira', (SELECT id FROM cursos WHERE nome = 'Ciências Econômicas'), 0.10, 'aline.eco@ufsm.br', '666.777.888-36', '2002-09-09', '(55) 99999-0126', 'Rua da Economia, 10', 98.0, 9.6);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230127', 'Carlos Silva', (SELECT id FROM cursos WHERE nome = 'Ciências Econômicas'), 0.28, 'carlos.eco@ufsm.br', '777.888.999-47', '2001-04-14', '(55) 99999-0127', 'Av. dos Mercados, 20', 92.0, 8.9);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230128', 'Lúcia Costa', (SELECT id FROM cursos WHERE nome = 'Ciências Econômicas'), 0.49, 'lucia.eco@ufsm.br', '888.999.000-58', '2003-01-30', '(55) 99999-0128', 'Rua das Moedas, 30', 87.0, 7.8);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230129', 'Marcos Oliveira', (SELECT id FROM cursos WHERE nome = 'Ciências Econômicas'), 0.71, 'marcos.eco@ufsm.br', '999.000.111-69', '2000-11-18', '(55) 99999-0129', 'Travessa da Renda, 40', 76.0, 6.7);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230130', 'Patrícia Rocha', (SELECT id FROM cursos WHERE nome = 'Ciências Econômicas'), 0.94, 'patricia.eco@ufsm.br', '000.111.222-70', '2004-06-05', '(55) 99999-0130', 'Rua do Capital, 50', 65.0, 5.5);

-- Inserindo 5 alunos para o curso de Publicidade (27)
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230131', 'Daniela Almeida', (SELECT id FROM cursos WHERE nome = 'Publicidade'), 0.13, 'daniela.pub@ufsm.br', '111.222.333-81', '2002-08-28', '(55) 99999-0131', 'Rua da Criatividade, 10', 95.0, 9.2);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230132', 'Guilherme Neves', (SELECT id FROM cursos WHERE nome = 'Publicidade'), 0.38, 'guilherme.pub@ufsm.br', '222.333.444-92', '2001-02-15', '(55) 99999-0132', 'Av. das Marcas, 20', 89.0, 8.6);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230133', 'Isabela Lopes', (SELECT id FROM cursos WHERE nome = 'Publicidade'), 0.62, 'isabela.pub@ufsm.br', '333.444.555-03', '2003-05-18', '(55) 99999-0133', 'Rua da Propaganda, 30', 83.0, 7.5);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230134', 'Lucas Rodrigues', (SELECT id FROM cursos WHERE nome = 'Publicidade'), 0.81, 'lucas.pub@ufsm.br', '444.555.666-14', '2000-11-01', '(55) 99999-0134', 'Travessa da Mídia, 40', 74.0, 6.3);
INSERT INTO alunos (matricula, nome, curso_id, risco, email, cpf, nascimento, telefone, endereco, frequencia, media) VALUES
    ('20230135', 'Mariana Dantas', (SELECT id FROM cursos WHERE nome = 'Publicidade'), 0.97, 'mariana.pub@ufsm.br', '555.666.777-25', '2004-04-12', '(55) 99999-0135', 'Rua da Campanha, 50', 63.0, 5.1);
