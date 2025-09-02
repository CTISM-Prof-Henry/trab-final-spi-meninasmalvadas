CREATE TABLE centros (
     id SERIAL PRIMARY KEY,
     sigla VARCHAR(10) NOT NULL,
     nome VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    centro_id INT NOT NULL,
    FOREIGN KEY (centro_id) REFERENCES centros(id)
);


INSERT INTO centros (sigla, nome) VALUES
('CT', 'Centro de Tecnologia'),
('CCS', 'Centro de Ciências da Saúde'),
('CCH', 'Centro de Ciências Humanas'),
('CCA', 'Centro de Ciências Agrárias'),
('CCJ', 'Centro de Ciências Jurídicas'),
('CCG', 'Centro de Ciências da Gestão');

INSERT INTO cursos (nome, centro_id) VALUES
-- Cursos do Centro de Tecnologia (CT)
('Engenharia Civil', (SELECT id FROM centros WHERE sigla = 'CT')),
('Engenharia de Software', (SELECT id FROM centros WHERE sigla = 'CT')),
('Ciências da Computação', (SELECT id FROM centros WHERE sigla = 'CT')),
('Engenharia Elétrica', (SELECT id FROM centros WHERE sigla = 'CT')),
('Análise e Desenv. de Sistemas', (SELECT id FROM centros WHERE sigla = 'CT')),
('Arquitetura', (SELECT id FROM centros WHERE sigla = 'CT')),
-- Cursos do Centro de Ciências da Saúde (CCS)
('Medicina', (SELECT id FROM centros WHERE sigla = 'CCS')),
('Odontologia', (SELECT id FROM centros WHERE sigla = 'CCS')),
('Fisioterapia', (SELECT id FROM centros WHERE sigla = 'CCS')),
('Nutrição', (SELECT id FROM centros WHERE sigla = 'CCS')),
('Psicologia', (SELECT id FROM centros WHERE sigla = 'CCS')),
('Medicina Veterinária', (SELECT id FROM centros WHERE sigla = 'CCS')),
-- Cursos do Centro de Ciências Humanas (CCH)
('História', (SELECT id FROM centros WHERE sigla = 'CCH')),
('Geografia', (SELECT id FROM centros WHERE sigla = 'CCH')),
('Sociologia', (SELECT id FROM centros WHERE sigla = 'CCH')),
('Letras', (SELECT id FROM centros WHERE sigla = 'CCH')),
('Pedagogia', (SELECT id FROM centros WHERE sigla = 'CCH')),
('Jornalismo', (SELECT id FROM centros WHERE sigla = 'CCH')),
-- Cursos do Centro de Ciências Agrárias (CCA)
('Agronomia', (SELECT id FROM centros WHERE sigla = 'CCA')),
('Engenharia Ambiental', (SELECT id FROM centros WHERE sigla = 'CCA')),
('Ciências Ambientais', (SELECT id FROM centros WHERE sigla = 'CCA')),
-- Cursos do Centro de Ciências Jurídicas (CCJ)
('Direito', (SELECT id FROM centros WHERE sigla = 'CCJ')),
('Relações Internacionais', (SELECT id FROM centros WHERE sigla = 'CCJ')),
-- Cursos do Centro de Ciências da Gestão (CCG)
('Administração', (SELECT id FROM centros WHERE sigla = 'CCG')),
('Contabilidade', (SELECT id FROM centros WHERE sigla = 'CCG')),
('Ciências Econômicas', (SELECT id FROM centros WHERE sigla = 'CCG')),
('Publicidade', (SELECT id FROM centros WHERE sigla = 'CCG'));
