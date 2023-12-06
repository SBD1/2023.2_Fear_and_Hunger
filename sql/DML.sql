INSERT INTO PersonagemJogavel(IdPersonagem, 
nome, 
atq, 
agilidade, 
defesaM, 
defesa, 
atqM, 
hpAtual, 
hpMax, 
menteAtual, 
menteMax, local, regiao) VALUES (01, Jakov, 0, 0, 0, 0, 0, 100, 100, 5, 5, 'Árvore da praça', 'Praça Central');

INSERT INTO Regiao (idRegiao, 
nomeR, 
descricao, tranca) VALUES(01, 
'Praça Central', 'Aqui é o centro da cidade. Aonde a população costumava se reunir para conversar e comercializar.', 
FALSE);

INSERT INTO Regiao (idRegiao, 
nomeR, 
descricao, tranca) VALUES(02, 
'Igreja', 'A única igreja da cidade. Aqui os moradores dedicavam preces a All-mer, o último dos deuses antigos, também conhecido como "aquele que ascendeu".', 
TRUE);

INSERT INTO Regiao (idRegiao, 
nomeR, 
descricao, tranca) VALUES(03, 
'Circo', 'Um lugar que antes era usado para diversão e entretenimento, mas que atualmente tem um aspecto sinistro e abandonado.', 
TRUE);

INSERT INTO Regiao (idRegiao, 
nomeR, 
descricao, tranca) VALUES(04, 
'Truques e mágica Dr. Kefer', 'Um pequeno edifício de aparência desgastada.', 
FALSE);

INSERT INTO Regiao (idRegiao, 
nomeR, 
descricao, tranca) VALUES(05, 
'Livraria', 'A livraria comercializava todo 
tipo de livro dos mais variados assuntos.', 
FALSE);

INSERT INTO Regiao (idRegiao, 
nomeR, 
descricao, tranca) VALUES(06, 
'Floresta', 'O bosque que fica ao 
redor da cidade.', 
FALSE);

INSERT INTO Regiao (idRegiao, 
nomeR, 
descricao, tranca) VALUES(07, 
'Casa do lenhador', 'A casa do lenhador do vilarejo', FALSE);

INSERT INTO Local (idLocal, regiao, nomeL) VALUES
(01, 'Praça Central', 'Fonte');

INSERT INTO Local (idLocal, regiao, nomeL) VALUES
(02, 'Praça Central', 'Bancas abandonadas');

INSERT INTO Local (idLocal, regiao, nomeL) VALUES
(03, 'Praça Central', 'Árvore da Praça');

-- New insert
-- Inserir dados na tabela Regiao
INSERT INTO Regiao (idRegiao, nomeR, descricao, tranca) VALUES
    (01, 'Praça Central', 'Aqui é o centro da cidade. Aonde a população costumava se reunir para conversar e comercializar.', FALSE);

INSERT INTO Regiao (idRegiao, nomeR, descricao, tranca) VALUES
    (02, 'Igreja', 'A única igreja da cidade. Aqui os moradores dedicavam preces a All-mer, o último dos deuses antigos, também conhecido como "aquele que ascendeu".', TRUE);

INSERT INTO Regiao (idRegiao, nomeR, descricao, tranca) VALUES
    (03, 'Circo', 'Um lugar usado para diversão e entretenimento, mas que atualmente tem um aspecto sinistro e abandonado.', TRUE);

INSERT INTO Regiao (idRegiao, nomeR, descricao, tranca) VALUES
    (04, 'Truques e mágica', 'Um pequeno edifício de aparência desgastada.', FALSE);

INSERT INTO Regiao (idRegiao, nomeR, descricao, tranca) VALUES
    (05, 'Livraria', 'A livraria comercializava todo tipo de livro dos mais variados assuntos.', FALSE);

INSERT INTO Regiao (idRegiao, nomeR, descricao, tranca) VALUES
    (06, 'Floresta', 'O bosque ao redor da cidade.', FALSE);

INSERT INTO Regiao (idRegiao, nomeR, descricao, tranca) VALUES
    (07, 'Casa do lenhador', 'A casa do lenhador do vilarejo', FALSE);


-- Inserir dados na tabela Local com base nos inserts da tabela Regiao
INSERT INTO Local (idLocal, idRegiao, nomeL) VALUES
(1, 1, 'Fonte');

INSERT INTO Local (idLocal, idRegiao, nomeL) VALUES
(2, 1, 'Bancas abandonadas');

INSERT INTO Local (idLocal, idRegiao, nomeL) VALUES
(3, 1, 'Árvore da Praça');


INSERT INTO Item (tipoItem) VALUES
    ('Acessorio'),
    ('Armadura'),
    ('Legivel'),
    ('Arma'),
    ('Consumivel'),
    ('Chave');


-- Inserts para Acessorio
INSERT INTO Acessorio (idItem, adAtqM, adAgil, adDefM, adDef, adAtqF, valor, peso, nome, descricao) VALUES
    (1, 5, 2, 0, 3, 0, 50, 2, 'Anel da Força', 'Aumenta o poder de ataque físico.'),
    (2, 0, 3, 0, 2, 0, 30, 1, 'Amuleto da Agilidade', 'Melhora a agilidade do usuário.'),
    (3, 0, 0, 4, 5, 0, 80, 3, 'Escudo Mágico', 'Oferece uma forte defesa contra ataques mágicos.');

-- Inserts para Armadura
INSERT INTO Armadura (idItem, adAgil, adDefM, adDef, valor, peso, nome, descricao) VALUES
    (2, 2, 0, 5, 60, 10, 'Armadura de Couro', 'Uma armadura leve feita de couro resistente.'),
    (3, 0, 3, 8, 80, 15, 'Armadura de Placas', 'Uma pesada armadura de placas metálicas.'),
    (4, 4, 0, 6, 70, 12, 'Túnica Encantada', 'Uma túnica mágica que oferece proteção adicional.');

-- Inserts para Legivel
INSERT INTO Legivel (idItem, conteudo, valor, peso, nome, descricao) VALUES
    (3, 'Mapa Antigo', 10, 1, 'Mapa do Labirinto', 'Um mapa detalhado do labirinto.'),
    (4, 'Diário Mágico', 15, 2, 'Diário do Feiticeiro', 'Um diário cheio de escritos mágicos.'),
    (5, 'Pergaminho Sagrado', 20, 1, 'Pergaminho Divino', 'Um pergaminho com encantamentos divinos.');

-- Inserts para Arma
INSERT INTO Arma (idItem, adAtqM, adDef, adAtqF, valor, peso, nome, descricao) VALUES
    (4, 8, 0, 0, 100, 8, 'Espada Mágica', 'Uma espada encantada com poderes mágicos.'),
    (5, 0, 5, 0, 120, 10, 'Martelo de Guerra', 'Um martelo pesado feito para causar danos impactantes.'),
    (6, 10, 0, 0, 80, 6, 'Arco Élfico', 'Um arco élfico preciso e poderoso.');

-- -- Inserts para Consumivel
-- INSERT INTO Consumivel (idItem, conteudo, adMente, adDefM, adAgil, adHp, valor, peso, nome, descricao) VALUES
--     (5, 'Poção de Cura', 0, 0, 0, 50, 20, 1, 'Poção de Cura', 'Recupera pontos de vida.'),
--     (6, 'Elixir da Sabedoria', 10, 0, 0, 0, 30, 1, 'Elixir da Sabedoria', 'Aumenta temporariamente a inteligência.'),
--     (7, 'Fruta Energética', 0, 0, 5, 0, 10, 1, 'Fruta Energética', 'Fornece uma explosão de energia.');

-- -- Inserts para Chave
-- INSERT INTO Chave (idItem, idRegiao, valor, peso, nome, descricao) VALUES
--     (6, 101, 5, 1, 'Chave de Ouro', 'Uma chave feita de ouro que abre portas especiais.'),
--     (7, 102, 10, 2, 'Chave de Prata', 'Uma chave valiosa que desbloqueia segredos ocultos.'),
--     (7, 103, 8, 1, 'Chave Mística', 'Uma chave com propriedades místicas que abre portais dimensionais.');

INSERT INTO Personagem (idPersonagem, tipoP)
VALUES
(1, 'PJ'),
(2, 'NPC');

INSERT INTO PersonagemJogavel (idPersonagem, acessorio1, acessorio2, armadura, arma, menteAtual, menteMax, hpAtual, hpMax, atq, agilidade, defesaM, defesa, atqM, nome, local, regiao)
VALUES
(1, 1, 2, 3, 4, 100, 150, 100, 150, 20, 30, 10, 20, 50, 'Herói', 1, 1),
(2, 3, 1, 3, 6, 80, 120, 80, 120, 15, 25, 5, 15, 40, 'Mago', 2, 1);

INSERT INTO PersonagemNaoJogavel (idPersonagem, tipoPnj) VALUES (2, 'L');



INSERT INTO Lojista (idPersonagem, local, regiao, fala, imgTexto, descricao, atq, agilidade, defesaM, defesa, atqM, nome)
VALUES
(2, 1, 1, 'Seja bem-vindo à minha loja! Posso te ajudar em alguma coisa?', '', 'Um lojista amigável que vende itens raros e poderosos.', 10, 15, 5, 10, 30, 'Vendedor Lendário');

INSERT INTO Inimigo (idPersonagem, fala, imgTexto, descricao, atq, agilidade, defesaM, defesa, atqM, nome)
VALUES
(2, 'Prepare-se para lutar!', '', 'Um inimigo feroz que não hesitará em atacar.', 30, 20, 10, 20, 50, 'Inimigo Formidável');




