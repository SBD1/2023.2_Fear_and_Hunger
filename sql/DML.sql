-- Entidade Alma:

INSERT INTO Alma(nome, personagem) VALUES ('Liberdade', 'NULL' );

INSERT INTO Alma(nome, personagem) VALUES('Sombria', 'NULL');

INSERT INTO Alma(nome, personagem) VALUES('Feral', 'NULL');

INSERT INTO Alma(nome, personagem) VALUES('Caótica', 'NULL');

-- Entidade Personagem:

INSERT INTO Personagem(idPersonagem, alma, local, tipoP) VALUES('NI01', 'Feral', 'NULL', 'Inimigo');

-- Entidade Personagem Não Jogável:

INSERT INTO PersonagemNaoJogavel(idPnj, tipoPnj) VALUES ('NL01', 'L');

INSERT INTO PersonagemNaoJogavel(idPnj, tipoPnj) VALUES ('NI01', 'I');

INSERT INTO PersonagemNaoJogavel(idPnj, tipoPnj) VALUES ('NI02', 'I');

INSERT INTO PersonagemNaoJogavel(idPnj, tipoPnj) VALUES ('NI03', 'I');

INSERT INTO PersonagemNaoJogavel(idPnj, tipoPnj) VALUES ('NI04', 'I');

INSERT INTO PersonagemNaoJogavel(idPnj, tipoPnj) VALUES ('NI05', 'I');

INSERT INTO PersonagemNaoJogavel(idPnj, tipoPnj) VALUES ('NI06', 'I');


-- Entidade Lojista:

INSERT INTO Lojista(idLojista, agilidade, defesaMagica, defesa, ataque, nome) VALUES('NL01', 11, 40, 15, 40, 'Sinistro');

-- Entidade Inimigo:

INSERT INTO Inimigo(idInimigo, defesa, ataque, nome, tipoPnj, agilidade) VALUES ('NI01', 15, 25, 'Ghoul', 'Inimigo', 11);

INSERT INTO Inimigo(idInimigo, defesa, ataque, nome, tipoPnj, agilidade) VALUES ('NI02', 10, 10, 'Chamuscado', 'Inimigo', 11);

INSERT INTO Inimigo(idInimigo, defesa, ataque, nome, tipoPnj, agilidade) VALUES('NI03', 20, 35, 'Padre Decrépto', 'Inimigo', 11);

INSERT INTO Inimigo(idInimigo, defesa, ataque, nome, tipoPnj, agilidade) VALUES('NI04', 25, 40, 'Zelador ', 'Inimigo', 14);

INSERT INTO Inimigo(idInimigo, defesa, ataque, nome, tipoPnj, agilidade) VALUES('NI05', 20, 35, 'Cão ', 'Inimigo', 11);

INSERT INTO Inimigo(idInimigo, defesa, ataque, nome, tipoPnj, agilidade) VALUES('NI06', 40, 45, 'Palhaço ', 'Inimigo', 15);

-- Entidade Armadura

INSERT INTO Armadura (idItem, defesa, defesaMagica, agilidade, descricao, valor, nome)
VALUES (1, 1, 0, 1, 'Armadura de couro feita de peles de animais selvagens.', 50, 'Couro');

INSERT INTO Armadura (idItem, defesa, defesaMagica, agilidade, descricao, valor, nome)
VALUES (2, 3, 0, 3, 'Uma malha feita de fios de metal, resistente e duravel.', 100, 'Malha');

INSERT INTO Armadura (idItem, defesa, defesaMagica, agilidade, descricao, valor, nome)
VALUES (3, 5, 0, 5, 'Uma armadura de aço bem equilibrada e confiável.', 200, 'Aço');

INSERT INTO Armadura (idItem, defesa, defesaMagica, agilidade, descricao, valor, nome)
VALUES (4, 0, 10, 0, 'Uma armadura mágica que confere poderes sobrenaturais ao seu portador.', 300, 'Mágico');

INSERT INTO Armadura (idItem, defesa, defesaMagica, agilidade, descricao, valor, nome)
VALUES (5, 10, 10, 10, 'Uma armadura mítica de origem divina, confere habilidades e poderes sobrenaturais.', 500, 'Mítico');

-- Entidade Ataque
INSERT INTO Ataque (tipoAtaque, descricao, idHabilidade, danoFisico, danoMagico) VALUES (1, 'Ataque básico', 1, 10, 0);

INSERT INTO Ataque (tipoAtaque, descricao, idHabilidade, danoFisico, danoMagico) VALUES (2, 'Bola de fogo', 2, 0, 15);

INSERT INTO Ataque (tipoAtaque, descricao, idHabilidade, danoFisico, danoMagico) VALUES (3, 'Corte de espada', 3, 20, 0);

INSERT INTO Ataque (tipoAtaque, descricao, idHabilidade, danoFisico, danoMagico) VALUES (4, 'Mordida venenosa', 4, 10, 5);

INSERT INTO Ataque (tipoAtaque, descricao, idHabilidade, danoFisico, danoMagico) VALUES (5, 'Grito ensurdecedor', 5, 0, 10);

-- Entidade Item

INSERT INTO Item (idItem, tipo, idInventario, lojista) VALUES ('Armadura de couro', 1, 1);

INSERT INTO Item (idItem, tipo, idInventario, lojista) VALUES ('Espada de aço', 2, 1);

INSERT INTO Item (idItem, tipo, idInventario, lojista) VALUES ('Poção azul', 3, 1);

INSERT INTO Item (idItem, tipo, idInventario, lojista) VALUES ('Chave da porta enferrujada', 4, 1);

INSERT INTO Item (idItem, tipo, idInventario, lojista) VALUES ('Livro de feitiços', 5, 1);

INSERT INTO Item (idItem, tipo, idInventario, lojista) VALUES ('Amuleto da proteção', 6, 1);

INSERT INTO Item (idItem, tipo, idInventario, lojista) VALUES ('Anel de ataque', 7, 1);

INSERT INTO Item (idItem, tipo, idInventario, lojista) VALUES ('Poção de invisibilidade', 8, 1);

INSERT INTO Item (idItem, tipo, idInventario, lojista) VALUES ('LEG01', 'Legivel', 9, 1);

INSERT INTO Item (idItem, tipo, idInventario, lojista) VALUES ('CONSU01', 'Chave da porta secreta', 10, 1);


-- Entidade Arma

INSERT INTO Arma (idItem, ataqueFisico, ataqueMagico, descrição, valor, nome) VALUES (1, 10, 0, 'Espada de aço', 100, 'Espada');
INSERT INTO Arma (idItem, ataqueFisico, ataqueMagico, descrição, valor, nome) VALUES (2, 15, 0, 'Machado de batalha', 150, 'Machado');
INSERT INTO Arma (idItem, ataqueFisico, ataqueMagico, descrição, valor, nome) VALUES (3, 20, 0, 'Lança longa de Aço', 200, 'Lança');
INSERT INTO Arma (idItem, ataqueFisico, ataqueMagico, descrição, valor, nome) VALUES (4, 0, 10, 'Bisturi médico', 100, 'Bisturi');



-- Entidade Acessório

INSERT INTO Acessorio (idItem, defesa, defesaMagica, agilidade, ataqueFisico, ataqueMagico, descricao, valor, nome) VALUES ('ACES01', 0, 15, 0, 0, 0, 'Um colar com uma pedra da alma acoplada. Protege contra os poderes sobrenaturais', NULL, 'Colar de pedra da Alma');

INSERT INTO Acessorio (idItem, defesa, defesaMagica, agilidade, ataqueFisico, ataqueMagico, descricao, valor, nome) VALUES ('ACES02', 0, 0, 0, 0 , 5,'Um anel com um diamante de sangue acoplado. Cheira a morte.' , NULL, 'anel dos espectros');

INSERT INTO Acessorio (idItem, defesa, defesaMagica, agilidade, ataqueFisico, ataqueMagico, descricao, valor, nome) VALUES ('ACES03', 0, 0, 6, 0, 0, 'Um amuleto em formato de ratazana. As ratazanas deformadas parecem se interessar por ele e você se sente mais ágil quando o tem por perto',  NULL, 'Amuleto de ratazana')

INSERT INTO Acessorio (idItem, defesa, defesaMagica, agilidade, ataqueFisico, ataqueMagico, descricao, valor, nome) VALUES ('ACES04', 0, 0, 0, 5, 0, 'Um óculos de grau. Enxergar melhor pode melhorar seus ataques.',  NULL, 'Óculos');


-- Entidade Legível
INSERT INTO
    Legivel (nome, conteúdo, descrição, valor)
VALUES
    (
        'O Livro dos Antigos',
        'O Livro dos Antigos é um texto sagrado que contém conhecimento sobre os deuses e a história do mundo.',
        'Este livro é um dos mais importantes do mundo de Fear and Hunger. Ele contém informações sobre os deuses, os ancestrais e a história do mundo. O livro é escrito em uma linguagem antiga e é muito difícil de entender.',
        5000
    );

INSERT INTO
    Legivel (nome, conteúdo, descrição, valor)
VALUES
    (
        'O Livro dos Monstros',
        'O Livro dos Monstros é uma enciclopédia de criaturas sobrenaturais que vivem no mundo de Fear and Hunger.',
        'Este livro é uma referência essencial para qualquer aventureiro que deseja aprender sobre os perigos que o aguardam. O livro contém informações sobre centenas de criaturas, incluindo seus poderes, fraquezas e como combatê-las.',
        2000
    );

INSERT INTO
    Legivel (nome, conteúdo, descrição, valor)
VALUES
    (
        'O Livro das Runas',
        'O Livro das Runas é um grimório que contém informações sobre magia e feitiçaria.',
        'Este livro é um tesouro de conhecimento para qualquer mago ou feiticeiro. O livro contém informações sobre uma variedade de magias, incluindo feitiços, encantamentos e runas.',
        3000
    );

INSERT INTO
    Legivel (nome, conteúdo, descrição, valor)
VALUES
    (
        'O Livro dos Segredos',
        'O Livro dos Segredos é um compêndio de conhecimentos ocultos e proibidos.',
        'Este livro é um item perigoso que deve ser manejado com cuidado. O livro contém informações sobre uma variedade de tópicos, incluindo magia negra, necromancia e ocultismo.',
        5000
    );

-- Entidade Consumível

INSERT INTO Consumivel (idItem, nome, adHp, adMente, descrição, valor)
VALUES (1,'Carne Crua', 20, 0, 'Um pedaço de carne crua. Pode ser consumido para restaurar a saúde, mas aumenta a chance de ficar doente.', 10);

INSERT INTO Consumivel (idItem, nome, adHp, adMente, descrição, valor)
VALUES (2,'Carne Cozida', 40, 0, 'Um pedaço de carne cozida. Pode ser consumido para restaurar a saúde e a mente.', 20);

INSERT INTO Consumivel (idItem, nome, adHp, adMente, descrição, valor)
VALUES (3,'Pão', 10, 0, 'Um pedaço de pão. Pode ser consumido para restaurar a saúde, mas não restaura a mente.', 5);

INSERT INTO Consumivel (idItem, nome, adHp, adMente, descrição, valor)
VALUES (4,'Vinho', 0, 10, 'Uma garrafa de vinho. Pode ser consumida para restaurar a mente, mas não restaura a saúde.', 10);

-- Entidade Inventário

INSERT INTO Inventario (idPersonagem, idItem)
VALUES (1, 1);

INSERT INTO Inventario (idPersonagem, idItem)
VALUES (2, 2);

-- Entidade Habilidade

INSERT INTO Habilidade (idHabilidade, nome, custo, alma)
VALUES (1, 'Ataque Básico', 0, 'Feral');

INSERT INTO Habilidade (idHabilidade, nome, custo, alma)
VALUES (2, 'Bola de Fogo', 10, 'Caótica');

INSERT INTO Habilidade (idHabilidade, nome, custo, alma)
VALUES (3, 'Cura', 25, 'Liberdade');


-- Entidade Genital

INSERT INTO Genital(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES('G01', 'NI04', 'G', 30, 90, 30);

INSERT INTO Genital(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES('G02', 'NI06', 'G', 25, 90, 40);

-- Entidade Cabeça

INSERT INTO Cabeça(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('C01', 'NI01', 'C', 5, 5, 5);

INSERT INTO Cabeça(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('C02', 'NI02', 'C', 5, 5, 5);

INSERT INTO Cabeça(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('C03', 'NI03', 'C', 5, 5, 5);

INSERT INTO Cabeça(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('C04', 'NI04', 'C', 5, 5, 5);

INSERT INTO Cabeça(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('C05', 'NI05', 'C', 5, 5, 5);

INSERT INTO Cabeça(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('C06', 'NI06', 'C', 5, 5, 5);

-- Entidade Olho

INSERT INTO Olho(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('O01', 'NI01', 'O', 1, 85, 1,);

INSERT INTO Olho(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('O02', 'NI02', 'O', 1, 85, 1,);

INSERT INTO Olho(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('O03', 'NI03', 'O', 1, 85, 1,);

INSERT INTO Olho(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('O04', 'NI04', 'O', 1, 85, 1,);

INSERT INTO Olho(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('O05', 'NI05', 'O', 1, 85, 1,);

INSERT INTO Olho(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('O06', 'NI06', 'O', 1, 85, 1,);

-- Entidade Braço

INSERT INTO Braco(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('B01', 'NI01', 'B', 20, 80, 20);

INSERT INTO Braco(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('B02', 'NI01', 'B', 20, 80, 20);

INSERT INTO Braco(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('B03', 'NI02', 'B', 10, 80, 10);

INSERT INTO Braco(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES ('B04', 'NI02', 'B', 10, 80, 10);

-- Entidade Torço

INSERT INTO Torco(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES('T01', 'NI01', 'T', 40, 95, 40);

INSERT INTO Torco(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES('T01', 'NI02', 'T', 30, 95, 30);

INSERT INTO Torco(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES('T01', 'NI03', 'T', 90, 95, 90);

INSERT INTO Torco(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES('T01', 'NI04', 'T', 150, 95, 150);

-- Entidade Perna

INSERT INTO Perna(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES('P01', 'NI01', 'P', 30, 85, 30);

INSERT INTO Perna(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES('P02', 'NI01', 'P', 30, 85, 30);

INSERT INTO Perna(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES('P03', 'NI02', 'P', 15, 85, 15);

INSERT INTO Perna(idParte, Personagem, tipoParte, hpMaximo, hitChance, hpAtual) VALUES('P04', 'NI02', 'P', 15, 85, 15);
