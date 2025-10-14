-- #######################################################################
-- Flyway espera SQL PURE. Removidos os comandos \set e \unset.
-- A senha '1234' foi inserida diretamente em cada linha.
-- !!! AVISO DE SEGURANÇA: SENHAS EM TEXTO PURO NÃO SÃO RECOMENDADAS !!!
-- #######################################################################

-- 1. Usuário Geral (Admin)
INSERT INTO usuario (nome, email, senha, permissao, centro_id, curso_id) VALUES
    ('Super Admin', 'admin@universidade.br', '1234', 'GERAL', NULL, NULL);

-- 2. Usuário de Tecnologia (Coordenador de Centro)
INSERT INTO usuario (nome, email, senha, permissao, centro_id, curso_id) VALUES
    ('Coordenador CT', 'coord.ct@universidade.br', '1234', 'CENTRO', (SELECT id FROM centros WHERE sigla = 'CT'), NULL);

-- 3. Usuário de Engenharia de Software (Coordenador de Curso)
INSERT INTO usuario (nome, email, senha, permissao, centro_id, curso_id) VALUES
    ('Prof. Eng. Software', 'prof.es@universidade.br', '1234', 'CURSO',NULL, (SELECT id FROM cursos WHERE nome = 'Engenharia de Software'));

-- 4. Usuário de Ciências da Saúde (Coordenador de Centro)
INSERT INTO usuario (nome, email, senha, permissao, centro_id, curso_id) VALUES
    ('Coordenador CCS', 'coord.ccs@universidade.br', '1234', 'CENTRO', (SELECT id FROM centros WHERE sigla = 'CCS'), NULL);

-- 5. Usuário de Medicina (Coordenador de Curso)
INSERT INTO usuario (nome, email, senha, permissao, centro_id, curso_id) VALUES
    ('Prof. Medicina', 'prof.medicina@universidade.br', '1234', 'CURSO', NULL, (SELECT id FROM cursos WHERE nome = 'Medicina'));

-- 6. Usuário de Ciências Humanas (Coordenador de Centro)
INSERT INTO usuario (nome, email, senha, permissao, centro_id, curso_id) VALUES
    ('Coordenador CCH', 'coord.cch@universidade.br', '1234', 'CENTRO', (SELECT id FROM centros WHERE sigla = 'CCH'), NULL);

-- 7. Usuário de História (Coordenador de Curso)
INSERT INTO usuario (nome, email, senha, permissao, centro_id, curso_id) VALUES
    ('Prof. História', 'prof.historia@universidade.br', '1234', 'CURSO', NULL, (SELECT id FROM cursos WHERE nome = 'História'));

-- 8. Usuário de Ciências da Gestão (Coordenador de Centro)
INSERT INTO usuario (nome, email, senha, permissao, centro_id, curso_id) VALUES
    ('Coordenador CCG', 'coord.ccg@universidade.br', '1234', 'CENTRO', (SELECT id FROM centros WHERE sigla = 'CCG'), NULL);

-- 9. Usuário de Administração (Coordenador de Curso)
INSERT INTO usuario (nome, email, senha, permissao, centro_id, curso_id) VALUES
    ('Prof. Administração', 'prof.adm@universidade.br', '1234', 'CURSO', NULL, (SELECT id FROM cursos WHERE nome = 'Administração'));

-- 10. Usuário Geral (Secretaria)
INSERT INTO usuario (nome, email, senha, permissao, centro_id, curso_id) VALUES
    ('Secretaria Geral', 'secretaria@universidade.br', '1234', 'GERAL', NULL, NULL);

-- 11. Usuário Desativado (Exemplo)
INSERT INTO usuario (nome, email, senha, ativo, permissao, centro_id, curso_id) VALUES
    ('Usuário Inativo', 'inativo@universidade.br', '1234', FALSE, 'GERAL', NULL, NULL);

-- 12. Usuário de Direito (Coordenador de Curso)
INSERT INTO usuario (nome, email, senha, permissao, centro_id, curso_id) VALUES
    ('Prof. Direito', 'prof.direito@universidade.br', '1234', 'CURSO', NULL, (SELECT id FROM cursos WHERE nome = 'Direito'));