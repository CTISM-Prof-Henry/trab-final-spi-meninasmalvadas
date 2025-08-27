CREATE TABLE usuario (
        id SERIAL PRIMARY KEY,          -- Identificador único
        nome VARCHAR(100) NOT NULL,     -- Nome completo
        email VARCHAR(150) UNIQUE NOT NULL, -- Email deve ser único
        senha VARCHAR(255) NOT NULL,    -- Senha (armazenar hash, não a senha em texto puro)
        ativo BOOLEAN DEFAULT TRUE      -- Status do usuário
);