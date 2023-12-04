-- Entidade Alma:

INSERT INTO Alma(nome, personagem) VALUES ('Liberdade', NULL );

INSERT INTO Alma(nome, personagem) VALUES('Sombria', NULL);

INSERT INTO Alma(nome, personagem) VALUES('Feral', NULL);

INSERT INTO Alma(nome, personagem) VALUES('Caótica', NULL);

-- Entidade Personagem:

INSERT INTO Personagem(alma, local, tipoP) VALUES (1, 1002, 2);

INSERT INTO Personagem(alma, local, tipoP) VALUES (2, 1003, 2);

INSERT INTO Personagem(alma, local, tipoP) VALUES (3, 1004, 2);

-- Entidade Personagem Não Jogável:

INSERT INTO PNJ (idPersonagem, tipoPnj) VALUES (1, 1);

INSERT INTO PNJ (idPersonagem, tipoPnj) VALUES (2, 2);

INSERT INTO PNJ (idPersonagem, tipoPnj) VALUES (3, 3);

-- Entidade Inventário

INSERT INTO Inventario(idPersonagem) VALUES (1);

INSERT INTO Inventario(idPersonagem) VALUES (2);

INSERT INTO Inventario(idPersonagem) VALUES (3);

-- Entidade Lojista:

INSERT INTO Lojista(idInventario, agilidade, defesaMagica, defesa, ataque, nome) VALUES (1, 10, 5, 20, 15, 'Sinistro');

-- Entidade Inimigo:

INSERT INTO Inimigo(idPersonagem, defesa, ataque, nome, defesaMagica, agilidade) 
VALUES (1, 15, 25, 'Ghoul', 11, 0);

INSERT INTO Inimigo(idPersonagem, defesa, ataque, nome, defesaMagica, agilidade) 
VALUES (2, 10, 10, 'Chamuscado', 11, 0);

INSERT INTO Inimigo(idPersonagem, defesa, ataque, nome, defesaMagica, agilidade) 
VALUES (3, 20, 35, 'Padre Decrépto', 11, 0);

INSERT INTO Inimigo(idPersonagem, defesa, ataque, nome, defesaMagica, agilidade) 
VALUES (4, 25, 40, 'Zelador', 14, 0);

INSERT INTO Inimigo(idPersonagem, defesa, ataque, nome, defesaMagica, agilidade) 
VALUES (5, 20, 35, 'Cão', 11, 0);

INSERT INTO Inimigo(idPersonagem, defesa, ataque, nome, defesaMagica, agilidade) 
VALUES (6, 40, 45, 'Palhaço', 15, 0);


-- above works!

-- Entidade Item

INSERT INTO Item (tipo, idInventario, lojista) VALUES ('Armadura de couro', 1, 3);

INSERT INTO Item (tipo, idInventario, lojista) VALUES ('Espada de aço', 1, 3);

INSERT INTO Item (tipo, idInventario, lojista) VALUES ('Poção azul', 1, 3);

INSERT INTO Item (tipo, idInventario, lojista) VALUES ('Chave da porta enferrujada', 1, 3);

INSERT INTO Item (tipo, idInventario, lojista) VALUES ('Livro de feitiços', 1, 3);

INSERT INTO Item (tipo, idInventario, lojista) VALUES ('Amuleto da proteção', 1, 3);

INSERT INTO Item (tipo, idInventario, lojista) VALUES ('Anel de ataque', 1, 3);

INSERT INTO Item (tipo, idInventario, lojista) VALUES ('Poção de invisibilidade', 1, 3);

-- Entidade Armadura

INSERT INTO Armadura (idItem, defesa, defesaMagica, agilidade, descricao, valor, nome)
VALUES (1, 5, 2, 3, 'Armadura leve feita de couro resistente.', 50, 'Couro Leve');

INSERT INTO Armadura (idItem, defesa, defesaMagica, agilidade, descricao, valor, nome)
VALUES (2, 10, 0, 1, 'Malha de metal forjada para proteção básica.', 100, 'Malha Básica');

INSERT INTO Armadura (idItem, defesa, defesaMagica, agilidade, descricao, valor, nome)
VALUES (3, 15, 5, 2, 'Armadura robusta feita de aço temperado.', 200, 'Armadura de Aço');

INSERT INTO Armadura (idItem, defesa, defesaMagica, agilidade, descricao, valor, nome)
VALUES (4, 20, 15, 5, 'Armadura encantada com magia protetora.', 300, 'Armadura Encantada');

INSERT INTO Armadura (idItem, defesa, defesaMagica, agilidade, descricao, valor, nome)
VALUES (5, 30, 25, 10, 'Armadura lendária com poderes míticos.', 500, 'Armadura Mítica');

-- Entidade Habilidade

INSERT INTO Habilidade (custo, alma) VALUES (0, 'Feral');

INSERT INTO Habilidade (custo, alma) VALUES (10, 'Caótica');

INSERT INTO Habilidade (custo, alma) VALUES (25, 'Liberdade');

-- Entidade Ataque
INSERT INTO Ataque (tipoAtaque, descricao, idHabilidade, danoFisico, danoMagico) VALUES (1, 'Ataque básico', 1, 10, 0);

INSERT INTO Ataque (tipoAtaque, descricao, idHabilidade, danoFisico, danoMagico) VALUES (2, 'Bola de fogo', 2, 0, 15);

INSERT INTO Ataque (tipoAtaque, descricao, idHabilidade, danoFisico, danoMagico) VALUES (3, 'Corte de espada', 3, 20, 0);

-- Entidade Arma

INSERT INTO Arma (idItem, ataqueFisico, ataqueMagico, descrição, valor, nome) VALUES (1, 10, 0, 'Espada de aço', 100, 'Espada');

INSERT INTO Arma (idItem, ataqueFisico, ataqueMagico, descrição, valor, nome) VALUES (2, 15, 0, 'Machado de batalha', 150, 'Machado');

INSERT INTO Arma (idItem, ataqueFisico, ataqueMagico, descrição, valor, nome) VALUES (3, 20, 0, 'Lança longa de Aço', 200, 'Lança');

INSERT INTO Arma (idItem, ataqueFisico, ataqueMagico, descrição, valor, nome) VALUES (4, 0, 10, 'Bisturi médico', 100, 'Bisturi');

-- Entidade Legível

INSERT INTO Legivel (idItem, nome, conteudo, descricao, valor)
VALUES (1, 'O Livro dos Antigos', 'O Livro dos Antigos é um texto sagrado que contém conhecimento sobre os deuses e a história do mundo.', 'Este livro é um dos mais importantes do mundo de Fear and Hunger. Ele contém informações sobre os deuses, os ancestrais e a história do mundo. O livro é escrito em uma linguagem antiga e é muito difícil de entender.', 5000);

INSERT INTO Legivel (idItem, nome, conteudo, descricao, valor)
VALUES (2, 'O Livro dos Monstros', 'O Livro dos Monstros é uma enciclopédia de criaturas sobrenaturais que vivem no mundo de Fear and Hunger.', 'Este livro é uma referência essencial para qualquer aventureiro que deseja aprender sobre os perigos que o aguardam. O livro contém informações sobre centenas de criaturas, incluindo seus poderes, fraquezas e como combatê-las.', 2000);

INSERT INTO Legivel (idItem, nome, conteudo, descricao, valor)
VALUES (3, 'O Livro das Runas', 'O Livro das Runas é um grimório que contém informações sobre magia e feitiçaria.', 'Este livro é um tesouro de conhecimento para qualquer mago ou feiticeiro. O livro contém informações sobre uma variedade de magias, incluindo feitiços, encantamentos e runas.', 3000);

INSERT INTO Legivel (idItem, nome, conteudo, descricao, valor)
VALUES (4, 'O Livro dos Segredos', 'O Livro dos Segredos é um compêndio de conhecimentos ocultos e proibidos.', 'Este livro é um item perigoso que deve ser manejado com cuidado. O livro contém informações sobre uma variedade de tópicos, incluindo magia negra, necromancia e ocultismo.', 5000);

-- Entidade Consumível

INSERT INTO Consumivel (idItem, nome, adHp, adMente, descricao, valor)
VALUES (1, 'Carne Crua', 20, 0, 'Um pedaço de carne crua. Pode ser consumido para restaurar a saúde, mas aumenta a chance de ficar doente.', 10);

INSERT INTO Consumivel (idItem, nome, adHp, adMente, descricao, valor)
VALUES (2, 'Carne Cozida', 40, 0, 'Um pedaço de carne cozida. Pode ser consumido para restaurar a saúde e a mente.', 20);

INSERT INTO Consumivel (idItem, nome, adHp, adMente, descricao, valor)
VALUES (3, 'Pão', 10, 0, 'Um pedaço de pão. Pode ser consumido para restaurar a saúde, mas não restaura a mente.', 5);

INSERT INTO Consumivel (idItem, nome, adHp, adMente, descricao, valor)
VALUES (4, 'Vinho', 0, 10, 'Uma garrafa de vinho. Pode ser consumida para restaurar a mente, mas não restaura a saúde.', 10);
