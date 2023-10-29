-- Tabela Personagem
CREATE TABLE Personagem (
  idPersonagem INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Alma INT NOT NULL DEFAULT 0,
  Local INT DEFAULT 0,
  TipoP INT NOT NULL DEFAULT 0
);

-- Tabela Ataque
CREATE TABLE Ataque (
  idAtaque INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  tipoAtaque INT NOT NULL DEFAULT 0,
  descricao VARCHAR(255) NOT NULL,
  idHabilidade INT NOT NULL,
  danoFisico INT NOT NULL DEFAULT 0,
  danoMagico INT NOT NULL DEFAULT 0
);

-- Tabela Item
CREATE TABLE Item (
  idItem INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  idInventario INT NOT NULL,
  lojista INT NOT NULL,
  tipo VARCHAR(255) NOT NULL DEFAULT ''
);

-- Tabela Armadura
CREATE TABLE Armadura (
  idItem INT NOT NULL PRIMARY KEY,
  defesa INT NOT NULL DEFAULT 0,
  defesaMagica INT NOT NULL DEFAULT 0,
  agilidade INT NOT NULL DEFAULT 0,
  descricao VARCHAR(255) NOT NULL,
  valor INT NOT NULL DEFAULT 0,
  nome VARCHAR(255) NOT NULL,
  FOREIGN KEY (idItem) REFERENCES Item (idItem) ON DELETE CASCADE
);

-- Tabela Arma
CREATE TABLE Arma (
  idItem INT NOT NULL PRIMARY KEY,
  ataqueFisico INT NOT NULL DEFAULT 0,
  ataqueMagico INT NOT NULL DEFAULT 0,
  descricao VARCHAR(255) NOT NULL,
  valor INT NOT NULL DEFAULT 0,
  nome VARCHAR(255) NOT NULL,
  FOREIGN KEY (idItem) REFERENCES Item (idItem) ON DELETE CASCADE
);

-- Tabela Acessorio
CREATE TABLE Acessorio (
  idItem INT NOT NULL PRIMARY KEY,
  defesa INT NOT NULL DEFAULT 0,
  defesaMagica INT NOT NULL DEFAULT 0,
  agilidade INT NOT NULL DEFAULT 0,
  ataqueFisico INT NOT NULL DEFAULT 0,
  ataqueMagico INT NOT NULL DEFAULT 0,
  descricao VARCHAR(255) NOT NULL,
  valor INT NOT NULL DEFAULT 0,
  nome VARCHAR(255) NOT NULL,
  FOREIGN KEY (idItem) REFERENCES Item (idItem) ON DELETE CASCADE
);

-- Tabela Lojista
CREATE TABLE Lojista (
  idLojista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  idInventario INT NOT NULL,
  nome VARCHAR(255) NOT NULL
);

-- Tabela Personagem Não Jogável
CREATE TABLE PNJ (
  idPnj INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  idPersonagem INT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  FOREIGN KEY (idPersonagem) REFERENCES Personagem (idPersonagem) ON DELETE CASCADE
);

-- Tabela Inimigo
CREATE TABLE Inimigo (
  idPersonagem INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  ataque INT DEFAULT 0,
  defesa INT DEFAULT 0,
  defesaMagica INT DEFAULT 0,
  agilidade INT DEFAULT 0,
  alma INT DEFAULT 0,
  tipo INT DEFAULT 0
);

-- Tabela Legivel
CREATE TABLE Legivel (
  idItem INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descrição VARCHAR(255) DEFAULT '',
  conteúdo VARCHAR(255) DEFAULT '',
  efeito VARCHAR(255) DEFAULT '',
  valor INT DEFAULT 0
);

-- Tabela Consumivel
CREATE TABLE Consumivel (
  idItem INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descrição VARCHAR(255) DEFAULT '',
  efeito VARCHAR(255) DEFAULT '',
  valor INT DEFAULT 0
);

-- Tabela Parte
CREATE TABLE Parte (
  idParte INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  tipo VARCHAR(255) DEFAULT 'Braço',
  idPersonagem INT NOT NULL,
  vidaMaxima INT DEFAULT 0,
  chanceAcerto INT DEFAULT 0,
  vidaAtual INT DEFAULT 0
);

-- Tabela Inventario
CREATE TABLE Inventario (
  idInventario INT NOT NULL PRIMARY KEY,
  idPersonagem INT NOT NULL
);

-- Tabela Alma
CREATE TABLE Alma (
  nome VARCHAR(255) PRIMARY KEY,
  personagem INT NOT NULL,
  FOREIGN KEY (Personagem) REFERENCES Personagem (idPersonagem) ON DELETE CASCADE
);

-- Tabela Personagem Jogável
CREATE TABLE PersonagemJogavel (
  acessorio1 INT,
  acessorio2 INT,
  arma INT,
  armadura INT,
  mente INT NOT NULL,
  corpo INT NOT NULL,
  idPersonagem INT NOT NULL,
  FOREIGN KEY (Acessorio1) REFERENCES Acessorio (idItem),
  FOREIGN KEY (Acessorio2) REFERENCES Acessorio (idItem),
  FOREIGN KEY (Arma) REFERENCES Arma (idItem),
  FOREIGN KEY (Armadura) REFERENCES Armadura (idItem),
  FOREIGN KEY (idPersonagem) REFERENCES Personagem (idPersonagem)
);

-- Tabela Habilidade
CREATE TABLE Habilidade (
  idHabilidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  custo INT NOT NULL DEFAULT 0,
  alma INT NOT NULL,
  FOREIGN KEY (alma) REFERENCES Alma (Nome)
);
