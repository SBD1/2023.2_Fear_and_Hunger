
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

-- Inserir Personagem
INSERT INTO personagem (nome, dinheiro) VALUES ('Herói', 1000);

-- Inserir Itens na Loja
INSERT INTO item (nome, valor) VALUES ('Espada de Ferro', 200);
INSERT INTO item (nome, valor) VALUES ('Poção de Cura', 50);
INSERT INTO item (nome, valor) VALUES ('Arco e Flecha', 150);