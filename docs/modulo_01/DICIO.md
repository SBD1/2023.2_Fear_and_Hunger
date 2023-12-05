### Versionamento

| Versão | Data       | Modificação                                       | Autor                               |
| ------ | ---------- | ------------------------------------------------- | ----------------------------------- |
| 1.0    | 16/09/2023 | Criação do Documento                              | Pedro Lima                          |
| 1.1    | 24/09/2023 | Criação do modelo de tabela                       | Pedro, Matheus, Alexandre, Gabriela |
| 1.2    | 02/10/2023 | Adicionando tabelas                               | Matheus                             |
| 1.2.1  | 02/10/2023 | Pequenas Correções                                | Matheus                             |
| 1.3    | 02/10/2023 | Removendo tabelas que foram removidas no MER      | Matheus                             |
| 1.4    | 30/10/2023 | Atualizando tabelas conforme a nova versão do MER | Gabriela                            |
| 1.4.1  | 30/10/2023 | Atualizando tabelas conforme a nova versão do MER | Gabriela                            |
| 1.5    | 02/12/2023 | Atualizando tabelas conforme a nova versão do MER | Gabriela                            | 

## Tabela : **Regiao**

|                 |                                                                |   
| --------------- | -------------------------------------------------------------- | 
| **Descrição**   | Tabela que contém informações de cada região existente no jogo |
| **Observações** |                                                                | 

| Nome         | Descrição                                                           | Tipo de Dado | Tamanho | Restrições de domínio                       |
| ------------ | ------------------------------------------------------------------- | ------------ | ------- | ------------------------------------------- |
| idRegiao     | Atributo identificador Regiao do jogo que o usuário poderá escolher | SERIAL       | -       | PRIMARY KEY                                 |
| nomeR        | Atributo que nomeia a região que o usuário poderá escolher          | VARCHAR      | 25      | NOT NULL, UNIQUE* (chave secundária)        |
| descricao    | Atributo que carrega a descrição daquela região em específico       | TEXT         | -       | NULL*                                       |
| tranca       | Atributo que verifica se determinada região está trancada ou não    | BOOL         | -       | DEFAULT                                     |
| imgTexto     | Atributo que carrega o gráfico em imagem texto da região            | TEXT         | -       | NULL*                                       |

*Estudar alterar em create table.

## Tabela : **Local**

|                 |                                                                                            |  
| --------------- | ------------------------------------------------------------------------------------------ | 
| **Descrição**   | Tabela que contém informações de cada local que está dentro das regiões existentes no jogo |
| **Observações** | Possui chave composta que tem chave estrangeira que referencia a tabela Regiao             | 

| Nome              | Descrição                                                                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ----------------- | -------------------------------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idLocal, idRegiao | Chave composta que identifica a entidade fraca Local que o usuário poderá escolher para navegar no jogo  |              | -       | PRIMARY KEY           |
| idLocal           | Chave estrangeira que referencia a tabela Regiao                                                         |  SERIAL      | -       |                       |
| idRegiao          | Chave estrangeira que referencia a tabela Regiao                                                         |  SERIAL      | -       | FOREIGN KEY           |
| nomeL             | Atributo que nomeia o local que o usuário poderá escolher                                                |  VARCHAR     | 25      | NOT NULL              |
| imgTexto          | Atributo que carrega o gráfico em imagem texto do local                                                  |  TEXT        | -       | NULL*                 |

## Tabela : **Personagem**

|                 |                                                                                                                                                                     | 
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | 
| **Descrição**   | Tabela que contém informações de Personagem, tabela de generalização que ramifica para as especializações de Personagem Jogavel e Personagem Nao Jogavel            |     
| **Observações** | Contém chaves estrangeiras referenciando tabelas Local e Alma                                                                                                       |

| Nome          | Descrição                                                               | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------- | ----------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idPersonagem  | Atributo que carrega identificador único do Personagem                  | SERIAL       | -       | PRIMARY KEY           |
| local         | Chave estrangeira que referencia a tabela Local                         | SERIAL       | 4       | FOREIGN KEY           |
| alma          | Chave estrangeira que referencia a tabela Alma                          |              |         | FOREIGN KEY           |
| tipoP         | Atributo que carrega o tipo da especialização do personagem (PC ou NPC) | VARCHAR      | 3       | NOT NULL              |

## Tabela : **Habilidade**

|                 |                                                                                                                                       |  
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------- | 
| **Descrição**   | Tabela que contém informações da lista de habilidades, de seus identificadores e respectivos nomes e almas a quais estão relacionadas |
| **Observações** | Contém chave estrangeira referenciando a tabela Alma                                                                                  | 

| Nome         | Descrição                                                                                      | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ---------------------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idHabilidade | Atributo que carrega identificador único da Habilidade                                         | SERIAL       | -       | PRIMARY KEY           |
| alma         | Chave estrangeira que referencia a tabela Alma.                                                | VARCHAR*     | 10      | FOREIGN KEY           |
| tipoHab      | Atributo que carrega o tipo da especialização da habilidade: (P)assiva, (S)uporte ou (A)taque) | VARCHAR      | 1       |                       |

## Tabela : **Ataque**

|                 |                                                            | 
| --------------- | ---------------------------------------------------------- | 
| **Descrição**   | Armazenará as informações de habilidades de ataque         | 
| **Observações** | Possui chave estrangeira referenciando a tabela Habilidade.|

| Nome         | Descrição                                                                        | Tipo de Dado | Tamanho | Restrições de domínio     |
| ------------ | -------------------------------------------------------------------------------- | ------------ | ------- | ------------------------- |
| idHabilidade | Chave primária da tabela e chave estrangeira que referencia a tabela Habilidade  | SERIAL       | -       | PRIMARY KEY, FOREIGN KEY  |  
| danoFisico   | Quantidade de ataque físico que a habilidade é capaz de realizar                 | INT          | -       | DEFAULT                   |
| nome         | Atributo que carrega o nome da habilidade de ataque                              | VARCHAR*     | 30      | NOT NULL                  |
| danoMagico   | Quantidade de ataque mágico que a habilidade é capaz de realizar                 | INT          | -       | DEFAULT                   |
| custo        | Quantidade de recurso em mente que é necessário para realizar a habilidade       | INT          |         | DEFAULT                   |
| descricao    | Atributo que carrega a descrição da habilidade de ataque respectiva              | TEXT         | -       | NULL*                     |                             

## Tabela : **Passiva**

|                 |                                                            |
| --------------- | ---------------------------------------------------------- | 
| **Descrição**   | Armazenará as informações de habilidades passivas          | 
| **Observações** | Possui chave estrangeira referenciando a tabela Habilidade.|

| Nome         | Descrição                                                                                               | Tipo de Dado | Tamanho | Restrições de domínio     |
| ------------ | ------------------------------------------------------------------------------------------------------- | ------------ | ------- | ------------------------- |
| idHabilidade | Chave primária da tabela e chave estrangeira que referencia a tabela Habilidade                         | SERIAL       | -       | PRIMARY KEY, FOREIGN KEY  |  
| adAtqM       | Atributo que guarda a quantidade de ataque mágico pro personagem que a habilidade é capaz de adicionar  | INT          | -       | DEFAULT                   |
| adDefM       | Atributo que guarda a quantidade de defesa mágica pro personagem que a habilidade é capaz de adicionar  | INT          | -       | DEFAULT                   |
| adMenteMax   | Atributo que guarda a quantidade de mente pro personagem que a habilidade é capaz de adicionar          | INT          | -       | DEFAULT                   |
| adAgil       | Atributo que guarda a quantidade de agilidade pro personagem que a habilidade é capaz de adicionar      | INT          | -       | DEFAULT                   |
| adAtq        | Atributo que guarda a quantidade de ataque físico pro personagem que a habilidade é capaz de adicionar  | INT          | -       | DEFAULT                   |
| adDef        | Atributo que guarda a quantidade de defesa física pro personagem que a habilidade é capaz de adicionar  | INT          | -       | DEFAULT                   |
| adHpMax      | Atributo que guarda a quantidade de vida pro personagem que a habilidade é capaz de adicionar no total  | INT          | -       | DEFAULT                   |
| nome         | Atributo que carrega o nome da habilidade de ataque                                                     | VARCHAR*     | 30      | NOT NULL                  |
| custo        | Quantidade de recurso em mente que é necessário para realizar a habilidade                              | INT          |         | DEFAULT                   |
| descricao    | Atributo que carrega a descrição da habilidade de ataque respectiva                                     | TEXT         | -       | NULL*                     |                             

## Tabela : **Suporte**

|                 |                                                            | 
| --------------- | ---------------------------------------------------------- | 
| **Descrição**   | Armazenará as informações de habilidades de suporte        | 
| **Observações** | Possui chave estrangeira referenciando a tabela Habilidade | 

| Nome         | Descrição                                                                                               | Tipo de Dado | Tamanho | Restrições de domínio     |
| ------------ | ------------------------------------------------------------------------------------------------------- | ------------ | ------- | ------------------------- |
| idHabilidade | Chave primária da tabela e chave estrangeira que referencia a tabela Habilidade                         | SERIAL       | -       | PRIMARY KEY, FOREIGN KEY  |  
| nome         | Atributo que carrega o nome da habilidade de ataque                                                     | VARCHAR*     | 30      | NOT NULL                  |
| adAtqM       | Atributo que guarda a quantidade de ataque mágico pro personagem que a habilidade é capaz de adicionar  | INT          | -       | DEFAULT                   |
| adDefM       | Atributo que guarda a quantidade de defesa mágica pro personagem que a habilidade é capaz de adicionar  | INT          | -       | DEFAULT                   |
| adAgil       | Atributo que guarda a quantidade de agilidade pro personagem que a habilidade é capaz de adicionar      | INT          | -       | DEFAULT                   |
| adHp         | Atributo que guarda a quantidade de vida pro personagem que a habilidade é capaz de adicionar           | INT          | -       | DEFAULT                   |
| duracao      | Atributo que guarda os turnos em que a habilidade afetará o personagem                                  | INT          | -       | DEFAULT                   |
| custo        | Quantidade de recurso em mente que é necessário para realizar a habilidade                              | INT          | -       | DEFAULT                   |
| descricao    | Atributo que carrega a descrição da habilidade de ataque respectiva                                     | TEXT         | -       | NULL*                     |   
  

## Tabela : **Item**

|                 |                                                                                         |
| --------------- | --------------------------------------------------------------------------------------- |
| **Descrição**   | Tabela que armazena as informações dos itens relacionados aos tipos de item respectivos |
| **Observações** | Advém de uma generalização Total Exclusiva de Itens                                     | 

| Nome         | Descrição                                                | Tipo de Dado | Tamanho | Restrições de domínio  |
| ------------ | -------------------------------------------------------- | ------------ | ------- | ---------------------- |
| idItem       | Atributo identificador do item respectivo                | SERIAL       |         | PK                     |
| tipoItem     | Qual é o tipo desse item                                 | VARCHAR*     | 25      | NOT NULL               |

## Tabela : **Acessório**

|                 |                                                                    |
| --------------- | ------------------------------------------------------------------ |
| **Descrição**   | Tabela que armazena as informações dos itens tido como "acessório" |
| **Observações** | Possui chave estrangeira referenciando a tabela Item               |

| Nome         | Descrição                                                                                | Tipo de Dado | Tamanho | Restrições de domínio    |
| ------------ | ---------------------------------------------------------------------------------------- | ------------ | ------- | ------------------------ |
| idItem       | Chave primária da tabela e chave estrangeira referenciando o idItem da entidade Item     | SERIAL       | -       | PRIMARY KEY, FOREIGN KEY |
| adAtqM       | Atributo que carrega quanto de ataque magico esse acessório agrega ao personagem         | INT          | -       | DEFAULT                  |
| adAgil       | Atributo que carrega quanto de agilidade esse acessório agrega ao personagem             | INT          | -       | DEFAULT                  |
| adDefM       | Atributo que carrega quanto de defesa mágica esse acessório agrega ao personagem         | INT          | -       | DEFAULT                  |
| adDef        | Atributo que carrega quanto de defesa esse acessório agrega ao personagem                | INT          | -       | DEFAULT                  |
| adAtqF       | Atributo que carrega quanto de ataque físico esse acessório agrega ao personagem         | INT          | -       | DEFAULT                  |
| valor        | Valor do item para venda e compra                                                        | INT          | -       | DEFAULT                  |
| peso         | Peso que o item possui                                                                   | INT          | -       | NOT NULL                 |
| nome         | Nome do item                                                                             | VARCHAR      | 25      | NOT NULL                 |
| descricao    | Descrição do item                                                                        | TEXT         | -       | DEFAULT                  |

## Tabela : **Armadura**

|                 |                                                                   |
| --------------- | ----------------------------------------------------------------- |
| **Descrição**   | Tabela que armazena as informações dos itens tido como "armadura" |
| **Observações** | Possui chave estrangeira referenciando a tabela Item              |

| Nome         | Descrição                                                                              | Tipo de Dado | Tamanho | Restrições de domínio    |
| ------------ | -------------------------------------------------------------------------------------- | ------------ | ------- | ------------------------ |
| idItem       | Chave primária da tabela e chave estrangeira referenciando o idItem da entidade Item   | SERIAL       | -       | PRIMARY KEY, FOREIGN KEY |
| adAgil       | Atributo que carrega quanto de agilidade essa armadura agrega ao personagem            | INT          | -       | DEFAULT                  |
| adDefM       | Atributo que carrega quanto de defesa mágica essa armadura agrega ao personagem        | INT          | -       | DEFAULT                  |
| adDef        | Atributo que carrega quanto de defesa essa armadura agrega ao personagem               | INT          | -       | DEFAULT                  |
| valor        | Valor do item para venda e compra                                                      | INT          | -       | DEFAULT                  |
| peso         | Peso que o item possui                                                                 | INT          | -       | NOT NULL                 |
| nome         | Nome do item                                                                           | VARCHAR      | 25      | NOT NULL                 |
| descricao    | Descrição do item                                                                      | TEXT         | -       | DEFAULT                  |

## Tabela : **Legível**

|                 |                                                                 |
| --------------- | --------------------------------------------------------------- | 
| **Descrição**   | Tabela que armazena as informações dos itens tido como "Legível"| 
| **Observações** | Possui chave estrangeira referenciando a tabela Item            | 

| Nome         | Descrição                                                                              | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | -------------------------------------------------------------------------------------- | ------------ | ------- | ------------------------ |
| idItem       | Chave primária da tabela e chave estrangeira referenciando o idItem da entidade Item   | SERIAL       | -       | PRIMARY KEY, FOREIGN KEY |
| conteudo     | Texto ou informações contidas no item legível                                          | TEXT*        | -       | DEFAULT                  |
| valor        | Valor do item para venda e compra                                                      | INT          | -       | DEFAULT                  |
| peso         | Peso que o item possui                                                                 | INT          | -       | NOT NULL                 |
| nome         | Nome do item                                                                           | VARCHAR      | 25      | NOT NULL                 |
| descricao    | Descrição do item                                                                      | TEXT         | -       | DEFAULT                  |



## Tabela : **Arma**

|                 |                                                               |
| --------------- | ------------------------------------------------------------- |
| **Descrição**   | Tabela que armazena as informações dos itens tido como "Arma" | 
| **Observações** | Possui chave estrangeira referenciando a tabela Item          | 

| Nome         | Descrição                                                                              | Tipo de Dado | Tamanho | Restrições de domínio    |
| ------------ | -------------------------------------------------------------------------------------- | ------------ | ------- | ------------------------ |
| idItem       | Chave primária da tabela e chave estrangeira referenciando o idItem da entidade Item   | SERIAL       | -       | PRIMARY KEY, FOREIGN KEY |
| adAtqM       | Atributo que carrega quanto de ataque mágico essa arma agrega ao personagem            | INT          | -       | DEFAULT                  |
| adAtqF       | Atributo que carrega quanto de ataque físico essa arma agrega ao personagem            | INT          | -       | DEFAULT                  |
| valor        | Valor do item para venda e compra                                                      | INT          | -       | DEFAULT                  |
| peso         | Peso que o item possui                                                                 | INT          | -       | NOT NULL                 |
| nome         | Nome do item                                                                           | VARCHAR      | 25      | NOT NULL                 |
| descricao    | Descrição do item                                                                      | TEXT         | -       | DEFAULT                  |

## Tabela : **Consumível**

|                 |                                                                                                                      | 
| --------------- | -------------------------------------------------------------------------------------------------------------------- |
| **Descrição**   |  Tabela que armazena as informações dos itens tido como "Consumível" que podem recuperar HP ou mente, etc.           |
| **Observações** |  Possui chave estrangeira referenciando a tabela Item                                                                | 

| Nome         | Descrição                                                                                          | Tipo de Dado | Tamanho | Restrições de domínio    |
| ------------ | -------------------------------------------------------------------------------------------------- | ------------ | ------- | ------------------------ |
| idItem       | Chave primária da tabela e chave estrangeira referenciando o idItem da entidade Item               | SERIAL       | -       | PRIMARY KEY, FOREIGN KEY |
| conteudo     | Texto ou informações contidas no item consumível como pergaminhos utilizáveis                      | TEXT         | -       | DEFAULT                  |
| adMente      | Atributo que carrega a quantidade de pontos no atributo mente de personagem que o item adiciona    | INT          | -       | DEFAULT                  |
| adDefM       | Atributo que carrega a quantidade de pontos de defesa mágica que o item adiciona para o personagem | INT          | -       | DEFAULT                  |
| adAgil       | Atributo que carrega a quantidade de pontos de agilidade que o item adiciona para o personagem     | INT          | -       | DEFAULT                  |
| adHp         | Quantidade de HP que o item adiciona                                                               | int          | -       | NOT NULL                 |
| valor        | Valor do item para venda e compra                                                                  | INT          | -       | DEFAULT                  |
| peso         | Peso que o item possui                                                                             | INT          | -       | NOT NULL                 |
| nome         | Nome do item                                                                                       | VARCHAR      | 25      | NOT NULL                 |
| descricao    | Descrição do item                                                                                  | TEXT         | -       | DEFAULT                  |

## Tabela : **Chave**

|                 |                                                                       |
| --------------- | --------------------------------------------------------------------- |
| **Descrição**   |  Tabela que armazena as informações dos itens tido como "Chave"       | 
| **Observações** |  Possui chave estrangeira referenciando a tabela Item                 |  

| Nome         | Descrição                                                                                          | Tipo de Dado | Tamanho | Restrições de domínio    |
| ------------ | -------------------------------------------------------------------------------------------------- | ------------ | ------- | ------------------------ |
| idItem       | Chave primária da tabela e chave estrangeira referenciando o idItem da entidade Item               | SERIAL       | -       | PRIMARY KEY, FOREIGN KEY |
| Regiao       | Chave estrangeira que referencia a tabela Regiao                                                   | SERIAL       | -       | FOREIGN KEY              |
| valor        | Valor do item para venda e compra                                                                  | INT          | -       | DEFAULT                  |
| peso         | Peso que o item possui                                                                             | INT          | -       | NOT NULL                 |
| nome         | Nome do item                                                                                       | VARCHAR      | 25      | NOT NULL                 |
| descricao    | Descrição do item                                                                                  | TEXT         | -       | DEFAULT                  |

## Tabela : **Personagem Jogável**

|                 |                                                                     |
| --------------- | ------------------------------------------------------------------- | 
| **Descrição**   | Tabela que contém informações do personagem jogável.                |
| **Observações** | Possui chave estrangeira referenciando as tabelas Personagem e Item |

| Nome         | Descrição                                                           | Tipo de Dado | Tamanho | Restrições de domínio    |
| ------------ | ------------------------------------------------------------------- | ------------ | ------- | ------------------------ |
| idPersonagem | Chave Estrangeira referenciando a tabela Personagem                 | SERIAL       | -       | PRIMARY KEY, FOREIGN KEY |
| acessorio1   | Chave Estrangeira referenciando a tabela Instancia Item             | SERIAL       | -       | FOREIGN KEY              |
| acessorio2   | Chave Estrangeira referenciando a tabela Instancia Item             | SERIAL       | -       | FOREIGN KEY              |
| arma         | Chave Estrangeira referenciando a tabela Instancia Item             | SERIAL       | -       | FOREIGN KEY              |
| armadura     | Chave Estrangeira referenciando a tabela Instancia Item             | SERIAL       | -       | FOREIGN KEY              |
| menteAtual   | Atributo que carrega o valor da mente atual do personagem           | INT          | -       | NOT NULL                 |
| menteMax     | Atributo que carrega o valor da mente máxima do personagem          | INT          | -       | NOT NULL                 |
| hpAtual      | Atributo que carrega o valor da vida atual do personagem            | INT          | -       | NOT NULL                 |
| hpMax        | Atributo que carrega o valor da vida máxima do personagem           | INT          | -       | NOT NULL                 |
| atq          | Atributo que carrega o valor de ataque do personagem                | INT          | -       | DEFAULT                  |
| agilidade    | Atributo que carrega o valor de agilidade do personagem             | INT          | -       | DEFAULT                  |
| defesaM      | Atributo que carrega o valor de defesa mágica do personagem         | INT          | -       | DEFAULT                  |
| defesa       | Atributo que carrega o valor de defesa do personagem                | INT          | -       | DEFAULT                  |
| atqM         | Atributo que carrega o valor de ataque mágico do personagem         | INT          | -       | DEFAULT                  |
| nome         | Atributo que carrega o nome do personagem                           | VARCHAR*     | 50      | NOT NULL                 |



## Tabela : **Personagem Nao Jogavel**

|                 |                                                            | 
| --------------- | ---------------------------------------------------------- |
| **Descrição**   | Tabela que contém informações do personagem não jogável.   |
| **Observações** | Possui chave estrangeira referenciando a tabela Personagem |

| Nome         | Descrição                                                                            | Tipo de Dado | Tamanho | Restrições de domínio     |
| ------------ | ------------------------------------------------------------------------------------ | ------------ | ------- | ------------------------- |
| idPersonagem | Chave estrangeira referenciando o identificador da tabela Personagem                 | SERIAL       | -       | PRIMARY KEY, FOREIGN KEY  |
| tipoPnj      | Atributo que determina o tipo do personagem não jogável: se é (L)ojista ou (I)nimigo | VARCHAR      | 1       | NOT NULL                  |

## Tabela : **Lojista**

|                 |                                                                         | 
| --------------- | ----------------------------------------------------------------------- | 
| **Descrição**   | Tabela que contém informações do Lojista                                |
| **Observações** | Possui chave estrangeira referenciando a tabela Personagem Nao Jogavel  | 

| Nome         | Descrição                                                                            | Tipo de Dado | Tamanho | Restrições de domínio            |
| ------------ | ------------------------------------------------------------------------------------ | ------------ | ------- | -------------------------------- |
| idPersonagem | Chave estrangeira referenciando o identificador da tabela Personagem                 | SERIAL       | -       | PRIMARY KEY, FOREIGN KEY         |
| idLocal      | Chave estrangeira referenciando a tabela Local                                       | SERIAL       | -       | FOREIGN KEY                      |
| fala         | Atributo que carrega frases genérica do Lojista                                      | TEXT         | -       | NULL*                            |
| imgTexto     | Atributo que carrega o gráfico em imagem texto do Lojista                            | TEXT         | -       | NULL*                            |
| descricao    | Atributo que carrega a descrição do personagem Lojista                               | TEXT         | -       | NULL*                            |
| atq          | Atributo que carrega o valor do atributo de ataque do personagem Lojista             | INT          | -       | DEFAULT                          | 
| agilidade    | Atributo que carrega o valor do atributo de agilidade do personagem Lojista          | INT          | -       | DEFAULT                          | 
| defesaM      | Atributo que carrega o valor do atributo de defesa mágica do personagem Lojista      | INT          | -       | DEFAULT                          | 
| def          | Atributo que carrega o valor do atributo de defesa do personagem Lojista             | INT          | -       | DEFAULT                          | 
| atqM         | Atributo que carrega o valor do atributo de ataque mágico do personagem Lojista      | INT          | -       | DEFAULT                          | 
| nome         | Atributo que carrega o nome do personagem Lojista                                    | VARCHAR*     | 50      | NOT NULL                         |

## Tabela : **Inimigo**

|                 |                                                                         |
| --------------- | ----------------------------------------------------------------------- | 
| **Descrição**   | Tabela que contém informações do Inimigo                                | 
| **Observações** | Possui chave estrangeira referenciando a tabela Personagem Nao Jogavel  |

| Nome          | Descrição                                                                            | Tipo de Dado | Tamanho | Restrições de domínio            |
| ------------- | ------------------------------------------------------------------------------------ | ------------ | ------- | -------------------------------- |
| idPersonagem  | Chave estrangeira referenciando o identificador da tabela Personagem                 | SERIAL       | -       | PRIMARY KEY, FOREIGN KEY         |
| imgTexto      | Atributo que carrega o gráfico em imagem texto do Inimigo respectivo                 | TEXT         | -       | NULL*                            |
| descricao     | Atributo que carrega a descrição do Inimigo respectivo                               | TEXT         | -       | NULL*                            |
| atq           | Atributo que carrega o valor do atributo de ataque do Inimigo respectivo             | INT          | -       | DEFAULT                          | 
| agilidade     | Atributo que carrega o valor do atributo de agilidade do Inimigo respectivo          | INT          | -       | DEFAULT                          | 
| defesaM       | Atributo que carrega o valor do atributo de defesa mágica do Inimigo respectivo      | INT          | -       | DEFAULT                          | 
| def           | Atributo que carrega o valor do atributo de defesa do Inimigo respectivo             | INT          | -       | DEFAULT                          | 
| atqM          | Atributo que carrega o valor do atributo de ataque mágico do Inimigo respectivo      | INT          | -       | DEFAULT                          | 
| nome          | Atributo que carrega o nome do personagem Inimigo respectivo                         | VARCHAR*     | 50      | NOT NULL                         |

## Tabela : **Alma**

|                 |                                                            |
| --------------- | ---------------------------------------------------------- | 
| **Descrição**   | Tabela que contém informações das almas                    |
| **Observações** | Possui chave estrangeira referenciando a tabela Personagem | 

| Nome         | Descrição                                               | Tipo de Dado | Tamanho | Restrições de domínio          |
| ------------ | ------------------------------------------------------- | ------------ | ------- | ------------------------------ |
| nome         | Atributo que carrega o identificador da alma            | VARCHAR      | 25      | PRIMARY KEY                    |
| idpersonagem | Chave Estrangeira referenciando a tabela Personagem     | SERIAL       | -       | FOREIGN KEY                    |
| descricao    | Atributo que carrega a descrição da alma                | TEXT         | -       | NULL*                          |

## Tabela : **Inventario**

|                 |                                                                                    |
| --------------- | ---------------------------------------------------------------------------------- | 
| **Descrição**   | Tabela que contém informações do inventário do personagem jogável                  |
| **Observações** | Possui chave estrangeira referenciando a tabela Personagem                         |

| Nome                       | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| -------------------------- | ------------------------------------------- | ------------ | ------- | --------------------- |
| idInventario, idPersonagem |                                             |              |         | PK                    |
| idPersonagem               |                                             |              |         | FK                    |
| capTotal                   |                                             |              |         |                       |
| capAtual                   |                                             |              |         |                       |
| dinMax                     |                                             |              |         |                       |
| dinAtual                   |                                             |              |         |                       |

## Tabela : **Dropa**

|                 |                                                    |  
| --------------- | -------------------------------------------------- | 
| **Descrição**   |                                                    |
| **Observações** |                                                    | 

| Nome              | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| ----------------- | ------------------------------------------- | ------------ | ------- | --------------------- |
| idInimigo, idItem |                                             |              |         | PK composta           |
| idInstInimigo     |                                             |              |         |                       |
| idInstItem        |                                             |              |         |                       |

## Tabela : **Vende**

|                 |                                                                                         |  
| --------------- | --------------------------------------------------------------------------------------- | 
| **Descrição**   | Tabela que contém informações dos itens que são vendidos pelo lojista                   |
| **Observações** | Possui chave estrangeira referenciando as tabelas Lojista e Instancia Item              | 

| Nome                  | Descrição                                                                                     | Tipo de Dado | Tamanho | Restrições de domínio |
| ----------------------| --------------------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idLojista, idInstItem | Chave primária composta que mostra a relação do lojista específico com seus respectivos itens | -            | -       | PRIMARY KEY           |
| idLojista             | Chave estrangeira que referencia a tabela Lojista                                             | SERIAL       | -       | FOREIGN KEY           |
| idInstItem            | Chave estrangeira que referencia a tabela Instancia Item                                      | SERIAL       | -       | FOREIGN KEY           |

## Tabela : **Parte**

|                 |                                                                                                                  |  
| --------------- | ---------------------------------------------------------------------------------------------------------------- | 
| **Descrição**   | Tabela que contém informação das partes do corpo do personagem, que levam danos diferentes em batalha            |
| **Observações** | Possui chave estrangeira referenciando a tabela Personagem                                                       | 

| Nome                  | Descrição                                                                                           | Tipo de Dado | Tamanho | Restrições de domínio |
| --------------------- | --------------------------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idParte, idPersonagem | Chave primária composta que advém da entidade fraca entre Parte e Personagem                        | -            | -       | PRIMARY KEY           |
| hpMax                 | Atributo que carrega o valor da vida máxima daquela parte específica                                | INT          | -       | NOT NULL              |
| probAcerto            | Atributo que carrega a probabilidade de acerto daquela parte específica                             | INT          | -       | NOT NULL              |
| hpAtual               | Atributo que carrega o valor da vida atual daquela parte específica                                 | INT          | -       | NOT NULL              |
| tipoParte             | Atributo que identifica qual é a parte específica: (B)raço, (C)abeça, (G)enital, (P)erna, (T)orço   | VARCHAR      | 1       | NOT NULL              |


## Tabela : **Instancia Item**

|                 |                                                                                                                                                        |  
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ | 
| **Descrição**   | Tabela que contém informação dos itens e suas respectivas instâncias presentes no jogo                                                                 |
| **Observações** | Possui chaves estrangeiras referenciando as tabelas Item e Instancia Item                                                                              | 

| Nome           | Descrição                                                                        | Tipo de Dado | Tamanho | Restrições de domínio |
| -------------- | -------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idInst, idItem | Chave primária composta que advém da entidade fraca entre Item e Instancia Item  | -            | -       | PRIMARY KEY           |
| idItem         | Chave Estrangeira que referencia a tabela Item                                   | SERIAL       | -       | FOREIGN KEY           |
| idLocal        | Chave Estrangeira que referencia a tabela Local                                  | SERIAL       | -       | FOREIGN KEY           |


## Tabela : **Instancia Inimigo**

|                 |                                                                                    |  
| --------------- | ---------------------------------------------------------------------------------- | 
| **Descrição**   | Tabela que contém informação das instâncias existentes dos inimigos nos locais     |
| **Observações** | Possui chaves estrangeiras referenciando as tabelas Personagem e Local             | 

| Nome                 | Descrição                                                                                             | Tipo de Dado | Tamanho | Restrições de domínio |
| -------------------- | ----------------------------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idInst, idPersonagem | Chave primária composta que advém da relação das instâncias dos inimigos com seus respectivos locais  | -            | -       | PRIMARY KEY           |
| idPersonagem         | Chave Estrangeira que referencia a tabela Personagem                                                  | SERIAL       | -       | FOREIGN KEY           |
| idLocal              | Chave Estrangeira que referencia a tabela Local                                                       | SERIAL       | -       | FOREIGN KEY           |

## Tabela : **Lista Inventario**

|                 |                                                    |  
| --------------- | -------------------------------------------------- | 
| **Descrição**   |                                                    |
| **Observações** |                                                    | 

| Nome         | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ------------------------------------------- | ------------ | ------- | --------------------- |
| idPj         |                                             |              |         |                       |
| idItem       |                                             |              |         |                       |
