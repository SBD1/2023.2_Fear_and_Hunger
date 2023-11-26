-- Tabela Local
CREATE TABLE Local (
    idLocal SERIAL PRIMARY KEY
);

-- Tabela Personagem
CREATE TABLE Personagem (
    idPersonagem SERIAL PRIMARY KEY,
    alma INT DEFAULT 0,
    local INT UNIQUE,
    tipoP INT NOT NULL
);

-- Tabela Inventario
CREATE TABLE Inventario (
    idInventario SERIAL PRIMARY KEY,
    idPersonagem INT REFERENCES Personagem (idPersonagem)
);

-- Tabela Lojista
CREATE TABLE Lojista (
    idLojista SERIAL PRIMARY KEY,
    idInventario INT REFERENCES Inventario (idInventario),
    agilidade INT DEFAULT 0,
    defesaMagica INT DEFAULT 0,
    defesa INT DEFAULT 0,
    ataque INT DEFAULT 0,
    nome VARCHAR(255) NOT NULL
);

-- Tabela Item
CREATE TABLE Item (
    idItem SERIAL PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    idInventario INT REFERENCES Inventario (idInventario),
    lojista INT REFERENCES Lojista (idLojista)
);

-- Tabela Loot
CREATE TABLE Loot (
    local INT REFERENCES Local (idLocal),
    item INT REFERENCES Item (idItem)
);

-- Tabela Personagem Jogável
CREATE TABLE PersonagemJogavel (
    corpo INT NOT NULL,
    mente INT NOT NULL,
    defesa INT NOT NULL,
    agilidade INT NOT NULL,
    ataque INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    defesaMagica INT NOT NULL,
    idPersonagem INT PRIMARY KEY REFERENCES Personagem (idPersonagem),
    acessorio1 INT REFERENCES Item (idItem),
    acessorio2 INT REFERENCES Item (idItem),
    Arma INT REFERENCES Item (idItem),
    Armadura INT REFERENCES Item (idItem)
);

-- Tabela Alma
CREATE TABLE Alma (
    nome VARCHAR(255) PRIMARY KEY,
    personagem INT REFERENCES Personagem (idPersonagem)
);

-- Tabela Coletadas
CREATE TABLE Coletadas (
    personagem INT REFERENCES PersonagemJogavel (idPersonagem),
    alma VARCHAR(255) REFERENCES Alma (nome)
);

-- Tabela Habilidade
CREATE TABLE Habilidade (
    idHabilidade SERIAL PRIMARY KEY,
    custo INT NOT NULL,
    alma VARCHAR(255) REFERENCES Alma (nome)
);

-- Tabela Ataque
CREATE TABLE Ataque (
    idAtaque SERIAL PRIMARY KEY,
    tipoAtaque INT NOT NULL,
    descricao VARCHAR(255) DEFAULT '',
    idHabilidade INT REFERENCES Habilidade (idHabilidade),
    danoFisico INT DEFAULT 0,
    danoMagico INT DEFAULT 0
);

-- Tabela Armadura
CREATE TABLE Armadura (
    idItem INT PRIMARY KEY REFERENCES Item (idItem),
    defesa INT DEFAULT 0,
    defesaMagica INT DEFAULT 0,
    agilidade INT DEFAULT 0,
    descricao VARCHAR(255) DEFAULT '',
    valor INT DEFAULT 0,
    nome VARCHAR(255) NOT NULL
);



-- Tabela Estoque
CREATE TABLE Estoque (
    idLojista INT REFERENCES Lojista (idLojista),
    idItem INT REFERENCES Item (idItem)
);

-- Tabela Arma
CREATE TABLE Arma (
    idItem INT PRIMARY KEY REFERENCES Item (idItem),
    ataqueFisico INT DEFAULT 0,
    ataqueMagico INT DEFAULT 0,
    descricao VARCHAR(255) DEFAULT '',
    valor INT DEFAULT 0,
    nome VARCHAR(255) NOT NULL
);

-- Tabela Acessorio
CREATE TABLE Acessorio (
    idItem INT PRIMARY KEY REFERENCES Item (idItem),
    defesa INT DEFAULT 0,
    defesaMagica INT DEFAULT 0,
    agilidade INT DEFAULT 0,
    ataqueFisico INT DEFAULT 0,
    ataqueMagico INT DEFAULT 0,
    descricao VARCHAR(255) DEFAULT '',
    valor INT DEFAULT 0,
    nome VARCHAR(255) NOT NULL
);

-- Tabela Personagem Não Jogável
CREATE TABLE PNJ (
    idPersonagem INT PRIMARY KEY REFERENCES Personagem (idPersonagem),
    tipoPnj INT NOT NULL
);

-- Tabela Inimigo
CREATE TABLE Inimigo (
    idPersonagem SERIAL PRIMARY KEY,
    defesa INT DEFAULT 0,
    agilidade INT DEFAULT 0,
    ataque INT DEFAULT 0,
    nome VARCHAR(255) NOT NULL,
    defesaMagica INT DEFAULT 0
);

-- Tabela Legivel
CREATE TABLE Legivel (
    idItem INT PRIMARY KEY,
    conteudo VARCHAR(255) DEFAULT '',
    valor INT DEFAULT 0,
    descricao VARCHAR(255) DEFAULT '',
    nome VARCHAR(255) NOT NULL
);

-- Tabela Consumivel
CREATE TABLE Consumivel (
    idItem INT PRIMARY KEY,
    adHp INT NOT NULL,
    adMente INT NOT NULL,
    descricao VARCHAR(255) DEFAULT '',
    valor INT DEFAULT 0,
    nome VARCHAR(255) NOT NULL
);

-- -- Tabela Genital
-- CREATE TABLE Genital (
--     idParte SERIAL PRIMARY KEY,
--     Personagem INT REFERENCES Personagem (idPersonagem),
--     tipoParte INT UNIQUE,
--     hpMaximo INT NOT NULL,
--     hitChance INT NOT NULL,
--     hpAtual INT NOT NULL
-- );

-- -- Tabela Cabeca
-- CREATE TABLE Cabeca (
--     idParte SERIAL PRIMARY KEY,
--     Personagem INT REFERENCES Personagem (idPersonagem),
--     tipoParte INT UNIQUE,
--     hpMaximo INT NOT NULL,
--     hitChance INT NOT NULL,
--     hpAtual INT NOT NULL
-- );

-- -- Tabela Olho
-- CREATE TABLE Olho (
--     idParte SERIAL PRIMARY KEY,
--     Personagem INT REFERENCES Personagem (idPersonagem),
--     tipoParte INT UNIQUE,
--     hpMaximo INT NOT NULL,
--     hitChance INT NOT NULL,
--     hpAtual INT NOT NULL
-- );

-- -- Tabela Braco
-- CREATE TABLE Braco (
--     idParte SERIAL PRIMARY KEY,
--     Personagem INT REFERENCES Personagem (idPersonagem),
--     tipoParte INT UNIQUE,
--     hpMaximo INT NOT NULL,
--     hitChance INT NOT NULL,
--     hpAtual INT NOT NULL
-- );

-- -- Tabela Torco
-- CREATE TABLE Torco (
--     idParte SERIAL PRIMARY KEY,
--     Personagem INT REFERENCES Personagem (idPersonagem),
--     tipoParte INT UNIQUE,
--     hpMaximo INT NOT NULL,
--     hitChance INT NOT NULL,
--     hpAtual INT NOT NULL
-- );

-- -- Tabela Perna
-- CREATE TABLE Perna (
--     idParte SERIAL PRIMARY KEY,
--     Personagem INT REFERENCES Personagem (idPersonagem),
--     tipoParte INT UNIQUE,
--     hpMaximo INT NOT NULL,
--     hitChance INT NOT NULL,
--     hpAtual INT NOT NULL
-- );
