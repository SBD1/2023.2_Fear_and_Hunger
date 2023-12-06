
-- INSERT INTO Personagem(alma, local, tipoP) VALUES (1, 1002, 2);

-- INSERT INTO Personagem(alma, local, tipoP) VALUES (2, 1003, 2);

-- INSERT INTO Personagem(alma, local, tipoP) VALUES (3, 1004, 2);

-- INSERT INTO Personagem(alma, local, tipoP) VALUES (4, 1005, 2);

-- -- Entidade Personagem Não Jogável:

-- INSERT INTO PNJ (idPersonagem, tipoPnj) VALUES (1, 1);

-- INSERT INTO PNJ (idPersonagem, tipoPnj) VALUES (2, 2);

-- INSERT INTO PNJ (idPersonagem, tipoPnj) VALUES (3, 3);


-- INSERT INTO PersonagemJogavel 
-- (corpo, mente, defesa, agilidade, ataque, nome, defesaMagica, idPersonagem, acessorio1, acessorio2, Arma, Armadura) 
-- VALUES 
-- (1, 1, 1, 1, 1, 'Nome do Personagem', 1, 4, NULL, NULL, NULL, NULL);

-- -- Entidade Inventário

-- INSERT INTO Inventario(idPersonagem) VALUES (1);

-- INSERT INTO Inventario(idPersonagem) VALUES (2);

-- INSERT INTO Inventario(idPersonagem) VALUES (3);

-- -- Entidade Lojista:

-- INSERT INTO Lojista(idInventario, agilidade, defesaMagica, defesa, ataque, nome) VALUES (1, 10, 5, 20, 15, 'Sinistro');

-- -- Entidade Inimigo:

-- INSERT INTO Inimigo(idPersonagem, defesa, ataque, nome, defesaMagica, agilidade) 
-- VALUES (1, 15, 25, 'Ghoul', 11, 0);

-- INSERT INTO Inimigo(idPersonagem, defesa, ataque, nome, defesaMagica, agilidade) 
-- VALUES (2, 10, 10, 'Chamuscado', 11, 0);

-- INSERT INTO Inimigo(idPersonagem, defesa, ataque, nome, defesaMagica, agilidade) 
-- VALUES (3, 20, 35, 'Padre Decrépto', 11, 0);

-- INSERT INTO Inimigo(idPersonagem, defesa, ataque, nome, defesaMagica, agilidade) 
-- VALUES (4, 25, 40, 'Zelador', 14, 0);

-- INSERT INTO Inimigo(idPersonagem, defesa, ataque, nome, defesaMagica, agilidade) 
-- VALUES (5, 20, 35, 'Cão', 11, 0);

-- INSERT INTO Inimigo(idPersonagem, defesa, ataque, nome, defesaMagica, agilidade) 
-- VALUES (6, 40, 45, 'Palhaço', 15, 0);

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

-- Inserir dados na tabela personagem
INSERT INTO personagem (nome, dinheiro) 
VALUES 
('Herói', 1000),
('Herói1', 1001);


-- Inserir Itens na Loja
INSERT INTO item (nome, valor) VALUES ('Espada de Ferro', 200),
 ('Poção de Cura', 50),
 ('Arco e Flecha', 150);

 -- Se estiver usando transações, assegure-se de cometer as alterações
COMMIT;