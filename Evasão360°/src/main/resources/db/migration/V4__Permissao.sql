-- 1. Cria o tipo de permissão fixo (CENTRO, CURSO, GERAL)
CREATE TYPE tipo_acesso_enum AS ENUM ('GERAL', 'CENTRO', 'CURSO');

-- 2. Adiciona as colunas na tabela 'usuario'
ALTER TABLE usuario
    -- Coluna de Permissão (GERAL, CENTRO, CURSO)
    ADD COLUMN permissao tipo_acesso_enum NOT NULL DEFAULT 'GERAL',

    -- Chave Estrangeira Opcional para Centro (pode ser NULL)
    ADD COLUMN centro_id INTEGER REFERENCES centros(id) ON DELETE RESTRICT,

    -- Chave Estrangeira Opcional para Curso (pode ser NULL)
    ADD COLUMN curso_id INTEGER REFERENCES cursos(id) ON DELETE RESTRICT;

