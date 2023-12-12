# DDL

### Versionamento

| Versão | Data       | Modificação                                                                              | Autor                               |
| ------ | ---------- | ---------------------------------------------------------------------------------------- | ----------------------------------- |
| 0.1    |            | Criação do Documento                                                                     | Matheus                             |

```
CREATE TABLE regiao (
  idRegiao SERIAL PRIMARY KEY,
  nomeR VARCHAR(25) NOT NULL,
  descricao TEXT DEFAULT '',
  tranca bool DEFAULT FALSE,
  imgTexto TEXT DEFAULT ''
);

CREATE TABLE local (
  idLocal SERIAL,
	idRegiao SERIAL REFERENCES regiao(idRegiao),
  nomeL VARCHAR(25) NOT NULL,
  imgTexto TEXT DEFAULT '',
	CONSTRAINT pk_LO primary key(idLocal, idRegiao)
);

CREATE TABLE item (
    idItem SERIAL PRIMARY KEY,
	  tipoItem TEXT NOT NULL
);

CREATE TABLE acessorio(
    idItem SERIAL PRIMARY KEY REFERENCES item (idItem),
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

CREATE TABLE armadura(
    idItem SERIAL PRIMARY KEY REFERENCES item (idItem),
    adAgil int DEFAULT 0,
    adDefM int DEFAULT 0,
    adDef int default 0, 
    valor int default 0,
    peso int NOT NULL,
    nome VARCHAR(25) NOT NULL,
    descricao text DEFAULT ''
);

CREATE TABLE legivel(
    idItem SERIAL PRIMARY KEY REFERENCES item (idItem),
    conteudo TEXT NOT NULL,
    valor int default 0,
    peso int NOT NULL,
    nome VARCHAR(50) NOT NULL,
    descricao text DEFAULT ''
);

CREATE TABLE Arma(
    idItem SERIAL PRIMARY KEY REFERENCES item (idItem),
    adAtqM int DEFAULT 0,
    adDef int default 0, 
    adAtqF int default 0,
    valor int default 0,
    peso int NOT NULL,
    nome VARCHAR(25) NOT NULL,
    descricao text DEFAULT ''
);

CREATE TABLE Consumivel(
    idItem SERIAL PRIMARY KEY REFERENCES item (idItem),
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

CREATE TABLE chave(
    idItem SERIAL PRIMARY KEY REFERENCES item (idItem),
    Regiao SERIAL REFERENCES regiao(idRegiao) NOT NULL,
    valor int default 0,
    peso int NOT NULL,
    nome VARCHAR(25) NOT NULL,
    descricao text DEFAULT ''
);

CREATE TABLE alma(
  nome VARCHAR(30) PRIMARY KEY,
  descricao TEXT DEFAULT ''
);

CREATE TABLE personagem(
  idPersonagem SERIAL PRIMARY KEY,
  alma VARCHAR(30) REFERENCES Alma (nome),
  tipoP VARCHAR(3) NOT NULL
);

CREATE TABLE personagem_jogavel(
  idPersonagem SERIAL PRIMARY KEY REFERENCES personagem (idPersonagem),
  acessorio1 INTEGER NULL REFERENCES acessorio (idItem),
  acessorio2 INTEGER NULL REFERENCES acessorio (idItem),
  armadura INTEGER NULL REFERENCES armadura (idItem),
  arma INTEGER NULL REFERENCES arma (idItem),
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
  FOREIGN KEY(local, regiao) REFERENCES local(idLocal, idRegiao)
);

CREATE TABLE personagem_nao_jogavel(
  idPersonagem SERIAL PRIMARY KEY REFERENCES personagem(idPersonagem),
  tipoPnj VARCHAR(1) NOT NULL
  );

CREATE TABLE lojista(
  idPersonagem SERIAL PRIMARY KEY REFERENCES personagem_nao_jogavel(idPersonagem),
	local SERIAL,
	regiao SERIAL,
  FOREIGN KEY(local, regiao) REFERENCES local(idLocal, idRegiao),
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

CREATE TABLE inimigo(
  idPersonagem SERIAL PRIMARY KEY REFERENCES personagem_nao_jogavel(idPersonagem),
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

CREATE TABLE parte(
  idParte SERIAL,
  idPersonagem INT,
  hpMax INT NOT NULL,
  probAcerto INT NOT NULL,
  hpAtual INT NOT NULL,
  tipoParte TEXT NOT NULL,
  CONSTRAINT pk_CE PRIMARY KEY(idParte, idPersonagem),
  FOREIGN KEY (idPersonagem) REFERENCES personagem (idPersonagem)
);

CREATE TABLE instancia_inimigo(
  idInst SERIAL,
  idPersonagem SERIAL,
  idLocal Serial,
  regiao SERIAL,
  PRIMARY KEY (idInst, idPersonagem),
  FOREIGN KEY (idPersonagem) REFERENCES personagem (idPersonagem),
  FOREIGN KEY (idLocal, regiao) REFERENCES local(idLocal, idRegiao)
);

CREATE TABLE instancia_item(
  idInst SERIAL,
  idItem SERIAL,
  idLocal SERIAL,
  idRegiao SERIAL,
  PRIMARY KEY(idInst, idItem),
  FOREIGN KEY (idItem) REFERENCES item (idItem),
  FOREIGN KEY (idLocal, idRegiao) REFERENCES local (idLocal, idRegiao)
);

CREATE TABLE vende(
  idLojista SERIAL,
  idInstItem SERIAL,
	idItem SERIAL,
  PRIMARY KEY (idLojista, idInstItem),
  FOREIGN KEY (idLojista) REFERENCES lojista (idPersonagem),
  FOREIGN KEY (idInstItem, idItem) REFERENCES instancia_item (idinst, iditem)
);

CREATE TABLE habilidade(
  idHabilidade SERIAL PRIMARY KEY,
  alma TEXT REFERENCES alma (nome),
  tipoHab VARCHAR(1) NOT NULL
);

CREATE TABLE passiva(
  idHabilidade SERIAL PRIMARY KEY REFERENCES habilidade (idHabilidade),
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

CREATE TABLE ataque(
  idHabilidade SERIAL PRIMARY KEY REFERENCES habilidade (idHabilidade),
  danoFisico INT DEFAULT 0,
  danoMagico INT DEFAULT 0,
  nome TEXT NOT NULL,
  custo int DEFAULT 0,
  descricao TEXT DEFAULT ''
);

CREATE TABLE suporte(
  idHabilidade SERIAL PRIMARY KEY REFERENCES habilidade (idHabilidade),
  adAtqM INT DEFAULT 0,
  adDefM INT DEFAULT 0,
  adAgil INT DEFAULT 0,
  adHp INT DEFAULT 0,
  nome TEXT NOT NULL,
  custo int DEFAULT 0,
  descricao TEXT DEFAULT ''
);

CREATE TABLE inventario(
  idInventario SERIAL,
  idPersonagem SERIAL,
  PRIMARY KEY(idInventario, idPersonagem),
  FOREIGN KEY (idPersonagem) REFERENCES personagem(idPersonagem),
  capTotal INT NOT NULL,
  capAtual INT NOT NULL,
  dinMax INT NOT NULL,
  dinAtual INT NOT NULL
);

CREATE TABLE lista_inventario(
  idPj INT REFERENCES personagem_jogavel(idPersonagem),
  idItem SERIAL,
  idInstItem SERIAL,
  PRIMARY KEY (idPj),
  FOREIGN KEY (idItem, idInstItem) REFERENCES instancia_item(idItem, idInst)
);
```
