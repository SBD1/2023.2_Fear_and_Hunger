# DML

```

INSERT INTO Alma(nome, descricao) VALUES
('Infinito', 'A alma do infinito faz com que você deseje constantemente a liberdade e force sua criatividade até o limite'),
('Dominação', 'A alma da dominação faz com que os que estão ao seu redor se curvem às suas vontades. Você é um líder natural, mas pode acabar se cegando com relação aos próprios erros.'),
('Feral', 'A alma feral. Você está de maneira inata rendido aos instintos mais selvagens. É agressivo e age pelo puro instinto de sobrevivência.'),
('Iluminado', 'A alma do iluminado. Você está buscando incansavelmente por novos conhecimentos e pelos segredos escondidos do povo comum.'),
('Atormentado', 'A alma do atormentado. Você está destinado a sofrer a cada passo que dá na sua vida. No fim isso te faz mais forte fisicamente e faz com que sua vontade de ferro rivalize até mesmo com a vontade dos próprios deuses.');

INSERT INTO Regiao(nomeR, descricao, tranca, imgtexto)
VALUES
('Praça Central', 'Aqui é o centro da cidade. Aonde a população costumava se reunir para conversar e comercializar.', false, '-'),
('Igreja', 	'A única igreja da cidade. Aqui os moradores dedicavam preces a All-mer, o último dos deuses antigos, também conhecido como “aquele que ascendeu”.', true, '-'),
('Circo', 	'Um lugar que antes era usado para diversão e entretenimento, mas que atualmente tem um aspecto sinistro e abandonado.', true, '-'),
('Mágica Dr. Kefer', 	'Um pequeno edifício de aparência desgastada.', false, '-'),
('Livraria', 'A livraria comercializava todo tipo de livro dos mais variados assuntos.', false, '-'),
('Floresta', 'O bosque que fica ao redor da cidade.', false, '-'),
('Casa do lenhador', 'A casa do lenhador do vilarejo', false, '-');

INSERT INTO Local(idRegiao, nomeL, imgtexto)
VALUES
(1, 'Fonte', 'A fonte da praça central.'),
(1, 'Bancas abandonadas', 'Banquinhas aonde antes eram comercializados diversos produtos.'),
(1, 'Árvore da praça', 'A grande árvore da praça central. Aqui as crianças se reuniam para brincar.'),
(2, 'Altar', 'O grande altar da igreja.'),
(2, 'Confessionário', 'Aqui os cidadãos confessavam seus pecados.'),
(2, 'Sino', 'O único sino da cidade.'),
(2, 'Segundo andar', 'Segundo andar da igreja.'),
(3, 'Jaulas', 'Aqui ficavam presos os animais que serviam para os espetáculos do circo. Você vê diversos ossos empilhados, dos animais que foram abandonados às pressas para morrer de fome.'),
(3, 'Carroça', ''),
(3, 'Camarim', 'O camarim aonde ficavam as principais atrações do círculo. Esse lugar está com um ar muito sinistro e pesado. Você se sente mais cansado a cada minuto que passa aqui.'),
(3, 'Centro de espetáculos', 'O centro dos espetáculos do circo, Aqui era aonde tudo era apresentado.'),
(4, 'Primeiro andar', 'O primeiro andar,'),
(4, 'Porão', 'Porão sinistro'),
(5, 'Estantes do 1 andar', 'Um monte de estantes cheias de livros. Eles estão cobertos por um mofo estranho.'),
(5, 'Banheiro', 'Banheiro da biblioteca.'),
(5, 'Estantes do 2 andar', 'Um monte de estantes cheias de livros no segundo andar. Daqui de cima você pode ver.'),
(5, 'Balcão de atendimento', 'O balcão de atendimento da biblioteca'),
(6, 'Bosque profundo', 'Essa parte é a mais densa do bosque. Você sente que está sendo constantemente observado aqui.'),
(6, 'Flores', 'Essa parte é linda, você consegue ver uma série de flores coloridas.'),
(6, 'Altar suspeito', 'Um altar isolado no meio do bosque. Algo não está certo aqui.'),
(6, 'Pequena caverna', 'Uma pequena caverna no final do bosque.'),
(7, 'Sala de estar', 'Essa sala está toda destruída'),
(7, 'Cozinha', 'A cozinha do lenhador. Tem sangue nas paredes.'),
(7, 'Suíte', 'O quarto com uma cama de casal. '),
(7, 'Porão', 'Esse porão está cheio de sangue espalhado nas paredes'),
(7, 'Banheiro', 'O banheiro da casa do lenhador.');

INSERT INTO Personagem(IdPersonagem, tipoP, alma)
VALUES
(1,'PJ', 'Dominação'),
(2, 'PNJ', NULL),
(3, 'PNJ', 'Atormentado'),
(4, 'PNJ', 'Atormentado'),
(5, 'PNJ', 'Iluminado'),
(6, 'PNJ', 'Feral'),
(7, 'PNJ', 'Infinito'),
(8, 'PNJ', 'Feral'),
(9, 'PNJ', 'Iluminado');


INSERT INTO Personagem_jogavel(idPersonagem, nome, atq, agilidade, defesaM, defesa, atqM, hpAtual, hpMax, menteAtual, menteMax, arma, armadura, acessorio1, acessorio2, local, regiao)
VALUES (1, 'Jakov', 0, 0, 0, 0, 0, 100, 100, 5, 5, NULL, NULL, NULL, NULL, 3, 1);

insert into personagem_nao_jogavel(idpersonagem, tipopnj) values
(02, 'l'),
(03, 'i'),
(04, 'i'),
(05, 'i'),
(06, 'i'),
(07, 'i'),
(08, 'i'),
(09, 'i');

insert into lojista(idpersonagem, local, regiao, fala, descricao, atq, agilidade, defesaM, defesa, atqM, nome)
values(02, 12, 04, 'Olá, estrangeiro. Vendo aqui uma série de artigos que talvez
   	possam... te ajudar a se manter vivo neste inferno em que todos perderam a cabeça.',
   	'Um homem de pele pálida e com metade do rosto em carne viva. Utiliza
   	uma faixa que venda seus olhos, mas parece enxergar muito bem tudo que
   	acontece ao seu redor. Veste uma manta longa que cobre todo o seu corpo
   	exceto os dois antebraços.', 35, 15, 10, 10, 0, 'Dr. Kefer');

insert into inimigo(idpersonagem, nome, atq, agilidade, defesaM, defesa,
                	atqM, descricao, fala) VALUES
                	(03, 'Ghoul', 20, 15, 5, 5, 0, 'Segundo os novos Deuses, são aqueles cuja fortitude física e
                 	mental não conseguiu aguentar a escuridão opressora. Tem uma aparência
                 	pálida e um corpo necrosado e coberto de sangue... se é o dele ou de outra
                 	pessoa, só os deuses sabem.', 'Me mate, tenha compaixão e me mate!!'),
                 	(04, 'Chamuscado', 0, 0, 0, 0, 0, 'Um ser em profunda agonia, foi afetado pela maldição do Deus antigo Rher.
                  	Está com feridas de arranhão em todo o corpo, você vê que a pele do rosto
                  	está em carne viva devido aos arranhões.', 'Tira isso de mim! TIRA ISSO DE MIM
                  	PELO AMOR DE DEUS! Eu consigo sentir isso dentro de mim. Está se rastejando
                  	dentro da minha pele!'),
                 	(05, 'Padre decrépito', 0, 15, 20, 15, 25, 'Um silêncio sinistro se instaura no ambiente com somente você e o sacerdote sombrio, que te encara com um olhar psicótico.', 'O padre faz o sinal da cruz com suas mãos, movendo de um ombro para o outro, depois para o estômago e por fim até a testa.'),
                 	(06, 'Cão sem cabeça', 35, 15, 10, 20, 0, 'Uma besta misteriosa se aproxima de você com saliva pingando de algo que parece uma boca saindo do seu torso. A criatura parece querer te caçar.', 'O cão parece lutar muito para conseguir respirar.'),
                 	(07, 'Agulhas', 40, 19, 15, 20, 0, 'Um palhaço com um sorriso macabro se aproxima lentamente de você.
                  	Na sua mão esquerda ele segura uma seringa com conteúdo misterioso dentro.
                  	Na direita, um chicote com várias seringas penduradas na ponta.',
                  	'Agulhas te encara no fundo dos olhos e começa a rir de maneira exagerada.
                  	Ele segura no estômago enquanto aponta o dedo para você.'),
                 	(08, 'Lenhador', 40, 12, 0, 0, 0, 'Um lenhador nu está parado encarando você. Em sua mão direita
                  	está um machado enorme coberto de sangue.', 'O lenhador se aproxima de você ameaçadoramente. Há uma raiva silenciosa em seus olhos. Uma sensação de completo terror preenche o ar.'),
                 	(09, 'Bruxa das trevas', 15, 20, 20, 10, 40, 'Uma seguidora do Deus Gro-goroth, está pronta para derramar
                  	sangue em seu nome.', 'Eu sou o que vocês chamam de bruxa. Vendi minha alma para as artes sangrentas há muito tempo atrás.');

insert into habilidade(idhabilidade, alma, tipohab) values
(01, 'Dominação', 'A'),
(02, 'Dominação', 'A'),
(03, 'Infinito', 'A'),
(04, 'Feral', 'P'),
(05, 'Iluminado', 'S'),
(06, 'Atormentado', 'A');

insert into ataque(idhabilidade, nome, custo, descricao, danomagico, danofisico) values
(01, 'Esbarrão', 0, 'Um esbarrão forte no seu inimigo', 0, 5),
(02, 'Ataque básico', 0, 'Um ataque simples com a arma equipada', 0, 5),
(03, 'Perfurar', 0, 'Você perfura seu inimigo, ignorando a armadura', 0, 20),
(04, 'Ataque mágico', 1, 'Um ataque mágico', 25, 0);

insert into passiva(idhabilidade, adatqm, addefm, admentemax, adagil, adatqF, adDef, adHpMax, nome, custo, descricao)
VALUES
(04, 0, 0, 0, 0, 0, 0, 0, 'Plano de fuga', 0, 'Aumenta suas chances de escapar de uma luta');

insert into suporte(idhabilidade, nome, adatqm, adDefM, adAgil, adHp, custo, descricao)
values (05, 'Sussuros amorosos', 0, 5, 0, 60, 2, 'Os sussuros amorosos da Deus Sylvian');

INSERT INTO Item (tipoItem)
VALUES
('Acessorio'),
('Acessorio'),
('Acessorio'),
('Acessorio'),
('Armadura'),
('Armadura'),
('Armadura'),
('Legivel'),
('Legivel'),
('Arma'),
('Arma'),
('Arma'),
('Arma'),
('Consumivel'),
('Consumivel'),
('Consumivel'),
('Chave'),
('Chave');



INSERT INTO Acessorio(idItem, adAtqM, adAgil, adDefM, adDef, adAtqF, valor, peso, nome, descricao)
VALUES
(1, 0, 6, 5, 0, 0, 200, 2, 'Amuleto de agilidade', 'Um amuleto bruto que representa uma divindade de rato. Este peculiar é imbuído de orações de ratkin que concedem ao seu usuário um pequeno impulso na agilidade para ajudar a evitar possíveis perigos.'),
(2, 0, 0, 0, 10, 5, 150, 5, 'Escudo de tapume', 'Um escudo simples feito com um tapume velho de madeira.'),
(3, 0, 0, 15, 15, 0, 350, 6, 'Escudo de quatro mãos', 'Um escudo encantado, ornamentado com mãos decepadas colocadas para proteger de poderes sobrenaturais.'),
(4, 15, 0, 5, 0, 0, 200, 3, 'Chac chac', 'Um chocalho aparentemente simples. A combinação das pedras internas e das várias pérolas amarradas nelas cria um ritmo hipnótico que ajuda a focar em poderes de outro mundo.');


INSERT INTO Armadura(idItem, adAgil, adDef, adDefM, valor, peso, nome, descricao)
VALUES
(5, 0,     5,     5,     100, 2, 'Colete de couro',     'Um colete simples de couro'),
(6, 0,     15, 15, 350, 5, 'Armadura de placa', 'Uma armadura de placas de aço duríssimas que vão te ajudar a aguentar um pouco mais de dano.'),
(7, -4, 20, 20, 600, 10, 'Armadura de penitência',     'Uma armadura brutal utilizada pelos cavaleiros penitentes do Vaticano. Não pode ser retirada quando colocada, e se prende ao usuário com diversas placas de metal que entram por dentro da carne, o colocando em um Estado de tormenta eterna.');


INSERT INTO Legivel(idItem, conteudo, valor, peso, nome, descricao)
VALUES
(8, 'Os Cavaleiros da Penitência são uma unidade especial da cidade do Vaticano que usa armaduras feitas sob medida. Os Cavaleiros da Penitência são usados nas tarefas e missões mais perigosas, onde as chances de sobrevivência são especialmente baixas. Assim, a armadura foi projetada apenas para ser vestida. Não há como removê-la uma vez que foi escolhido para a missão. A armadura possui fileiras de pequenos espinhos que perfuram a pele de seu usuário. A dor tem como objetivo limpar a mente para a tarefa em questão e também aumentar a fúria no meio do combate. Devido à natureza dos Cavaleiros da Penitência e da Armadura da Penitência, apenas condenados com penas de prisão perpétua ou de morte são recrutados para a unidade. Os recrutas recebem uma última chance de se arrepender de seus crimes e expiar seus pecados antes que o Ascendente Alll-mer pronuncie o julgamento final.', 0, 0,     'Os cavaleiros da penitência',     'Um livro sobre Os Cavaleiros da Penitência da Cidade do Vaticano.'),
(9, 'Muito parecido com o sol – a lua é uma das entidades primordiais e, portanto, tem conhecimentos e crenças escritas desde o início dos tempos. Isso torna difícil separar os fatos da ficção e as divagações malucas das verdades ocultas. Detalhes consistentes entre a miríade de histórias parecem sugerir um deus chamado Rher. Também conhecido como Deus Malandro e Deus da Lua. Nos escritos mais antigos, Rher é descrito como o deus dos loucos e daqueles que sucumbiram à loucura. Sua bênção para os homens é o luar, que supostamente revela a verdade sob a sujeira humana. Uma verdade que muitas vezes é demais para a mente humana lidar. Pode-se debater se a sua versão da verdade é mais precisa do que a da sujeira humana. Ao contrário de muitos outros deuses mais antigos, o papel de Rher dentro do grande destino das coisas permanece um mistério. Só de olhar para o céu noturno é possível perceber sua presença, em um sono eterno. Isso torna seu sigilo ainda mais irritante, ele está literalmente se escondendo à vista de todos.', 0, 0, 'Bíblia de pele - Deus Rher.', 'Um importante livro ocultista escrito nos tempos medievais por Enki Ankarian.');

INSERT INTO Arma(idItem, adAtqM, adDef, adAtqF, valor, peso, nome, descricao)
VALUES
(10, 0, 0, 10, 50, 1, 'Faca', 'Uma faca simples de cozinha'),
(11, 0, 0, 20, 150, 1, 'Espada curta', 'Espada curta de ferro. A lâmina está um pouco desgastada, mas a espada em si é fácil e rápida de manusear.'),
(12, 0, 5, 30, 250, 1, 'Adaga', 'Uma adaga daquelas tipicamente utilizadas por assassinos profisionais'),
(13, 15, 0, 45, 500, 4, 'Miasma', 'Uma espada de outro mundo que exala gases tóxicos. Diz-se que a espada abriga a força de seis homens.');

INSERT INTO Consumivel(idItem, conteudo, adMente, adDefM, adAgil, adHp, valor, peso, nome, descricao)
VALUES
(14, NULL, 0, 0, 0, 30, 100, 1, 'Frasco azul',     'Um frasco cheio de liquido azul'),
(15, NULL, 0, 0, 0, 65, 250, 1, 'Frasco azul claro', 'Um frasco cheio de líquido azul claro'),
(16, NULL, 2, 0, 0, 0, 115, 1, 'Frasco marrom', 'Um frasco cheio de líquido marrom.');

INSERT INTO Chave(idItem, regiao, valor, peso, nome, descricao)
VALUES
(17, 2, NULL, 0, 'Chave da Igreja', 'Uma chave antiga que abre a porta da igreja'),
(18, 3, NULL, 0, 'Chave do Circo', 'Uma reluzente que libera a área do Circo.');

insert into instancia_inimigo(idInst, idpersonagem, idlocal, regiao)
VALUES
(01, 03, 02, 01),
(02, 04, 03, 01),
(03, 08, 25, 07),
(04, 05, 05, 02),
(05, 06, 18, 06),
(06, 06, 21, 06),
(07, 09, 20, 06),
(08, 07, 10, 03),
(09, 03, 11, 03),
(10, 03, 07, 02);

INSERT INTO instancia_item(idInst, idItem, idRegiao, idLocal)
VALUES
(1, 10, 1, 3),
(2, 11, 6, 19),
(2, 8, 5, 14),
(4, 9, 5, 16),
(5, 7, 7, 24),
(6, 6, 2, 4),
(7, 15, 1, 3),
(8, 15, 2, 4),
(9, 14, 6, 19),
(10, 16, 1, 3),
(11, 16, 5, 16),
(12, 16, 5, 14),
(13, 3, 6, 21),
(14, 2, 1, 2),
(15, 4, 2, 4);

insert into parte(idpersonagem, tipoparte, probacerto,
              	hpatual,hpmax)
values
(01, 'torso', 100, 60, 60),
(01, 'cabeca', 15, 10, 10),
(01, 'braco', 100, 20, 20),
(01, 'braco', 100, 20, 20),
(01, 'cabeca', 15, 10, 10),
(02, 'torso', 100, 60, 60),
(02, 'cabeca', 15, 10, 10),
(02, 'braco', 100, 20, 20),
(02, 'braco', 100, 20, 20),
(02, 'perna', 100, 20, 20),
(02, 'perna', 100, 20, 20),
(03, 'torso', 100, 60, 60),
(03, 'cabeca', 15, 10, 10),
(03, 'braco', 100, 20, 20),
(03, 'braco', 100, 20, 20),
(03, 'perna', 100, 20, 20),
(03, 'perna', 100, 20, 20),
(04, 'torso', 100, 60, 60),
(04, 'cabeca', 15, 10, 10),
(04, 'braco', 100, 20, 20),
(04, 'braco', 100, 20, 20),
(04, 'perna', 100, 20, 20),
(04, 'perna', 100, 20, 20),
(05, 'torso', 100, 60, 60),
(05, 'cabeca', 15, 10, 10),
(05, 'braco', 100, 20, 20),
(05, 'braco', 100, 20, 20),
(05, 'perna', 100, 20, 20),
(05, 'perna', 100, 20, 20),
(06, 'torso', 100, 60, 60),
(06, 'cabeca', 15, 10, 10),
(06, 'braco', 100, 20, 20),
(06, 'braco', 100, 20, 20),
(06, 'perna', 100, 20, 20),
(06, 'perna', 100, 20, 20),
(07, 'torso', 100, 60, 60),
(07, 'cabeca', 15, 10, 10),
(07, 'braco', 100, 20, 20),
(07, 'braco', 100, 20, 20),
(07, 'cabeca', 15, 10, 10),
(07, 'perna', 100, 20, 20),
(07, 'perna', 100, 20, 20),
(08, 'torso', 100, 60, 60),
(08, 'braco', 100, 20, 20),
(08, 'braco', 100, 20, 20),
(08, 'perna', 100, 20, 20),
(08, 'perna', 100, 20, 20),
(09, 'torso', 100, 60, 60),
(09, 'cabeca', 15, 10, 10),
(09, 'braco', 100, 20, 20),
(09, 'braco', 100, 20, 20),
(09, 'perna', 100, 20, 20),
(09, 'perna', 100, 20, 20);

INSERT INTO inventario (idInventario, idPersonagem, dinAtual, dinMax, capAtual, capTotal)
VALUES
(1, 01, 0, 1000, 0, 100);

```
