### Versionamento

| Versão | Data       | Modificação                                  | Autor                               |
| ------ | ---------- | -------------------------------------------- | ----------------------------------- |
| 1.0    | 16/09/2023 | Criação do Documento                         | Pedro Lima                          |
| 1.1    | 24/09/2023 | Criação do modelo de tabela                  | Pedro, Matheus, Alexandre, Gabriela |
| 1.2    | 02/10/2023 | Adicionando tabelas                          | Matheus                             |
| 1.2.1  | 02/10/2023 | Pequenas Correções                           | Matheus                             |
| 1.3    | 02/10/2023 | Removendo tabelas que foram removidas no MER | Matheus                             |
| 1.4    | 30/10/2023 | Atualizando tabelas conforme a nova versão do MER | Gabriela                       |
| 1.4.1    | 30/10/2023 | Atualizando tabelas conforme a nova versão do MER | Gabriela                     |
| 1.5    | 02/12/2023 | Atualizando tabelas conforme a nova versão do MER | Gabriela                       | 

## Tabela : **Regiao**

|                 |                                                    |  
| --------------- | -------------------------------------------------- | 
| **Descrição**   |                                                    |
| **Observações** |                                                    | 

| Nome         | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ------------------------------------------- | ------------ | ------- | --------------------- |
|idRegiao      |                                             |              |         |                       |
|nomeR         |                                             |              |         |                       |
|descricao     |                                             |              |         |                       |
|tranca        |                                             |              |         |                       |
|imgTexto      |                                             |              |         |                       |

## Tabela : **Local**

|                 |                                                    |  
| --------------- | -------------------------------------------------- | 
| **Descrição**   |                                                    |
| **Observações** |                                                    | 

| Nome             | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio |
| ---------------- | ------------------------------------------- | ------------ | ------- | --------------------- |
|idLocal, idRegiao |                                             |              |         |                       |
|nomeL             |                                             |              |         |                       |
|imgTexto          |                                             |              |         |                       |

## Tabela : **Personagem**

|                 |                                                               | 
| --------------- | --------------------------------------------------------------| 
| **Descrição**   | Personagem jogável, que o usuário do jogo irá utilizar        |     
| **Observações** | Contém chaves estrangeiras referenciando tabelas Local e Alma |

| Nome          | Descrição                         | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------- | --------------------------------- | ------------ | ------- | --------------------- |
| idPersonagem  | Identificador único de Personagem | int          | 4       | PK                    |
| local         | Valor do atributo de agilidade    | int          | 4       | FK (Local)            |
| alma          | Valor do atributo de alma         | int          | 4       | FK (Alma)             |
| tipoP         | Tipo do personagem (PC ou NPC)    | int          | 4       | NOT NULL              |

## Tabela : **Habilidade**

|                 |                                                      |  
| --------------- | ---------------------------------------------------- | 
| **Descrição**   | Armazena os dados de habilidades                     |
| **Observações** | Contém chave estrangeira referenciando a tabela Alma | 

| Nome         | Descrição                                                                                | Tipo de Dado | Tamanho | Restrições de domínio |
| ------------ | ---------------------------------------------------------------------------------------- | ------------ | ------- | --------------------- |
| idHabilidade | Identificador da habilidade.                                                             | int          | 4       | PK                    |
| alma         | Chave estrangeira referenciando Alma.                                                    | int          | 4       | FK                    |
| tipoHab      |                                                                                          |              |         |                       |

## Tabela : **Ataque**

|                 |                                                            | 
| --------------- | ---------------------------------------------------------- | 
| **Descrição**   | Armazenará as informações de habilidades de ataque         | 
| **Observações** | Possui chave estrangeira referenciando a tabela Habilidade.|

| Nome         | Descrição                                   | Tipo de Dado | Tamanho | Restrições de domínio  |
| ------------ | ------------------------------------------- | ------------ | ------- | ---------------------- |
| idHabilidade |                                             |              |         |PK, FK (Habilidade)     |  
| danoFisico   |                                             |              |         |                        |
| nome         |                                             |              |         |                        |
| danoMagico   |                                             |              |         |                        |
| custo        |                                             |              |         |                        |
| descricao    |                                             |              |         |                        |                             

## Tabela : **Passiva**

|                 |                                                            |
| --------------- | ---------------------------------------------------------- | 
| **Descrição**   | Armazenará as informações de habilidades passivas          | 
| **Observações** | Possui chave estrangeira referenciando a tabela Habilidade.|

| Nome         | Descrição                                                      | Tipo de Dado | Tamanho | Restrições de domínio  |
| ------------ | -------------------------------------------------------------- | ------------ | ------- | ---------------------- |
| idHabilidade |                                                                |              |         | PK, FK (Habilidade)    |  
| adAtqM       |                                                                |              |         |                        |
| adDefM       |                                                                |              |         |                        |
| adMenteMax   |                                                                |              |         |                        |
| adAgil       |                                                                |              |         |                        |
| adAtq        |                                                                |              |         |                        |
| adDef        |                                                                |              |         |                        |
| adHpMax      |                                                                |              |         |                        |
| nome         |                                                                |              |         |                        |
| custo        |                                                                |              |         |                        |
| descricao    |                                                                |              |         |                        |                

## Tabela : **Suporte**

|                 |                                                            | 
| --------------- | ---------------------------------------------------------- | 
| **Descrição**   | Armazenará as informações de habilidades de suporte        | 
| **Observações** | Possui chave estrangeira referenciando a tabela Habilidade | 

| Nome         | Descrição                                                      | Tipo de Dado | Tamanho | Restrições de domínio  |
| ------------ | -------------------------------------------------------------- | ------------ | ------- | ---------------------- |
| idHabilidade |                                                                |              |         | PK, FK (Habilidade)    |  
| nome         |                                                                |              |         |                        | 
| adAtqM       |                                                                |              |         |                        |
| adDefM       |                                                                |              |         |                        |
| adAgil       |                                                                |              |         |                        |
| adHp         |                                                                |              |         |                        |
| duracao      |                                                                |              |         |                        |
| custo        |                                                                |              |         |                        |
| descricao    |                                                                |              |         |                        |
  

## Tabela : **Item**

|                 |                                             |
| --------------- | ------------------------------------------- |
| **Descrição**   | Armazenará as informações de todos os itens |
| **Observações** |                                             | 

| Nome         | Descrição                                                | Tipo de Dado | Tamanho | Restrições de domínio  |
| ------------ | -------------------------------------------------------- | ------------ | ------- | ---------------------- |
| idItem       |                                                          |              |         | PK                     |
| tipoItem     | Qual é o tipo desse item                                 | varchar      |         | NOT NULL               |

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
