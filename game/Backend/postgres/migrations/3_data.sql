-- Inserir dados na tabela regiao
INSERT INTO regiao (nomeR, descricao, tranca) 
VALUES
('Praça Central', 'Aqui é o centro da cidade. Aonde a população costumava se reunir para conversar e comercializar.', FALSE),
('Igreja', 'A única igreja da cidade. Aqui os moradores dedicavam preces a All-mer, o último dos deuses antigos, também conhecido como "aquele que ascendeu".', TRUE),
('Circo', 'Um lugar que antes era usado para diversão e entretenimento, mas que atualmente tem um aspecto sinistro e abandonado.', TRUE),
('Truques e mágica Dr. Kefer', 'Um pequeno edifício de aparência desgastada.', FALSE),
('Livraria', 'A livraria comercializava todo tipo de livro dos mais variados assuntos.', FALSE),
('Floresta', 'O bosque que fica ao redor da cidade.', FALSE),
('Casa do lenhador', 'A casa do lenhador do vilarejo', FALSE);

INSERT INTO Local (idRegiao, nomeL, imgTexto) VALUES
(1, 'Fonte', 'O ponto central da Praça Central é esta fonte antiga que, ocasionalmente, ainda esguicha água. É adornada com entalhes intricados que contam a história da fundação da cidade. Musgo e trepadeiras sobem pelas suas laterais, e os moradores frequentemente contam histórias de desejos realizados àqueles que jogam uma moeda em suas profundezas em noites de lua cheia.'),
(1, 'Bancas abandonadas', 'O que costumava ser barracas de mercado vibrantes agora são apenas esqueletos de madeira. Os toldos coloridos há muito perderam sua vivacidade, e os balcões que uma vez exibiam mercadorias frescas agora estão cobertos de poeira. Há um senso de nostalgia que pesa no ar, como se as risadas e conversas dos dias de glória do mercado ainda pudessem ser ouvidas ao vento.'),
(1, 'Árvore da Praça', 'Erguendo-se sobre a praça, a velha árvore tem sido uma testemunha silenciosa do fluxo da vida da cidade. Seus galhos se estendem, fornecendo sombra para um círculo de bancos bem desgastados. Esculturas de iniciais e símbolos, gravadas na casca por gerações de moradores, falam de inúmeras histórias e segredos compartilhados sob sua folhagem.');

-- Primeiro, inserimos um personagem que será jogável
INSERT INTO personagem (nome, idLocal, tipoP) VALUES ('Jogador Heroico', 1, 'personagem_jogavel') RETURNING id_personagem;

-- Suponha que o ID retornado seja 1, usamos esse ID para inserir na tabela PersonagemJogavel
INSERT INTO personagem_jogavel (id_personagem, hpAtual, hpMax, menteAtual, menteMax, arma, armadura) 
VALUES (1, 100, 100, 50, 50, 'Espada Longa', 'Cota de Malha');

-- Em seguida, inserimos um personagem que não será jogável
INSERT INTO personagem (nome, idLocal, tipoP) VALUES ('NPC Misterioso', 1, 'personagem_nao_jogavel') RETURNING id_personagem;

-- Suponha que o ID retornado seja 2, usamos esse ID para inserir na tabela PersonagemNaoJogavel
INSERT INTO personagem_nao_jogavel (id_personagem, descricao, fala, imgTexto, tipoPnj) 
VALUES (2, 'Um misterioso Logista que oferece conselhos.', 'Olá, aventureiro!', 'imagem_do_npc.png', 'Lojista');

-- Inserting items into the 'item' table
INSERT INTO item (nome, descricao, valor, peso) VALUES
('Espada Longa', 'Uma espada longa e afiada.', 150, 5),
('Capa da Invisibilidade', 'Uma capa que torna o usuário invisível.', 500, 1),
('Escudo de Bronze', 'Um escudo resistente feito de bronze.', 100, 10),
('Botas de Velocidade', 'Botas que aumentam a agilidade do usuário.', 200, 2),
('Elmo de Guerra', 'Um elmo protege a cabeça durante a batalha.', 80, 3);

-- Now, inserting into the 'acessorio' table, assuming the 'idAcessorio' matches 'idItem'
INSERT INTO acessorio (idAcessorio, detalhe) VALUES
((SELECT idItem FROM item WHERE nome = 'Capa da Invisibilidade'), 'Torna o usuário invisível por curtos períodos de tempo.'),
((SELECT idItem FROM item WHERE nome = 'Botas de Velocidade'), 'Aumenta a agilidade do usuário ao correr.');

-- Inserting into the 'arma' table
INSERT INTO arma (idArma, ataque, defesa) VALUES
((SELECT idItem FROM item WHERE nome = 'Espada Longa'), 10, 0);

-- Inserting into the 'escudo' (assuming it is a type of 'arma') table
INSERT INTO arma (idArma, ataque, defesa) VALUES
((SELECT idItem FROM item WHERE nome = 'Escudo de Bronze'), 2, 5);

-- Inserting into the 'armadura' table
INSERT INTO armadura (idArmadura, defesaFisica, defesaMagica) VALUES
((SELECT idItem FROM item WHERE nome = 'Elmo de Guerra'), 3, 1);

COMMIT;


