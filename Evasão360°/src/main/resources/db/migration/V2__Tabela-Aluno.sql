CREATE TABLE aluno (
                       matricula VARCHAR(20) PRIMARY KEY,     -- Identificador único do aluno
                       nome VARCHAR(100) NOT NULL,            -- Nome completo
                       curso VARCHAR(100) NOT NULL,           -- Curso
                       risco NUMERIC(4,2) CHECK (risco >= 0 AND risco <= 1), -- Risco (0 a 1)
                       email VARCHAR(150) UNIQUE NOT NULL,    -- Email único
                       cpf VARCHAR(14) UNIQUE NOT NULL,       -- CPF no formato XXX.XXX.XXX-XX
                       nascimento DATE NOT NULL,              -- Data de nascimento
                       telefone VARCHAR(20),                  -- Telefone
                       endereco VARCHAR(200),                 -- Endereço
                       frequencia NUMERIC(5,2) CHECK (frequencia >= 0 AND frequencia <= 100), -- Frequência (%)
                       media NUMERIC(4,2) CHECK (media >= 0 AND media <= 10) -- Média (0 a 10)
);
