CREATE TABLE Regiao (
  idRegiao SERIAL PRIMARY KEY,
  nomeR VARCHAR(25) NOT NULL,
  descricao TEXT DEFAULT '',
  tranca bool DEFAULT FALSE,
  imgTexto TEXT DEFAULT ''
);

CREATE TABLE Local (
  idLocal SERIAL,
	idRegiao SERIAL REFERENCES Regiao(idRegiao),
  nomeL VARCHAR(25) NOT NULL,
  imgTexto TEXT DEFAULT '',
	CONSTRAINT pk_CE primary key(idLocal, idRegiao)
);

CREATE TABLE Item (
    idItem SERIAL PRIMARY KEY,
	  tipoItem TEXT NOT NULL
);

CREATE TABLE Acessorio(
    idItem SERIAL PRIMARY KEY REFERENCES Item (idItem),
    adAtqM int DEFAULT 0,
    adAgil int DEFAULT 0,
    adDefM int DEFAULT 0,
    adDef int default 0, 
    adAtqF int default 0,
    valor int default 0,
    peso int NOT NULL,
    nome VARCHAR(25) NOT NULL,
    descricao text DEFAULT ''
);

CREATE TABLE Armadura(
    idItem SERIAL PRIMARY KEY REFERENCES Item (idItem),
    adAgil int DEFAULT 0,
    adDefM int DEFAULT 0,
    adDef int default 0, 
    valor int default 0,
    peso int NOT NULL,
    nome VARCHAR(25) NOT NULL,
    descricao text DEFAULT ''
);

CREATE TABLE Legivel(
    idItem SERIAL PRIMARY KEY REFERENCES Item (idItem),
    conteudo TEXT NOT NULL,
    valor int default 0,
    peso int NOT NULL,
    nome VARCHAR(25) NOT NULL,
    descricao text DEFAULT ''
);

CREATE TABLE Arma(
    idItem SERIAL PRIMARY KEY REFERENCES Item (idItem),
    adAtqM int DEFAULT 0,
    adDef int default 0, 
    adAtqF int default 0,
    valor int default 0,
    peso int NOT NULL,
    nome VARCHAR(25) NOT NULL,
    descricao text DEFAULT ''
);

CREATE TABLE Consumivel(
    idItem SERIAL PRIMARY KEY REFERENCES Item (idItem),
    conteudo TEXT DEFAULT '',
    adMente int default 0,
    adDefM int default 0, 
    adAgil int default 0,
    adHp int default 0,
    valor int default 0,
    peso int NOT NULL,
    nome VARCHAR(25) NOT NULL,
    descricao text DEFAULT ''
);

CREATE TABLE Chave(
    idItem SERIAL PRIMARY KEY REFERENCES Item (idItem),
    Regiao SERIAL REFERENCES Regiao(idRegial) NOT NULL,
    valor int default 0,
    peso int NOT NULL,
    nome VARCHAR(25) NOT NULL,
    descricao text DEFAULT ''
);

CREATE TABLE Personagem(
  idPersonagem SERIAL PRIMARY KEY,
  tipoP VARCHAR(3) NOT NULL
);

CREATE TABLE PersonagemJogavel(
  idPersonagem SERIAL PRIMARY KEY REFERENCES Personagem (idPersonagem),
  acessorio1 SERIAL REFERENCES Acessorio (idItem),
  acessorio2 SERIAL REFERENCES Acessorio (idItem),
  armadura SERIAL REFERENCES Armadura (idItem),
  arma SERIAL REFERENCES Arma (idItem),
  menteAtual INT NOT NULL,
  menteMax INT NOT NULL,
  hpAtual INT NOT NULL,
  hpMax INT NOT NULL,
  atq INT DEFAULT 0,
  agilidade INT DEFAULT 10,
  defesaM int DEFAULT 0,
  defesa INT DEFAULT 0,
  atqM INT Default 0,
  nome text NOT NULL,
  local SERIAL,
	regiao SERIAL,
  FOREIGN KEY(local, regiao) REFERENCES Local(idLocal, idRegiao)
);

CREATE TABLE PersonagemNaoJogavel(
  idPersonagem SERIAL PRIMARY KEY REFERENCES Personagem(idPersonagem),
  tipoPnj VARCHAR(1) NOT NULL
  );

CREATE TABLE Lojista(
  idPersonagem SERIAL PRIMARY KEY REFERENCES PersonagemNaoJogavel(idPersonagem),
	local SERIAL,
	regiao SERIAL,
  FOREIGN KEY(local, regiao) REFERENCES Local(idLocal, idRegiao),
  fala TEXT DEFAULT '',
  imgTexto TEXT DEFAULT '',
  descricao TEXT DEFAULT '',
  atq int DEFAULT 0,
  agilidade INT DEFAULT 15,
  defesaM INT DEFAULT 0,
  defesa INT DEFAULT 0,
  atqM INT DEFAULT 0,
  nome TEXT NOT NULL
);

CREATE TABLE Inimigo(
  idPersonagem SERIAL PRIMARY KEY REFERENCES PersonagemNaoJogavel(idPersonagem),
  fala TEXT DEFAULT '',
  imgTexto TEXT DEFAULT '',
  descricao TEXT DEFAULT '',
  atq int DEFAULT 0,
  agilidade INT DEFAULT 15,
  defesaM INT DEFAULT 0,
  defesa INT DEFAULT 0,
  atqM INT DEFAULT 0,
  nome TEXT NOT NULL
);

CREATE TABLE Alma(
  nome VARCHAR(25) PRIMARY KEY,
  idPersonagem SERIAL REFERENCES PersonagemJogavel(idPersonagem),
  descricao TEXT DEFAULT ''
);

ALTER TABLE personagem ADD COLUMN alma TEXT REFERENCES Alma (nome);

CREATE TABLE Parte(
  idParte SERIAL,
  idPersonagem INT,
  hpMax INT NOT NULL,
  probAcerto INT NOT NULL,
  hpAtual INT NOT NULL,
  tipoParte TEXT NOT NULL,
  CONSTRAINT pk_CE PRIMARY KEY(idParte, idPersonagem),
  FOREIGN KEY (idPersonagem) REFERENCES personagem (idPersonagem)
);

CREATE TABLE InstanciaInimigo(
  idInst SERIAL,
  idPersonagem SERIAL,
  idLocal Serial,
  regiao SERIAL,
  PRIMARY KEY (idInst, idPersonagem),
  FOREIGN KEY (idPersonagem) REFERENCES personagem (idPersonagem),
  FOREIGN KEY (idLocal, regiao) REFERENCES Local(idLocal, idRegiao)
);

CREATE TABLE InstanciaItem(
  idInst SERIAL,
  idItem SERIAL,
  idLocal SERIAL,
  idRegiao SERIAL,
  PRIMARY KEY(idInst, idItem),
  FOREIGN KEY (idItem) REFERENCES Item (idItem),
  FOREIGN KEY (idLocal, idRegiao) REFERENCES Local (idLocal, idRegiao)
);

CREATE TABLE Vende(
  idLojista SERIAL,
  idInstItem SERIAL,
	idItem SERIAL,
  PRIMARY KEY (idLojista, idInstItem),
  FOREIGN KEY (idLojista) REFERENCES Lojista (idPersonagem),
  FOREIGN KEY (idInstItem, idItem) REFERENCES InstanciaItem (idinst, iditem)
);

CREATE TABLE Habilidade(
  idHabilidade SERIAL PRIMARY KEY,
  alma TEXT REFERENCES Alma (nome),
  tipoHab VARCHAR(1) NOT NULL
);

CREATE TABLE Passiva(
  idHabilidade SERIAL PRIMARY KEY REFERENCES Habilidade (idHabilidade),
  adAtqM INT DEFAULT 0,
  adDefM INT DEFAULT 0,
  adMenteMax INT DEFAULT 0,
  adAgil INT DEFAULT 0,
  adAtqF INT DEFAULT 0,
  adDef INT DEFAULT 0,
  adHpMax INT DEFAULT 0,
  nome TEXT NOT NULL,
  custo int DEFAULT 0,
  descricao TEXT DEFAULT ''
);

CREATE TABLE Ataque(
  idHabilidade SERIAL PRIMARY KEY REFERENCES Habilidade (idHabilidade),
  danoFisico INT DEFAULT 0,
  danoMagico INT DEFAULT 0,
  nome TEXT NOT NULL,
  custo int DEFAULT 0,
  descricao TEXT DEFAULT ''
);

CREATE TABLE Suporte(
  idHabilidade SERIAL PRIMARY KEY REFERENCES Habilidade (idHabilidade),
  adAtqM INT DEFAULT 0,
  adDefM INT DEFAULT 0,
  adAgil INT DEFAULT 0,
  adHp INT DEFAULT 0,
  nome TEXT NOT NULL,
  custo int DEFAULT 0,
  descricao TEXT DEFAULT ''
);

CREATE TABLE Inventario(
  idInventario SERIAL,
  idPersonagem SERIAL,
  PRIMARY KEY(idInventario, idPersonagem),
  FOREIGN KEY (idPersonagem) REFERENCES Personagem(idPersonagem),
  capTotal INT NOT NULL,
  capAtual INT NOT NULL,
  dinMax INT NOT NULL,
  dinAtual INT NOT NULL
);

CREATE TABLE ListaInventario(
  idPj INT REFERENCES PersonagemJogavel(idPersonagem),
  idItem SERIAL,
  idInstItem SERIAL,
  PRIMARY KEY (idPj),
  FOREIGN KEY (idItem, idInstItem) REFERENCES InstanciaItem(idItem, idInst)
);