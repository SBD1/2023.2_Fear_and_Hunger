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

|                 |                                                         |
| --------------- | --------------------------------------------------------|
| **Descrição**   | Armazenará as informações do item tido como "acessório" |
| **Observações** | Possui chave estrangeira referenciando a tabela Item    |

| Nome         | Descrição                                                           | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idItem       | Chave estrangeira referenciando o idItem da entidade Item           | int          | 4       | PK, FK (Item)         |
| adAtqM       | Quanto de dano de ataque magico esse acessório agrega ao personagem | int          | 4       | DEFAULT               |
| adAgil       | Quanto de agilidade esse item agrega ao personagem                  | int          | 4       | DEFAULT               |
| adDefM       | Quanto de defesa mágica esse item agrega ao personagem              | int          | 4       | DEFAULT               |
| adDef        | Quanto de defesa esse item agrega ao personagem                     | int          | 4       | DEFAULT               |
| adAtqF       | Quanto de dano de ataque fisico esse acessório agrega ao personagem | int          | 4       | DEFAULT               |
| valor        | Valor da armadura                                                   | int          | 4       | DEFAULT               |
| peso         |                                                                     |              |         |                       |
| nome         | Nome da armadura                                                    | varchar      | 255     | NOT NULL              |
| descricao    | Descrição da armadura                                               | varchar      | 255     | DEFAULT               |

## Tabela : **Armadura**

|                 |                                                        |
| --------------- | ------------------------------------------------------ |
| **Descrição**   | Armazenará as informações do item tido como "armadura" |
| **Observações** | Possui chave estrangeira referenciando a tabela Item   |

| Nome         | Descrição                                                        | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ---------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idItem       | Chave estrangeira referenciando o identificador da entidade Item | int          | 4       | PK, FK (Item)         |
| adAgil       | Quanto de agilidade esse item agrega ao personagem               | int          | 4       | DEFAULT               |
| adDefM       | Quanto de defesa mágica esse item agrega ao personagem           | int          | 4       | DEFAULT               |
| adDef        | Quanto de defesa esse item agrega ao personagem                  | int          | 4       | DEFAULT               |
| valor        | Valor da armadura                                                | int          | 4       | DEFAULT               |
| peso         |                                                                  |              |         |                       |
| nome         | Nome da armadura                                                 | varchar      | 255     | NOT NULL              |
| descricao    | Descrição da armadura                                            | varchar      | 255     | DEFAULT               |

## Tabela : **Legível**

|                 |                                                    |
| --------------- | -------------------------------------------------- | 
| **Descrição**   | Item Legível                                       | 
| **Observações** | -                                                  | 

| Nome      | Descrição                               | Tipo de Dado | Tamanho | Restrições de domínio |
| --------- | --------------------------------------- | ------------ | ------- | --------------------- |
| idItem    | Chave primária para itens legiveis      | int          | 4       | PK, FK (Item)         |
| conteudo  | Texto ou informações contidas no item.  | varchar      | 255     | DEFAULT               |
| valor     | Valor do item para ser comprado         | int          | 4       | DEFAULT               |
| peso      |                                         |              |         |                       |
| nome      | Nome do item                            | varchar      | 255     | NOT NULL              |
| descricao | Informação básica sobre o item legível. | varchar      | 255     | DEFAULT               |



## Tabela : **Arma**

|                 |                                                           |
| --------------- | --------------------------------------------------------- |
| **Descrição**   | Armazenará as informações do item tido como "arma"        | 
| **Observações** | Possui chave estrangeira referenciando a tabela Item      | 

| Nome         | Descrição                                                        | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ---------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idItem       | Chave estrangeira referenciando o identificador da entidade Item | int          | 4       | PK, FK (Item)         |
| adAtqM       | Quanto de dano de ataque magico essa arma agrega ao personagem   | int          | 4       | DEFAULT               |
| adAtqF       | Quanto de dano de ataque fisico essa arma agrega ao personagem   | int          | 4       | DEFAULT               |
| valor        | Valor da armadura                                                | int          | 4       | DEFAULT               |
| peso         |                                                                  |              |         |                       |
| nome         | Nome da armadura                                                 | varchar      | 255     | NOT NULL              |
| descricao    | Descrição da armadura                                            | varchar      | 255     | DEFAULT               |

## Tabela : **Consumível**

|                 |                                                                                          | 
| --------------- | ---------------------------------------------------------------------------------------- |
| **Descrição**   | Item consumível que pode recuperar HP ou sanidade mental, curar infecções ou sangramento |
| **Observações** |                                                                                          | 

| Nome      | Descrição                                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| --------- | ------------------------------------------------------------------------ | ------------ | ------- | --------------------- |
| idItem    | Chave primária para itens consumíveis                                    | int          | 4       | PK, FK (Item)         |
| conteudo  |                                                                          |              |         |                       |
| adMente   | Quantidade de pontos no atributo mente de personagem que o item adiciona | int          | 4       | NOT NULL              |
| adDefM    |                                                                          |              |         |                       |
| adAgil    |                                                                          |              |         |                       |
| adHp      | Quantidade de HP que o item adiciona                                     | int          | 4       | NOT NULL              |
| valor     | Valor do item para ser comprado                                          | int          | 4       | DEFAULT               |
| peso      |                                                                          |              |         |                       |
| nome      | Nome do item                                                             | varchar      | 255     | NOT NULL              |
| descricao | Descrição do item consumível e seu efeito                                | varchar      | 255     | DEFAULT               |

## Tabela : **Chave**

|                 |                                                                       |
| --------------- | --------------------------------------------------------------------- |
| **Descrição**   |                                                                       | 
| **Observações** |                                                                       |  

| Nome      | Descrição                                 | Tipo de Dado | Tamanho | Restrições de domínio |
| --------- | ----------------------------------------- | ------------ | ------- | --------------------- |
| idItem    | Chave primária para a tabela Item         | int          | 4       | PK, FK (Item)         |
| Regiao    |                                           |              |         | FK (Regiao)           |
| valor     | Valor do item para ser comprado           | int          | 4       | DEFAULT               |
| peso      |                                           |              |         |                       |
| nome      | Nome do item                              | varchar      | 255     | NOT NULL              |
| descricao |                                           | varchar      | 255     | DEFAULT               |

## Tabela : **Personagem Jogável**

|                 |                                                                     |
| --------------- | ------------------------------------------------------------------- | 
| **Descrição**   | Armazena os dados do personagem jogável.                            |
| **Observações** | Contem Chave Estrangeira referenciando as tabelas Personagem e Item |

| Nome         | Descrição                                                 | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | --------------------------------------------------------- | ------------ | ------- | --------------------- |
| idPersonagem | Chave Estrangeira referenciando a tabela Personagem       | int          | 4       | PK, FK (Personagem)   |
| acessorio1   | Chave Estrangeira referenciando a tabela Instancia Item   | int          | 4       | FK (Instancia Item)   |
| acessorio2   | Chave Estrangeira referenciando a tabela Instancia Item   | int          | 4       | FK (Instancia Item)   |
| arma         | Chave Estrangeira referenciando a tabela Instancia Item   | int          | 4       | FK (Instancia Item)   |
| armadura     | Chave Estrangeira referenciando a tabela Instancia Item   | int          | 4       | FK (Instancia Item)   |
| menteAtual   | Valor do atributo mente do personagem                     | int          | 4       | NOT NULL              |
| menteMax     | Valor do atributo mente do personagem                     | int          | 4       | NOT NULL              |
| hpAtual      |                                                           |              |         |                       |
| hpMax        |                                                           |              |         |                       |
| atq          | Valor do atributo ataque do personagem                    | int          | 4       | NOT NULL              |
| agilidade    | Valor do atributo agilidade do personagem                 | int          | 4       | NOT NULL              |
| defesaM      | Valor do atributo defesa mágica do personagem             | int          | 4       | NOT NULL              |
| defesa       | Valor do atributo defesa do personagem                    | int          | 4       | NOT NULL              |
| atqM         |                                                           |              |         |                       |
| nome         | Nome do personagem                                        | varchar      | 255     | NOT NULL              |



## Tabela : **Personagem Nao Jogavel**

|                 |                                                            | 
| --------------- | ---------------------------------------------------------- |
| **Descrição**   | Armazenará as informações de Personagem Não Jogável        |
| **Observações** | Contém chave estrangeira referenciando a tabela Personagem |

| Nome         | Descrição                                                                        | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | -------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idPersonagem | Chave estrangeira referenciando o identificador da tabela Personagem             | varchar      | 255     | PK, FK (Personagem)   |
| tipoPnj      | Atributo que determina o tipo do personagem não jogável, se é lojista ou inimigo | varchar      | 255     | NOT NULL              |

## Tabela : **Lojista**

|                 |                                                            | 
| --------------- | ---------------------------------------------------------- | 
| **Descrição**   | Armazenará as informações da Lojista                       |
| **Observações** | Contém chave estrangeira referenciando a tabela Inventário | 

| Nome         | Descrição                                                     | Tipo de Dado | Tamanho | Restrições de domínio            |
| ------------ | ------------------------------------------------------------- | ------------ | ------- | -------------------------------- |
| idPersonagem | Chave primaria única do lojista                               | int          | 4       | PK, FK (Personagem Nao Jogavel)  |
| idLocal      | Chave estrangeira referenciando a tabela Local                | int          | 4       | FK                               |
| fala         |                                                               |              |         |                                  |
| imgTexto     |                                                               |              |         |                                  |
| descricao    |                                                               |              |         |                                  |
| atq          | Valor do atributo de ataque                                   | int          | 4       | DEFAULT                          | 
| agilidade    | Valor do atributo de agilidade                                | int          | 4       | DEFAULT                          |
| defM         | Valor do atributo de defesa mágica                            | int          | 4       | DEFAULT                          |
| def          | Valor do atributo de defesa                                   | int          | 4       | DEFAULT                          | 
| atqM         | Valor do atributo de ataque mágico                            | int          | 4       | DEFAULT                          | 
| nome         | Nome do lojista                                               | varchar      | 255     | NOT NULL                         |

## Tabela : **Inimigo**

|                 |                                      |
| --------------- | ------------------------------------ | 
| **Descrição**   | Armazenará as informações de Inimigo | 
| **Observações** | -                                    |

| Nome          | Descrição                          | Tipo de Dado | Tamanho | Restrições de domínio                     |
| ------------- | ---------------------------------- | ------------ | ------- | ----------------------------------------- |
| idPersonagem  | Identificador único de Personagem  | int          | 4       | PK, FK (Personagem Nao Jogavel)           |
| imgTexto      |                                    |              |         |                                           |
| descricao     |                                    |              |         |                                           |
| atq           | Valor do atributo de ataque        | int          | 4       | DEFAULT                                   |
| agilidade     | Valor do atributo de agilidade     | int          | 4       | DEFAULT                                   |
| defesaM       | Valor do atributo de defesa magica | int          | 4       | DEFAULT                                   |
| def           | Valor do atributo de defesa        | int          | 4       | DEFAULT                                   |
| nome          | Nome do personagem                 | varchar      | 255     | NOT NULL                                  |

## Tabela : **Alma**

|                 |                                                    |
| --------------- | -------------------------------------------------- | 
| **Descrição**   | Armazena os dados de classe do personagem.         |
| **Observações** | Contem chave estrangeira referenciando Personagem. | 

| Nome         | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ------------------------------------------- | ------------ | ------- | --------------------- |
| nome         | Identifica a classe do personagem           | varchar      | 255     | PK                    |
| idpersonagem | Chave Estrangeira referenciando Personagem. | int          | 4       | FK                    |
| descricao    |                                             |              |         |                       |

## Tabela : **Inventario**

|                 |                                                    |
| --------------- | -------------------------------------------------- | 
| **Descrição**   | Armazena os dados do inventário.                   |
| **Observações** | Contem chave estrangeira referenciando Personagem. |

| Nome                       | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| -------------------------- | ------------------------------------------- | ------------ | ------- | --------------------- |
| idInventario, idPersonagem | Chave Composta                              | int          | 4       | PK                    |
| idPersonagem               | Chave Estrangeira referenciando Personagem. | int          | 4       | FK                    |
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

|                 |                                                    |  
| --------------- | -------------------------------------------------- | 
| **Descrição**   |                                                    |
| **Observações** |                                                    | 

| Nome                  | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| ----------------------| ------------------------------------------- | ------------ | ------- | --------------------- |
| idLojista, idInstItem |                                             |              |         |                       |
| idLojista             |                                             |              |         |                       |
| idInstItem            |                                             |              |         |                       |

## Tabela : **Parte**

|                 |                                                    |  
| --------------- | -------------------------------------------------- | 
| **Descrição**   |                                                    |
| **Observações** |                                                    | 

| Nome                  | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| --------------------- | ------------------------------------------- | ------------ | ------- | --------------------- |
| idParte, idPersonagem |                                             |              |         |                       |
| hpMax                 |                                             |              |         |                       |
| probAcerto            |                                             |              |         |                       |
| hpAtual               |                                             |              |         |                       |
| tipoParte             |                                             |              |         |                       |


## Tabela : **Parte**

|                 |                                                    |  
| --------------- | -------------------------------------------------- | 
| **Descrição**   |                                                    |
| **Observações** |                                                    | 

| Nome                  | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| --------------------- | ------------------------------------------- | ------------ | ------- | --------------------- |
| idParte, idPersonagem |                                             |              |         |                       |
| hpMax                 |                                             |              |         |                       |
| probAcerto            |                                             |              |         |                       |
| hpAtual               |                                             |              |         |                       |
| tipoParte             |                                             |              |         |                       |

## Tabela : **Instancia Item**

|                 |                                                    |  
| --------------- | -------------------------------------------------- | 
| **Descrição**   |                                                    |
| **Observações** |                                                    | 

| Nome           | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| -------------- | ------------------------------------------- | ------------ | ------- | --------------------- |
| idInst, idItem |                                             |              |         |                       |
| idItem         |                                             |              |         |                       |
| idLocal        |                                             |              |         |                       |


## Tabela : **Instancia Inimigo**

|                 |                                                    |  
| --------------- | -------------------------------------------------- | 
| **Descrição**   |                                                    |
| **Observações** |                                                    | 

| Nome                 | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| -------------------- | ------------------------------------------- | ------------ | ------- | --------------------- |
| idInst, idPersonagem |                                             |              |         |                       |
| idPersonagem         |                                             |              |         |                       |
| idLocal              |                                             |              |         |                       |

## Tabela : **Lista Inventario**

|                 |                                                    |  
| --------------- | -------------------------------------------------- | 
| **Descrição**   |                                                    |
| **Observações** |                                                    | 

| Nome         | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ------------------------------------------- | ------------ | ------- | --------------------- |
| idPj         |                                             |              |         |                       |
| idItem       |                                             |              |         |                       |
