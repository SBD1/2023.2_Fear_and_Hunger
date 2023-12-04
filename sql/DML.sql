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