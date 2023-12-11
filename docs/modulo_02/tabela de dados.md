# Tabelas de dados
Esse documento tem como propósito manter o controle dos dados que serão inseridos em cada uma das tabelas. Isso não significa que esses dados não serão atualizados no decorrer do jogo.

## Alma

|                 |                   |  
| --------------- | ------------------|
| **Nome**   | **Descrição** | 
| Infinito | A alma do infinito faz com que você deseje constantemente a liberdade e force sua criatividade até o limite.                  |  
| Dominação | A alma da dominação faz com que os que estão ao seu redor se curvem às suas vontades. Você é um líder natural, mas pode acabar se cegando com relação aos próprios erros.|  
| Feral | A alma feral. Você está de maneira inata rendido aos instintos mais selvagens. É agressivo e age pelo puro instinto de sobrevivência. |  
| Iluminado | A alma do iluminado. Você está buscando incansavelmente por novos conhecimentos e pelos segredos escondidos do povo comum |  
| Atormentado | A alma do atormentado. Você está destinado a sofrer a cada passo que dá na sua vida. No fim isso te faz mais forte fisicamente e faz com que sua vontade de ferro rivalize até mesmo com a vontade dos próprios deuses.|  

## Região

|                 |                  |             |           | ----- |
| --------------- | ------------------|---------|-------| ----- |
| **idRegião**   |  **nomeR**  | **descrição**  | **imgTexto** | **tranca** |
| 01  |  Praça Central  | Aqui é o centro da cidade. Aonde a população costumava se reunir para conversar e comercializar.  | - | false |
| 02  |  Igreja  | A única igreja da cidade. Aqui os moradores dedicavam preces a All-mer, o último dos deuses antigos, também conhecido como "aquele que ascendeu". | - | true |
| 03  |  Circo  | Um lugar que antes era usado para diversão e entretenimento, mas que atualmente tem um aspecto sinistro e abandonado.  | - | true |
| 04  | Truques e mágica Dr. Kefer | Um pequeno edifício de aparência desgastada. | -| false |
| 05  |  Livraria  | A livraria comercializava todo tipo de livro dos mais variados assuntos. | - | false |
| 06  |  Floresta  | O bosque que fica ao redor da cidade. | - | false |
| 07  | Casa do lenhador | A casa do lenhador do vilarejo | - | false |

## Local
|                 |                  |             |           | 
| --------------- | ------------------|---------|-------|
| **idLocal**   |  **Região***  | **nomeL**  | **imgTexto** | 
| 01  | Praça Central | Fonte | - | 
| 02  | Praça Central | Bancas abandonadas | - |
| 03  | Praça Central | Árvore da praça | - |
| 04  | Igreja | Altar | - |
| 05  | Igreja | Confessionário | - |
| 06  | Igreja | Sino | - |
| 07  | Igreja | Segundo andar | - |
| 04  | Circo | Jaulas | - |
| 05  | Circo | Carroça | - |
| 06  | Circo | Camarim | - |
| 07  | Circo | Centro de espetáculos | - |
| 08  | Truques e mágica Dr. Kefer | Primeiro andar | - |
| 09  | Truques e mágica Dr. Kefer | Porão | - |
| 10  | Livraria | Estantes do 1 andar | - |
| 11  | Livraria | Banheiro | - |
| 12  | Livraria | Estantes do 2 andar | - |
| 13  | Livraria | Balcão de atendimento | - |
| 14  | Floresta | Bosque profundo | - |
| 15  | Floresta | Flores | - |
| 16  | Floresta | Altar suspeito | - |
| 17  | Floresta | Pequena caverna | - |
| 18  | Casa do lenhador | Sala de estar | - |
| 19  | Casa do lenhador | Cozinha | - |
| 20  | Casa do lenhador | Suíte | - |
| 21  | Casa do lenhador | Porão | - |
| 22  | Casa do lenhador | Banheiro | - |
*Aqui está apenas o nome da região por razões de melhor compreensão, mas no banco estará armazenado o id que corresponde a essa região.

## Personagem

|                 |                  |             | 
| --------------- | ------------------|-------|
| **IdPersonagem** | **Alma** | **tipoP** | 
| 01 | Dominação | PJ | 
| 02 | NULL | PNJ | 
| 03 | Atormentado | PNJ | 
| 04 | Atormentado | PNJ | 
| 05 | Iluminado | PNJ | 
| 06 | Feral | PNJ | 
| 07 | Infinito | PNJ | 
| 08 | Feral | PNJ | 
| 09 | Iluminado | PNJ |

## Personagem Não Jogável

|                 |                  |
| --------------- | ------------------|
| **idPersonagem** | **tipoPnj**  |
| 02 | Lojista |
| 03 | Inimigo |
| 04 | Inimigo |
| 05 | Inimigo |
| 06 | Inimigo |
| 07 | Inimigo |
| 08 | Inimigo |
| 09 | Inimigo |

## Personagem Jogável

|        |      |       |        |        |         |        |        |       |       |       |          |       |         |        |      |
| ---------- | --------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | -------- |
| **idPersonagem** | **Nome**  | **Atq** | **Agilidade** | **DefesaM** | **Defesa** | **AtqM** | **HpAtual** | **HpMax** | **MenteAtual** | **MenteMax** | **Arma** | **Armadura** | **Acessório1** | **Acessório2** | **local***
| 01 | Jakov | 0 | 0 | 0 | 0 | 0 | 100 | 100 | 5 | 5 | - | - | - | - | Árvore da praça |

*Representado o nome do Local, mas no banco será populado o id
## Lojista

|        |      |       |        |        |         |        |        |       |       |     |
| ---------- | --------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ------- |
| **idPersonagem** | **Nome**  | **Atq** | **Agilidade** | **DefesaM** | **Defesa** | **AtqM** | **Descrição** | **Fala** | **imgTexto** | **local*** |
| 02 | Dr. Kefer | 35 | 15 | 10 | 10 | 0 | Um homem de pele pálida e com metade do rosto em carne viva. Utiliza uma faixa que venda seus olhos, mas parece enxergar muito bem tudo que acontece ao seu redor. Veste uma manta longa que cobre todo o seu corpo exceto os dois antebraços. | Olá, estrangeiro. Vendo aqui uma série de artigos que talvez possam... te ajudar a se manter vivo neste inferno em que todos perderam a cabeça. | - | Truques e mágica Dr. Kefer |

*Representado o nome do Local, mas no banco será populado o id

## Inimigo

|        |      |       |        |        |         |        |        |       |       |
| ---------- | --------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- |
| **idPersonagem** | **Nome**  | **Atq** | **Agilidade** | **DefesaM** | **Defesa** | **AtqM** | **Descrição** | **Fala** | **imgTexto** |
| 03 | Ghoul  | 20 | 15 | 5 | 5 | 0 | Segundo os novos Deuses, são aqueles cuja fortitude física e mental não conseguiu aguentar a escuridão opressora. Tem uma aparência pálida e um corpo necrosado e coberto de sangue... se é o dele ou de outra pessoa, só os deuses sabem. | Me mate, tenha compaixão e me mate!! | - |
| 04 | Chamuscado  | 0 | 0 | 0 | 0 | 0 | Um ser em profunda agonia, foi afetado pela maldição do Deus antigo Rher. Está com feridas de arranhão em todo o corpo, você vê que a pele do rosto está em carne viva devido aos arranhões. | Tira isso de mim! TIRA ISSO DE MIM PELO AMOR DE DEUS! Eu consigo sentir isso dentro de mim. Está se rastejando dentro da minha pele! | - |
| 05 | Padre decrépto  | 0 | 15 | 20 | 15 | 25 | Um silêncio sinistro se instaura no ambiente com somente você e o sacerdote sombrio, que te encara com um olhar psicótico. | O padre faz o sinal da cruz com suas mãos, movendo de um ombro para o outro, depois para o estômago e por fim até a testa. | - |
| 06 | Cão sem cabeça  | 35 | 15 | 10 | 20 | 0 | Uma besta misteriosa se aproxima de você com saliva pingando de algo que parece uma boca saindo do seu torso. A criatura parece querer te caçar. | O cão parece lutar muito para conseguir respirar. | - |
| 07 | Agulhas  | 40 | 19 | 15 | 20 | 0 | Um palhaço com um sorriso macabro se aproxima lentamente de você. Na sua mão esquerda ele segura uma seringa com conteúdo misterioso dentro. Na direita, um chicote com várias seringas penduradas na ponta. | Agulhas te encara no fundo dos olhos e começa a rir de maneira exagerada. Ele segura no estômago enquanto aponta o dedo para você. | - |
| 08 | Lenhador  | 40 | 12 | 0 | 0 | 0 | Um lenhador nu está parado encarando você. Em sua mão direita está um machado enorme coberto de sangue. | O lenhador se aproxima de você ameaçadoramente. Há uma raiva silenciosa em seus olhos. Uma sensação de completo terror preenche o ar. | - |
| 09 | Bruxa das trevas | 15 | 20 | 20 | 10 | 40 | Uma seguidora do Deus Gro-goroth, está pronta para derramar sangue em seu nome. | Eu sou o que vocês chamam de bruxa. Vendi minha alma para as artes sangrentas há muito tempo atrás. | - |

## Inventário

|                 |                  |             |           |            |            | 
| --------------- | ------------------|---------|-------|-------|-------|
| **idInventario**   |  **PersonagemJ**  | **dinAtual**  | **dinMax** | **capAtual** | **capTotal** | 
| 1  |  01  | 0  | 1000 | 0 | 100 |

## Habilidade

|                 |                  |             |           |
| --------------- | ------------------|---------|-------|
| **idHabilidade** | **alma**  | **tipoHab** |
| 01   | 'Dominação' | 'A' |
| 02   | 'Dominação' | 'A' |
| 03   | 'Infinito' | 'A' |
| 04   | 'Feral' | 'P' |
| 05   | 'Iluminado' | 'S' |
| 06   | 'Atormentado' | 'A' |

## Ataque

|                 |                  |             |           |           |           |
| --------------- | ------------------|---------|-------|-------|-------|
|**idHabilidade**| **nome** | **custo** | **descrição** | **danoMagico** | **danoFisico** |
| 01 | Esbarrão | 0 | Um esbarrão forte no seu inimigo | 0 | 5 |
| 02 | Ataque básico | 0 | Um ataque simples com a arma equipada | 0 | 15 |
| 03 | Perfurar | 0 | Você perfura seu inimigo, ignorando a armadura | 0 | 20 |
| 04 | Ataque magico | 1 | Um ataque mágico | 25 | 0 |


## Passiva

|                 |                  |             |           |           |           |           |           |           |           |           |
| --------------- | ------------------|---------|-------|-------|-------|-------|-------|-------|-------|-------|
|**idHabilidade**| **adAtqM** | **adDefM** | **adMenteMax** | **adAgil** | **adAtq** | **adDef** | **adHpMax** |**nome** |**custo** |**descrição** |
| 04 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |'Plano de fuga' |0 |'Aumenta suas chances de escapar de uma luta |

##  Suporte

|                 |                  |             |           |           |           |           |           |           | 
| --------------- | ------------------|---------|-------|-------|-------|-------|-------|-------|
|**idHabilidade**| **nome** | **adAtqM** | **adDefM** | **adAgil** | **adHp** | **duração** | **custo** |**descrição** |
|05| 'Sussuros amorosos' | 0 | 5 | 0 | 60 | NULL | 2 |'Os sussuros amoroso da Deusa Sylvian' |

## Item
|                 |                  |
| --------------- | ------------------|
|**idItem**| **tipoItem** | 
|01| 'Acessorio' | 
|02| 'Acessorio' | 
|03| 'Acessorio' | 
|04| 'Acessorio' | 
|05| 'Armadura' | 
|06| 'Armadura' | 
|07| 'Armadura' | 
|08| 'Legivel' | 
|09| 'Legivel' | 
|10| 'Arma' | 
|11| 'Arma' | 
|12| 'Arma' | 
|13| 'Arma | 
|14| 'Consumivel' | 
|15| 'Consumivel' | 
|16| 'Consumivel' | 
|17| 'Chave' | 
|18| 'Chave' | 


## Acessório

|                 |                  |                  |                  |                  |                  |                  |               |                  |                  |
| --------------- | ------------------|------------------|------------------|------------------|------------------|------------------|------------------|------------------|------------------|
|**idItem**| **adAtqM** | **adAgil** |**adDefM** |**adDef** |**adAtqF** |**valor** |**peso** |**nome** |**descrição** |
| 01 | 0 | 6 |5 |0 |0 |200 |2 |'Amuleto de agilidade' | 'Um amuleto bruto que representa uma divindade de rato. Este peculiar é imbuído de orações de ratkin que concedem ao seu usuário um pequeno impulso na agilidade para ajudar a evitar possíveis perigos.' |
| 02 | 0 | 0 |0 |10 |5 |150 |5 |'Escudo de tapume' |'Um escudo simples feito com um tapume velho de madeira.' |
|03| 0 | 0 |15 |15 |0 |350 |6 |'Escudo de quatro mãos' |'Um escudo encantado, ornamentado com mãos decepadas colocadas para proteger de poderes sobrenaturais.' |
|04| 15 | 0 |5 |0 |0 |200 |3 |'Chac chac'| 'Um chocalho aparentemente simples. A combinação das pedras internas e das várias pérolas amarradas nelas cria um ritmo hipnótico que ajuda a focar em poderes de outro mundo.' |

## Armadura
|                 |                  |                  |                  |                  |                  |                  |                  |
| --------------- | ------------------|------------------|------------------|------------------|------------------|------------------|------------------|
|**idItem**| **adAgil** | **adDef** |**adDefM** |**valor** |**peso** |**nome** |**descrição** |
|05| 0 | 5 |5 |100 |2 |'Colete de couro' |'Um colete simples de couro' |
|06| 0 | 15 |15 |350 |5 |'Armadura de placa' |'Uma armadura de placas de aço duríssimas que vão te ajudar a aguentar um pouco mais de dano.' |
|07| -4 | 20 |20 |600 |10 |'Armadura de penitência'|'Uma armadura brutal utilizada pelos cavaleiros penitentes do Vaticano. Não pode ser retirada quando colocada, e se prende ao usuário com diversas placas de metal que entram por dentro da carne, o colocando em um Estado de tormenta eterna.' |


## Legível

|                 |                  |                  |                  |                  |                  |
| --------------- | ------------------|------------------|------------------|------------------|------------------|
|**idItem**| **conteudo** | **valor** |**peso** |**nome** |**descrição** |
|08| 'Os Cavaleiros da Penitência são uma unidade especial da cidade do Vaticano que usa armaduras feitas sob medida. Os Cavaleiros da Penitência são usados nas tarefas e missões mais perigosas, onde as chances de sobrevivência são especialmente baixas. Assim, a armadura foi projetada apenas para ser vestida. Não há como removê-la uma vez que foi escolhido para a missão. A armadura possui fileiras de pequenos espinhos que perfuram a pele de seu usuário. A dor tem como objetivo limpar a mente para a tarefa em questão e também aumentar a fúria no meio do combate. Devido à natureza dos Cavaleiros da Penitência e da Armadura da Penitência, apenas condenados com penas de prisão perpétua ou de morte são recrutados para a unidade. Os recrutas recebem uma última chance de se arrepender de seus crimes e expiar seus pecados antes que o Ascendente Alll-mer pronuncie o julgamento final.' | 0 | 0 | 'Os cavaleiros da penitência' |'Um livro sobre Os Cavaleiros da Penitência da Cidade do Vaticano.' |
|09| 'Muito parecido com o sol – a lua é uma das entidades primordiais e, portanto, tem conhecimentos e crenças escritas desde o início dos tempos. Isso torna difícil separar os fatos da ficção e as divagações malucas das verdades ocultas. Detalhes consistentes entre a miríade de histórias parecem sugerir um deus chamado Rher. Também conhecido como Deus Malandro e Deus da Lua. Nos escritos mais antigos, Rher é descrito como o deus dos loucos e daqueles que sucumbiram à loucura. Sua bênção para os homens é o luar, que supostamente revela a verdade sob a sujeira humana. Uma verdade que muitas vezes é demais para a mente humana lidar. Pode-se debater se a sua versão da verdade é mais precisa do que a da sujeira humana. Ao contrário de muitos outros deuses mais antigos, o papel de Rher dentro do grande destino das coisas permanece um mistério. Só de olhar para o céu noturno é possível perceber sua presença, em um sono eterno. Isso torna seu sigilo ainda mais irritante, ele está literalmente se escondendo à vista de todos.' | 0 | 0 |'Bíblia de pele - Deus Rher.' |' Um importante livro ocultista escrito nos tempos medievais por Enki Ankarian.' |

## Arma

|                 |                  |                  |                  |                  |                  |                  |                  |
| --------------- | ------------------|------------------|------------------|------------------|------------------|------------------|------------------|
|**idItem**| **adAtqM** | **adDef** |**adAtqF** |**valor** |**peso** |**nome** |**descrição** |
|10| 0 | 0 |10 |50 |1 |'Faca' |'Uma faca simples de cozinha' |
|11| 0 | 0 |20 |150 |1 |'Espada curta' |'Espada curta de ferro. A lâmina está um pouco desgastada, mas a espada em si é fácil e rápida de manusear.' |
|12| 0 | 5 |30 |250 |1 |'Adaga' |'Uma adaga daquelas tipicamente utilizadas por assassinos profisionais' |
|13| 15 | 0 |45 |500 |4 |'Miasma' |'Uma espada de outro mundo que exala gases tóxicos. Diz-se que a espada abriga a força de seis homens.' |

## Consumível

|                 |                  |                  |                  |                  |                  |                  |                  |                  |                  |
| --------------- | ------------------|------------------|------------------|------------------|------------------|------------------|------------------|------------------|------------------|
|14| NULL | 0 |0 |0 |30 |100 |1 | 'Frasco azul' |'Um frasco cheio de liquido azul' |
|15| NULL | 0 |0 |0 |65 |250 |1 |'Frasco azul claro'|'Um frasco cheio de líquido azul claro' |
|16| NULL | 2 |0 |0 |0 |115 |1 |'Frasco marrom' |Um frasco cheio de líquido marrom.' |

## Chave

|                 |                  |                  |                  |                  |                  |
| --------------- | ------------------|------------------|------------------|------------------|------------------|
|**idItem**| **região** | **valor** |**peso** |**nome** |**descrição** |
|17| Igreja | NULL |0 |Chave da Igreja |'Uma chave antiga que abre a porta da igreja' |
|18| Circo | NULL |0 |Chave do Circo |'Uma reluzente que libera a área do Circo.' |

## Instância Inimigo

|                 |                  |                  |
| --------------- | ------------------|------------------|
|**idInst**| **idPersonagem** | **idLocal** |
|01| 03[Ghoul] | 02 |
|02| 04[Chamuscado] | 03 |
|03| 08 [Lenhador] | 21 |
|04| 05 [Padre Decrépto] | 05 |
|05| 06 [Cão sem cabeça] | 14 |
|06| 06 [Cão sem cabeça] | 17 |
|07| 09 [Bruxa das trevas] | 16 |
|08| 07 [Agulhas] | 06 |
|09| 03[Ghoul] | 04 |
|10| 03[Ghoul] | 07|

## Instância Item

|                 |                  |                  |
| --------------- | ------------------|------------------|
|**idInst**| **idItem** | **idLocal** |
|01| 10[Faca] | 03[arvore da praça] |
|02| 11[Espada curta] | 15[Flores] |
|03| 13[Miasma] | NULL |
|04| 08[Cavaleiros da penitência] | 10[Livraria primeiro andar] |
|05| 09[Skin bible - Rher] | 12[Livraria segundo andar] |
|06| 07 [Armadura da Penitência] | 20[Suíte] |
|07| 06[Armadura de placa] | 04[Altar] |
|08| 15[frasco azul claro] | 03[arvore da praça] |
|09| 15[frasco azul claro] | 04[Altar] |
|10| 14[Frasco azul] | 15[Flores] |
|11| 16 [Frasco marrom] | 03[arvore da praça] |
|12| 16[Frasco marrom] | 12[Livraria segundo andar] |
|13| 16[Frasco marrom] | 10[Livraria primeiro andar] |
|14| 03[Escudo de quatro mãos] | 17[Pequena caverna] |
|15| 02[Escudo de tapume]| 02[Bancas abandonadas] |
|16| 04[chac chac] | 04 |

## Dropa

|                 |                  |
| --------------- | ------------------|
|**idInstInimigo**| **idItem** |
|08 [Agulhas]| 13[Miasma] |
|01[Ghoul]| 14[Frasco azul] |
|09[Ghoul]| 14[Frasco azul] |
|10[Ghoul]| 14[Frasco azul] |
|02[Chamuscado]| 15[frasco azul claro] |
|03[Lenhador]| 15[frasco azul claro] |
|03[Lenhador]| 18[Chave circo] |
|04[Padre Decrépto]| 15[frasco azul claro] |
|04[Padre Decrépto]| 12[Adaga] |
|05[Cão sem cabeça]| 14[Frasco azul] |
|06[Cão sem cabeça]| 14[Frasco azul] |
|07 [Bruxa das trevas]| 01 [Amuleto de agilidade] |
|07 [Bruxa das trevas]| 15 [Frasco azul claro] |
|07 [Bruxa das trevas]| 16[Frasco marrom] |
|07[Lenhador]| 17[Chave igreja] |
