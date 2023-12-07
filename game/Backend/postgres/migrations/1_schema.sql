-- -- Tabela Local
-- CREATE TABLE Local (
--     idLocal SERIAL PRIMARY KEY
-- );

-- -- Tabela Personagem
-- CREATE TABLE Personagem (
--     idPersonagem SERIAL PRIMARY KEY,
--     alma INT DEFAULT 0,
--     local INT UNIQUE,
--     tipoP INT NOT NULL
-- );

-- -- Tabela Inventario
-- CREATE TABLE Inventario (
--     idInventario SERIAL PRIMARY KEY,
--     idPersonagem INT REFERENCES Personagem (idPersonagem)
-- );

-- -- Tabela Lojista
-- CREATE TABLE Lojista (
--     idLojista SERIAL PRIMARY KEY,
--     idInventario INT REFERENCES Inventario (idInventario),
--     agilidade INT DEFAULT 0,
--     defesaMagica INT DEFAULT 0,
--     defesa INT DEFAULT 0,
--     ataque INT DEFAULT 0,
--     nome VARCHAR(255) NOT NULL
-- );

-- -- Tabela Item
-- CREATE TABLE Item (
--     idItem SERIAL PRIMARY KEY,
--     tipo VARCHAR(255) NOT NULL,
--     idInventario INT REFERENCES Inventario (idInventario),
--     lojista INT REFERENCES Lojista (idLojista)
-- );

-- -- Tabela Loot
-- CREATE TABLE Loot (
--     local INT REFERENCES Local (idLocal),
--     item INT REFERENCES Item (idItem)
-- );

-- -- Tabela Personagem Jogável
-- CREATE TABLE PersonagemJogavel (
--     corpo INT NOT NULL,
--     mente INT NOT NULL,
--     defesa INT NOT NULL,
--     agilidade INT NOT NULL,
--     ataque INT NOT NULL,
--     nome VARCHAR(255) NOT NULL,
--     defesaMagica INT NOT NULL,
--     idPersonagem INT PRIMARY KEY REFERENCES Personagem (idPersonagem),
--     acessorio1 INT REFERENCES Item (idItem),
--     acessorio2 INT REFERENCES Item (idItem),
--     Arma INT REFERENCES Item (idItem),
--     Armadura INT REFERENCES Item (idItem)
-- );

-- -- Tabela Alma
-- CREATE TABLE Alma (
--     nome VARCHAR(255) PRIMARY KEY,
--     personagem INT REFERENCES Personagem (idPersonagem)
-- );

-- -- Tabela Coletadas
-- CREATE TABLE Coletadas (
--     personagem INT REFERENCES PersonagemJogavel (idPersonagem),
--     alma VARCHAR(255) REFERENCES Alma (nome)
-- );

-- -- Tabela Habilidade
-- CREATE TABLE Habilidade (
--     idHabilidade SERIAL PRIMARY KEY,
--     custo INT NOT NULL,
--     alma VARCHAR(255) REFERENCES Alma (nome)
-- );

-- -- Tabela Ataque
-- CREATE TABLE Ataque (
--     idAtaque SERIAL PRIMARY KEY,
--     tipoAtaque INT NOT NULL,
--     descricao VARCHAR(255) DEFAULT '',
--     idHabilidade INT REFERENCES Habilidade (idHabilidade),
--     danoFisico INT DEFAULT 0,
--     danoMagico INT DEFAULT 0
-- );

-- -- Tabela Armadura
-- CREATE TABLE Armadura (
--     idItem INT PRIMARY KEY REFERENCES Item (idItem),
--     defesa INT DEFAULT 0,
--     defesaMagica INT DEFAULT 0,
--     agilidade INT DEFAULT 0,
--     descricao VARCHAR(255) DEFAULT '',
--     valor INT DEFAULT 0,
--     nome VARCHAR(255) NOT NULL
-- );



-- -- Tabela Estoque
-- CREATE TABLE Estoque (
--     idLojista INT REFERENCES Lojista (idLojista),
--     idItem INT REFERENCES Item (idItem)
-- );

-- -- Tabela Arma
-- CREATE TABLE Arma (
--     idItem INT PRIMARY KEY REFERENCES Item (idItem),
--     ataqueFisico INT DEFAULT 0,
--     ataqueMagico INT DEFAULT 0,
--     descricao VARCHAR(255) DEFAULT '',
--     valor INT DEFAULT 0,
--     nome VARCHAR(255) NOT NULL
-- );

-- -- Tabela Acessorio
-- CREATE TABLE Acessorio (
--     idItem INT PRIMARY KEY REFERENCES Item (idItem),
--     defesa INT DEFAULT 0,
--     defesaMagica INT DEFAULT 0,
--     agilidade INT DEFAULT 0,
--     ataqueFisico INT DEFAULT 0,
--     ataqueMagico INT DEFAULT 0,
--     descricao VARCHAR(255) DEFAULT '',
--     valor INT DEFAULT 0,
--     nome VARCHAR(255) NOT NULL
-- );

-- -- Tabela Personagem Não Jogável
-- CREATE TABLE PNJ (
--     idPersonagem INT PRIMARY KEY REFERENCES Personagem (idPersonagem),
--     tipoPnj INT NOT NULL
-- );

-- -- Tabela Inimigo
-- CREATE TABLE Inimigo (
--     idPersonagem SERIAL PRIMARY KEY,
--     defesa INT DEFAULT 0,
--     agilidade INT DEFAULT 0,
--     ataque INT DEFAULT 0,
--     nome VARCHAR(255) NOT NULL,
--     defesaMagica INT DEFAULT 0
-- );

-- -- Tabela Legivel
-- CREATE TABLE Legivel (
--     idItem INT PRIMARY KEY,
--     conteudo VARCHAR(255) DEFAULT '',
--     valor INT DEFAULT 0,
--     descricao VARCHAR(255) DEFAULT '',
--     nome VARCHAR(255) NOT NULL
-- );

-- -- Tabela Consumivel
-- CREATE TABLE Consumivel (
--     idItem INT PRIMARY KEY,
--     adHp INT NOT NULL,
--     adMente INT NOT NULL,
--     descricao VARCHAR(255) DEFAULT '',
--     valor INT DEFAULT 0,
--     nome VARCHAR(255) NOT NULL
-- );

CREATE TABLE regiao (
    idRegiao SERIAL PRIMARY KEY,
    nomeR VARCHAR(50) NOT NULL,
    descricao TEXT DEFAULT '',
	tranca bool DEFAULT FALSE,
    imgTexto TEXT DEFAULT ''
);


CREATE TABLE local (
  idLocal SERIAL,
  idRegiao SERIAL REFERENCES Regiao(idRegiao),
  nomeL VARCHAR(25) NOT NULL,
  imgTexto TEXT DEFAULT '',
  CONSTRAINT pk_CE primary key(idLocal, idRegiao)
);


-- Tabela de Personagens
CREATE TABLE personagem (
    id_personagem SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    dinheiro INTEGER NOT NULL
);

-- Tabela de Itens
CREATE TABLE item (
    id_item SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    valor INTEGER NOT NULL
);

-- Tabela de Inventário
CREATE TABLE inventario (
    id_personagem INTEGER REFERENCES personagem(id_personagem),
    id_item INTEGER REFERENCES item(id_item),
    quantidade INTEGER NOT NULL,
    PRIMARY KEY (id_personagem, id_item)
);

-- Tabela de Compra Log
CREATE TABLE compra_log (
    id_compra SERIAL PRIMARY KEY,
    id_personagem INTEGER REFERENCES personagem(id_personagem),
    id_item INTEGER REFERENCES item(id_item),
    quantidade INTEGER NOT NULL,
    valor_total INTEGER NOT NULL,
    data_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger para atualizar dinheiro e adicionar item ao inventário após a compra
CREATE OR REPLACE FUNCTION realizar_compra()
RETURNS TRIGGER AS $$
DECLARE
    inventario_existente INTEGER;
BEGIN
    -- Verifica se o personagem tem dinheiro suficiente
    IF NEW.valor_total > (SELECT dinheiro FROM personagem WHERE id_personagem = NEW.id_personagem) THEN
        RAISE EXCEPTION 'Personagem não possui dinheiro suficiente para realizar a compra.';
    END IF;

    -- Atualiza o dinheiro do personagem
    UPDATE personagem SET dinheiro = dinheiro - NEW.valor_total WHERE id_personagem = NEW.id_personagem;

    -- Verifica se o item já está no inventário
    SELECT INTO inventario_existente quantidade FROM inventario WHERE id_personagem = NEW.id_personagem AND id_item = NEW.id_item;

    IF FOUND THEN
        -- Atualiza a quantidade se o item já estiver no inventário
        UPDATE inventario SET quantidade = quantidade + NEW.quantidade WHERE id_personagem = NEW.id_personagem AND id_item = NEW.id_item;
    ELSE
        -- Insere o item no inventário se não estiver presente
        INSERT INTO inventario (id_personagem, id_item, quantidade) VALUES (NEW.id_personagem, NEW.id_item, NEW.quantidade);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
