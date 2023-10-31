-- Tabela Personagem
CREATE TABLE
  Personagem (
    idPersonagem INT PRIMARY KEY AUTO_INCREMENT,
    alma INT DEFAULT 0,
    local INT UNIQUE,
    tipoP INT NOT NULL
  );

-- Tabela Loot
CREATE TABLE
  Loot (
    local INT FOREIGN KEY REFERENCES Local (idLocal),
    item INT FOREIGN KEY REFERENCES Item (idItem)
  );

-- Tabela Coletadas
CREATE TABLE
  Coletadas (
    personagem INT FOREIGN KEY REFERENCES PersonagemJogavel (idPersonagem),
    alma VARCHAR(255) FOREIGN KEY REFERENCES Alma (nome),
  );

-- Tabela Ataque
CREATE TABLE
  Ataque (
    idAtaque INT PRIMARY KEY AUTO_INCREMENT,
    tipoAtaque INT NOT NULL,
    descrição VARCHAR(255) DEFAULT '',
    idHabilidade INT FOREIGN KEY REFERENCES Habilidade (idHabilidade),
    danoFisico INT DEFAULT 0,
    danoMagico INT DEFAULT 0
  );

-- Tabela Item
CREATE TABLE
  Item (
    idItem INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255) NOT NULL,
    idInventario INT FOREIGN KEY REFERENCES Inventario (idInventario),
    lojista INT FOREIGN KEY REFERENCES Lojista (idLojista)
  );

-- Tabela Armadura
CREATE TABLE
  Armadura (
    idItem INT FOREIGN KEY REFERENCES Item (idItem),
    defesa INT DEFAULT 0,
    defesaMagica INT DEFAULT 0,
    agilidade INT DEFAULT 0,
    descrição VARCHAR(255) DEFAULT '',
    valor INT DEFAULT 0,
    nome VARCHAR(255) NOT NULL
  );

-- Tabela Local
CREATE TABLE
  Local (idLocal INT PRIMARY KEY AUTO_INCREMENT);

-- Tabela Estoque
CREATE TABLE
  Estoque (
    idLojista INT FOREIGN KEY REFERENCES Lojista (idLojista),
    idItem INT FOREIGN KEY REFERENCES Item (idItem)
  );

-- Tabela Arma
CREATE TABLE
  Arma (
    idItem INT FOREIGN KEY REFERENCES Item (idItem),
    ataqueFisico INT DEFAULT 0,
    ataqueMagico INT DEFAULT 0,
    descrição VARCHAR(255) DEFAULT '',
    valor INT DEFAULT 0,
    nome VARCHAR(255) NOT NULL
  );

-- Tabela Acessorio
CREATE TABLE
  Acessorio (
    idItem INT FOREIGN KEY REFERENCES Item (idItem),
    defesa INT DEFAULT 0,
    defesaMagica INT DEFAULT 0,
    agilidade INT DEFAULT 0,
    ataqueFisico INT DEFAULT 0,
    ataqueMagico INT DEFAULT 0,
    descrição VARCHAR(255) DEFAULT '',
    valor INT DEFAULT 0,
    nome VARCHAR(255) NOT NULL
  );

-- Tabela Lojista
CREATE TABLE
  Lojista (
    idLojista INT PRIMARY KEY AUTO_INCREMENT,
    idInventario INT FOREIGN KEY REFERENCES Inventario (idInventario) agilidade INT DEFAULT 0,
    defesaMagica INT DEFAULT 0,
    defesa INT DEFAULT 0,
    ataque INT DEFAULT 0,
    nome VARCHAR(255) NOT NULL
  );

-- Tabela Personagem Não Jogável
CREATE TABLE
  PNJ (
    idPersonagem INT FOREIGN KEY REFERENCES Personagem (idPersonagem),
    tipoPnj NOT NULL
  );

-- Tabela Inimigo
CREATE TABLE
  Inimigo (
    idPersonagem INT PRIMARY KEY AUTO_INCREMENT,
    defesa INT DEFAULT 0,
    agilidade INT DEFAULT 0,
    ataque INT DEFAULT 0,
    nome VARCHAR(255) NOT NULL,
    defesaMagica INT DEFAULT 0
  );

-- Tabela Legivel
CREATE TABLE
  Legivel (
    idItem INT PRIMARY KEY AUTO_INCREMENT,
    conteúdo VARCHAR(255) DEFAULT '',
    valor INT DEFAULT 0,
    descrição VARCHAR(255) DEFAULT '',
    nome VARCHAR(255) NOT NULL
  );

-- Tabela Consumivel
CREATE TABLE
  Consumivel (
    idItem INT PRIMARY KEY AUTO_INCREMENT,
    adHp INT NOT NULL,
    adMente INT NOT NULL,
    descrição VARCHAR(255) DEFAULT '',
    valor INT DEFAULT 0,
    nome VARCHAR(255) NOT NULL
  );

-- Tabela Inventario
CREATE TABLE
  Inventario (
    idInventario INT PRIMARY KEY AUTO_INCREMENT,
    idPersonagem INT FOREIGN KEY REFERENCES Personagem (idPersonagem)
  );

-- Tabela Alma
CREATE TABLE
  Alma (
    nome VARCHAR(255) PRIMARY KEY,
    personagem INT FOREIGN KEY REFERENCES Personagem (idPersonagem)
  );

-- Tabela Personagem Jogável
CREATE TABLE
  PersonagemJogavel (
    corpo INT NOT NULL,
    mente INT NOT NULL,
    defesa INT NOT NULL,
    agilidade INT NOT NULL,
    ataque INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    defesaMagica INT NOT NULL,
    idPersonagem INT FOREIGN KEY REFERENCES Personagem (idPersonagem),
    acessorio1 INT FOREIGN KEY REFERENCES Item (idItem),
    acessorio2 INT FOREIGN KEY REFERENCES Item (idItem),
    Arma INT FOREIGN KEY REFERENCES Item (idItem),
    Armadura INT FOREIGN KEY REFERENCES Item (idItem)
  );

-- Tabela Habilidade
CREATE TABLE
  Habilidade (
    idHabilidade INT PRIMARY KEY AUTO_INCREMENT,
    custo INT NOT NULL,
    alma VARCHAR(255) FOREIGN KEY REFERENCES Alma (Nome)
  );

-- Tabela Genital
CREATE TABLE
  Genital (
    idParte INT PRIMARY KEY,
    Personagem INT FOREIGN KEY REFERENCES Personagem (idPersonagem),
    tipoParte INT UNIQUE,
    hpMaximo INT NOT NULL,
    hitChance INT NOT NULL,
    hpAtual INT NOT NULL
  );

-- Tabela Cabeca
CREATE TABLE
  Cabeca (
    idParte INT PRIMARY KEY,
    Personagem INT FOREIGN KEY REFERENCES Personagem (idPersonagem),
    tipoParte INT UNIQUE,
    hpMaximo INT NOT NULL,
    hitChance INT NOT NULL,
    hpAtual INT NOT NULL
  );

-- Tabela Olho
CREATE TABLE
  Olho (
    idParte INT PRIMARY KEY,
    Personagem INT FOREIGN KEY REFERENCES Personagem (idPersonagem),
    tipoParte INT UNIQUE,
    hpMaximo INT NOT NULL,
    hitChance INT NOT NULL,
    hpAtual INT NOT NULL
  );

-- Tabela Braco
CREATE TABLE
  Braco (
    idParte INT PRIMARY KEY,
    Personagem INT FOREIGN KEY REFERENCES Personagem (idPersonagem),
    tipoParte INT UNIQUE,
    hpMaximo INT NOT NULL,
    hitChance INT NOT NULL,
    hpAtual INT NOT NULL
  );

-- Tabela Torco
CREATE TABLE
  Torco (
    idParte INT PRIMARY KEY,
    Personagem INT FOREIGN KEY REFERENCES Personagem (idPersonagem),
    tipoParte INT UNIQUE,
    hpMaximo INT NOT NULL,
    hitChance INT NOT NULL,
    hpAtual INT NOT NULL
  );

-- Tabela Perna
CREATE TABLE
  Perna (
    idParte INT PRIMARY KEY,
    Personagem INT FOREIGN KEY REFERENCES Personagem (idPersonagem),
    tipoParte INT UNIQUE,
    hpMaximo INT NOT NULL,
    hitChance INT NOT NULL,
    hpAtual INT NOT NULL
  );