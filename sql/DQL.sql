-- Consultar detalhes de um personagem específico:

SELECT * FROM Personagem WHERE idPersonagem = [ID do personagem];

-- Obter itens no inventário de um personagem:

SELECT I.*
FROM Inventario AS Inv
JOIN Item AS I ON Inv.FK_item = I.idItem
WHERE Inv.FK_idPersonagem = [ID do personagem];

-- Obter habilidades associadas a uma alma específica:

SELECT H.*
FROM Alma AS A
JOIN Habilidade AS H ON A.idAlma = H.FK_alma
WHERE A.nome = '[Nome da Alma]';

-- Consultar inimigos com defesa acima de um certo valor:

SELECT * FROM Inimigo WHERE defesa > [Valor de defesa];

-- Obter todos os itens de uma determinada lista:

SELECT I.*
FROM Lista AS L
JOIN Item AS I ON L.FK_item = I.idItem
WHERE L.idLista = [ID da lista];

-- Consultar todos os personagens em um local específico:

SELECT P.*
FROM Personagem AS P
JOIN Local AS L ON P.FK2_local = L.idLocal
WHERE L.idLocal = '[ID do Local]';

-- Obter detalhes da arma associada a um personagem:

SELECT Ar.*
FROM PersonagemNaoJogavel AS PNJ
JOIN Arma AS Ar ON PNJ.FK4_arma = Ar.idItem
WHERE PNJ.FK_idPersonagem = [ID do personagem];





-- Consultar todas as almas coletadas por um personagem específico:

SELECT A.*
FROM Coletadas AS C
JOIN Alma AS A ON C.FK2_alma = A.idAlma
WHERE C.FK1_personagem = [ID do personagem];


-- Consultar todas as habilidades de um personagem baseadas em suas almas coletadas:

SELECT H.*
FROM Personagem AS P
JOIN Coletadas AS C ON P.idPersonagem = C.FK1_personagem
JOIN Alma AS A ON C.FK2_alma = A.idAlma
JOIN Habilidade AS H ON A.idAlma = H.FK_alma
WHERE P.idPersonagem = [ID do personagem];

-- Obter armadura associada a um personagem:

SELECT Am.*
FROM PersonagemNaoJogavel AS PNJ
JOIN Armadura AS Am ON PNJ.FK5_armadura = Am.idItem
WHERE PNJ.FK_idPersonagem = [ID do personagem];

-- Consultar inimigos com ataque mágico acima de um certo valor:
SELECT * FROM Inimigo WHERE ataqueMagico > [Valor de ataque mágico];

-- Obter todos os acessórios associados a um personagem não jogável:

-- Para o primeiro acessório:
SELECT Ac.*
FROM PersonagemNaoJogavel AS PNJ
JOIN Acessorio AS Ac ON PNJ.FK2_acessorio1 = Ac.idItem
WHERE PNJ.FK_idPersonagem = [ID do personagem];

-- Para o segundo acessório:
SELECT Ac.*
FROM PersonagemNaoJogavel AS PNJ
JOIN Acessorio AS Ac ON PNJ.FK3_acessorio2 = Ac.idItem
WHERE PNJ.FK_idPersonagem = [ID do personagem];


-- Consultar todos os itens de defesa mágica acima de um certo valor em uma lista:
SELECT I.*
FROM Lista AS L
JOIN Item AS I ON L.FK_item = I.idItem
WHERE L.idLista = [ID da lista] AND I.defesaMagica > [Valor de defesa mágica];


-- Obter detalhes de todos os personagens que possuem uma alma específica:
SELECT P.*
FROM Personagem AS P
JOIN Coletadas AS C ON P.idPersonagem = C.FK1_personagem
JOIN Alma AS A ON C.FK2_alma = A.idAlma
WHERE A.nome = '[Nome da Alma]';

-- comprar itens na loja:

-- Deduzir o custo do item das moedas/recursos do jogador
-- (Assumindo que a tabela Personagem possui um campo 'moedas' para este exemplo)
UPDATE Personagem
SET moedas = moedas - (
    SELECT preco
    FROM Item
    WHERE idItem = [ID do item]
)
WHERE idPersonagem = [ID do personagem];

-- Adicionar o item ao inventário do jogador
INSERT INTO Inventario (FK_idPersonagem, FK_item)
VALUES ([ID do personagem], [ID do item]);



-- Consultar a saúde atual de uma determinada parte do corpo de um personagem:

SELECT tipoParte, hpAtual
FROM [Nome da Tabela da Parte do Corpo]
WHERE FK_personagem = [ID do personagem];

-- Obter todos os inimigos em um local específico:

SELECT I.*
FROM Inimigo AS I
JOIN Local AS L ON I.FK_local = L.idLocal
WHERE L.nome = '[Nome do Local]';




-- Consultar todos os personagens que possuem um determinado item em seu inventário:

SELECT P.*
FROM Personagem AS P
JOIN Inventario AS Inv ON P.idPersonagem = Inv.FK_idPersonagem
WHERE Inv.FK_item = [ID do item];

-- Obter a lista de habilidades de um personagem com base em todas as almas que ele possui, incluindo a quantidade de dano físico e mágico que cada habilidade causa:

SELECT H.nome, H.danoFisico, H.danoMagico
FROM Personagem AS P
JOIN Coletadas AS C ON P.idPersonagem = C.FK1_personagem
JOIN Alma AS A ON C.FK2_alma = A.idAlma
JOIN Habilidade AS H ON A.idAlma = H.FK_alma
WHERE P.idPersonagem = [ID do personagem];

-- Consultar a quantidade total de itens em um determinado inventário:

SELECT COUNT(I.idItem)
FROM Inventario AS Inv
JOIN Item AS I ON Inv.FK_item = I.idItem
WHERE Inv.FK_idPersonagem = [ID do personagem];

-- Obter todos os personagens não jogáveis que possuem uma defesa total (armadura + acessórios) acima de um determinado valor:

SELECT PNJ.*
FROM PersonagemNaoJogavel AS PNJ
JOIN Armadura AS Am ON PNJ.FK5_armadura = Am.idItem
JOIN Acessorio AS Ac1 ON PNJ.FK2_acessorio1 = Ac1.idItem
JOIN Acessorio AS Ac2 ON PNJ.FK3_acessorio2 = Ac2.idItem
WHERE (Am.defesa + Ac1.defesa + Ac2.defesa) > [Valor de defesa total];

-- Consultar a soma total de ataque físico e mágico de todos os inimigos em uma lista específica:

SELECT SUM(ataqueFisico), SUM(ataqueMagico)
FROM Inimigo AS I
WHERE I.FK_lista = [ID da lista];


