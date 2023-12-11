CREATE TABLE regiao (
    idRegiao SERIAL PRIMARY KEY,
    nomeR VARCHAR(50) NOT NULL,
    descricao TEXT DEFAULT '',
	tranca bool DEFAULT FALSE,
    imgTexto TEXT DEFAULT ''
);


CREATE TABLE local (
  idLocal SERIAL PRIMARY KEY,
  idRegiao SERIAL REFERENCES regiao(idRegiao),
  nomeL VARCHAR(25) NOT NULL,
  imgTexto TEXT DEFAULT ''
);


-- Tabela de Personagens
CREATE TABLE personagem (
    id_personagem SERIAL PRIMARY KEY,
    idLocal INTEGER REFERENCES local(idLocal) DEFAULT 1, -- Relação com a tabela Local    
    nome VARCHAR(50) NOT NULL,
    dinheiro INTEGER NOT NULL DEFAULT 0,
    tipoP VARCHAR(25), -- Tipo de personagem
    atq INTEGER, -- Ataque
    agilidade INTEGER, -- Agilidade
    defesaM INTEGER, -- Defesa mágica
    defesa INTEGER -- Defesa física
);


CREATE TABLE personagem_jogavel (
    id_personagem SERIAL PRIMARY KEY,
    hpAtual INTEGER,
    hpMax INTEGER,
    menteAtual INTEGER,
    menteMax INTEGER,
    arma TEXT,
    armadura TEXT,
    acessorio1 TEXT,
    acessorio2 TEXT
    -- Assumindo que as colunas acessorio1 e acessorio2 estão relacionadas a outra tabela, 
    -- você poderia precisar de chaves estrangeiras aqui.
);


CREATE TABLE inventario (
    id_personagem SERIAL PRIMARY KEY,
    dinAtual INTEGER NOT NULL DEFAULT 0,
    dinMax INTEGER NOT NULL DEFAULT 100,
    capAtual INTEGER NOT NULL DEFAULT 0,
    capTotal INTEGER NOT NULL DEFAULT 50,
    FOREIGN KEY (id_personagem) REFERENCES personagem_jogavel (id_personagem) ON DELETE CASCADE
);


CREATE TABLE personagem_nao_jogavel (
    id_personagem SERIAL PRIMARY KEY,
    descricao TEXT,
    fala TEXT,
    imgTexto TEXT,
    tipoPnj TEXT -- Supondo que 'tipoPnj' seja um texto que descreve o tipo do PNJ
    -- Se 'tipoPnj' for uma chave estrangeira para outra tabela, você precisará adicionar a chave estrangeira aqui.
);


CREATE TABLE inimigo (
    id_personagem INTEGER PRIMARY KEY,
    nivelPerigo INTEGER NOT NULL,
    recompensa INTEGER NOT NULL,
    FOREIGN KEY (id_personagem) REFERENCES personagem_nao_jogavel (id_personagem) ON DELETE CASCADE
);

CREATE TABLE lojista (
    id_personagem INTEGER PRIMARY KEY,
    nomeLoja VARCHAR(50) NOT NULL,
    especialidade VARCHAR(50),
    FOREIGN KEY (id_personagem) REFERENCES personagem_nao_jogavel (id_personagem) ON DELETE CASCADE
);


-- Assuming 'Item' is an entity that includes 'nome', 'descricao', 'valor', 'peso'
CREATE TABLE item (
    idItem SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT DEFAULT '',
    valor INTEGER NOT NULL,
    peso INTEGER NOT NULL
);

-- Assuming 'Legal' is a category of items that might have additional attributes
CREATE TABLE legivel (
    idLegivel SERIAL PRIMARY KEY,
    conteudo TEXT DEFAULT '',
    FOREIGN KEY (idLegivel) REFERENCES item(idItem) ON DELETE CASCADE
);

-- Table for 'Acessorio' which is a type of item
CREATE TABLE acessorio (
    idAcessorio SERIAL PRIMARY KEY,
    detalhe TEXT DEFAULT '',
    FOREIGN KEY (idAcessorio) REFERENCES item(idItem) ON DELETE CASCADE
);

-- Table for 'Arma' which is a type of item
CREATE TABLE arma (
    idArma SERIAL PRIMARY KEY,
    ataque INTEGER NOT NULL,
    defesa INTEGER,
    FOREIGN KEY (idArma) REFERENCES item(idItem) ON DELETE CASCADE
);

-- Table for 'Armadura' which is a type of item
CREATE TABLE armadura (
    idArmadura SERIAL PRIMARY KEY,
    defesaFisica INTEGER NOT NULL,
    defesaMagica INTEGER,
    FOREIGN KEY (idArmadura) REFERENCES item(idItem) ON DELETE CASCADE
);

-- Add any other necessary tables here following the same pattern.
CREATE TABLE compra (
    idCompra SERIAL PRIMARY KEY,
    id_personagem SERIAL REFERENCES personagem(id_personagem),
    idItem SERIAL REFERENCES item(idItem),
    quantidade INTEGER NOT NULL,
    valorTotal INTEGER NOT NULL,
    dataCompra TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
