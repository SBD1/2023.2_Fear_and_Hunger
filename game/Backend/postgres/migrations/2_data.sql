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

INSERT INTO Local (idRegiao, nomeL) VALUES
(1, 'Fonte'),
(1, 'Bancas abandonadas'),
(1, 'Árvore da Praça');

-- Primeiro, inserimos um personagem que será jogável
INSERT INTO personagem (nome, idLocal) VALUES ('Jogador Heroico', 1) RETURNING id_personagem;

-- Suponha que o ID retornado seja 1, usamos esse ID para inserir na tabela PersonagemJogavel
INSERT INTO personagem_jogavel (id_personagem, hpAtual, hpMax, menteAtual, menteMax, arma, armadura) 
VALUES (1, 100, 100, 50, 50, 'Espada Longa', 'Cota de Malha');

-- Em seguida, inserimos um personagem que não será jogável
INSERT INTO personagem (nome, idLocal) VALUES ('NPC Misterioso', 1) RETURNING id_personagem;

-- Suponha que o ID retornado seja 2, usamos esse ID para inserir na tabela PersonagemNaoJogavel
INSERT INTO personagem_nao_jogavel (id_personagem, descricao, fala, imgTexto, tipoPnj) 
VALUES (2, 'Um misterioso Logista que oferece conselhos.', 'Olá, aventureiro!', 'imagem_do_npc.png', 'Logista');


-- Inserir Itens na Loja
INSERT INTO item (nome, valor) VALUES ('Espada de Ferro', 200),
 ('Poção de Cura', 50),
 ('Arco e Flecha', 150);

 -- Se estiver usando transações, assegure-se de cometer as alterações
COMMIT;